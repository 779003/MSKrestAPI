package com.mskim.frontendService.apps.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mskim.backendservice.common.api.ApiKeyService;
import com.mskim.frontendService.apps.service.AppsService;
import com.mskim.frontendService.apps.vo.AppsVo;
import com.mskim.frontendService.usr.service.LoginService;

@Controller
@RequestMapping(value="/apps")
public class AppsController {

	@Autowired
	LoginService loginService;
	
	@Autowired
	ApiKeyService apiKeyService;
	
	@Autowired
	AppsService appsService;
	
	
	@RequestMapping(value="")
	public String appManagementMain(Model model, HttpSession session){
		
		if(loginService.getLoginMember(session) == null){
			return "redirect:/usr/login?currUrl=/apps";
		}
		
		String memberPermissionLevel = loginService.getLoginMember(session).getPermission_level();
		
		int maxQuota = 0;
		if(memberPermissionLevel.equals("2")){
			 maxQuota = 100;
		} else if(memberPermissionLevel.equals("1")){
			 maxQuota = 500;
		}
		
		model.addAttribute("ssMemberId",loginService.getLoginMember(session).getId());
		model.addAttribute("maxQuota", maxQuota);
		model.addAttribute("category1", "Open API 사용 관리");
		model.addAttribute("categoryLink", "/apps");
		model.addAttribute("content", "../myPage/managementApiMain.jsp");
		
		//Apps List
		List<AppsVo> myApps = appsService.selectAllApps(loginService.getLoginMember(session).getId());
		model.addAttribute("myApps", myApps);
		
		
		
		return "document/common/container";
	}
	
		
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String appRegisterPage(Model model, HttpSession session){
		
		if(loginService.getLoginMember(session) == null){
			return "redirect:/usr/login?currUrl=/apps/register";
		}
		model.addAttribute("ssMemberId",loginService.getLoginMember(session).getId());
		model.addAttribute("api_list", appsService.selectApiList(loginService.getLoginMember(session).getPermission_level()));
		model.addAttribute("category1", "Open API 사용 관리");
		model.addAttribute("category2", "오픈 API 신청");
		model.addAttribute("categoryLink", "/apps");
		model.addAttribute("content", "../myPage/registerApp.jsp");
		
		
		
		return "document/common/container";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String appRegister(Model model, HttpSession session, AppsVo appsVo){
		
		
		if(loginService.getLoginMember(session) == null){
			return "redirect:/usr/login?currUrl=/apps";
		}

		appsVo.setMember_id(loginService.getLoginMember(session).getId());
		appsVo.setApi_key(apiKeyService.makeApiKey());
		appsVo.setApi_allow(appsVo.getApi_allow());
		
		appsService.insertApps(appsVo);
		appsService.insertApiQuota(appsVo);
		
		return "redirect:/apps";
	}
	
	@RequestMapping(value="/modify/{apiKey}", method = RequestMethod.GET)
	public String modifyAppPage(HttpSession session, Model model, @PathVariable String apiKey){
		
		if(loginService.getLoginMember(session) == null){
			return "redirect:/usr/login?currUrl=/apps";
		}
		
		String memberId = loginService.getLoginMember(session).getId();

		HashMap<String, String> usrInfo = new HashMap<String, String>();
		usrInfo.put("api_key", apiKey);
		usrInfo.put("member_id", memberId);
		
		if(appsService.appUsrCheck(usrInfo) == 0){
			return "redirect:/apps";
		}
		
			model.addAttribute("ssMemberId", memberId);
			model.addAttribute("category1", "Open API 사용 관리");
			model.addAttribute("category2", "애플리케이션 수정");
			model.addAttribute("categoryLink", "/apps");
			model.addAttribute("content", "../myPage/modifyApp.jsp");
			
			AppsVo targetApp = appsService.selectApp(apiKey);
			model.addAttribute("targetApp", targetApp);
			
			return "document/common/container";
				
	}
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String modifyApp(HttpSession session, AppsVo appsVo){
		
		if(loginService.getLoginMember(session) == null){
			return "redirect:/usr/login?currUrl=/apps";
		}
		
		String memberId = loginService.getLoginMember(session).getId();

		HashMap<String, String> usrInfo = new HashMap<String, String>();
		usrInfo.put("api_key", appsVo.getApi_key());
		usrInfo.put("member_id", memberId);
		
		if(appsService.appUsrCheck(usrInfo) == 0){
			return "redirect:/apps";
		}else{
			appsService.updateApp(appsVo);
			return "redirect:/apps";
		}
	}
}
