package com.mskim.frontendService.document.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mskim.frontendService.usr.service.DocsPageEnum;
import com.mskim.frontendService.usr.service.LoginService;

@Controller
@RequestMapping(value="/docs")
public class DocumentController {

	@Autowired
	LoginService loginService;
	
	@RequestMapping(value="")
	public String documentMain(Model model, HttpSession session){
		String ssMemberId = loginService.getLoginMember(session) == null ? "" :  loginService.getLoginMember(session).getId();
		model.addAttribute("ssMemberId", ssMemberId);
		model.addAttribute("category1", "백엔드 서비스 소개");
		model.addAttribute("categoryLink", "/docs");
		model.addAttribute("content", "document/docMain.jsp");
		return "document/common/container";
	}
	
	@RequestMapping(value="{pageUrl}")
	public String documentContents(@PathVariable String pageUrl ,Model model, HttpSession session){
		
		String ssMemberId = loginService.getLoginMember(session) == null ? "" :  loginService.getLoginMember(session).getId();
		model.addAttribute("ssMemberId", ssMemberId);
		
		DocsPageEnum docsPageUrl = DocsPageEnum.getPageEnumByString(pageUrl);
		switch (docsPageUrl) {
		case CODE:
			model.addAttribute("category1", "오류 코드 정리");
			model.addAttribute("categoryLink", "/docs/code");
			model.addAttribute("content", "document/codeInfo.jsp");
			break;
		case KEY:
			model.addAttribute("category1", "OpenAPI 사용방법");
			model.addAttribute("category2", "키 발급");
			model.addAttribute("categoryLink", "/docs/key");
			model.addAttribute("content", "document/manualKey.jsp");
			break;
		case API_USE:
			model.addAttribute("category1", "OpenAPI 사용방법");
			model.addAttribute("category2", "API 호출");
			model.addAttribute("categoryLink", "/docs/api-use");
			model.addAttribute("content", "document/manualApiUse.jsp");
			break;			
		case STATS:
			model.addAttribute("category1", "OpenAPI 사용방법");
			model.addAttribute("category2", "통계표 확인");
			model.addAttribute("categoryLink", "/docs/stats");
			model.addAttribute("content", "document/manualStats.jsp");
			break;			
		case AQUARIUMINFO:
			model.addAttribute("category1", "국내 수족관 정보 API");
			model.addAttribute("category2", "데이터 구조 및 예제");
			model.addAttribute("categoryLink", "/docs/aquariumInfo");
			model.addAttribute("content", "api_aquariumInfo/aquariumContainer.jsp");
			break;
		case FISH_INFO:
			model.addAttribute("category1", "열대어 정보 API");
			model.addAttribute("category2", "데이터 구조 및 예제");
			model.addAttribute("categoryLink", "/docs/fishInfo");
			model.addAttribute("content", "api_fish/fishContainer.jsp");
			break;
		case MAIN: default:
			model.addAttribute("category1", "백엔드 서비스 소개");
			model.addAttribute("categoryLink", "/docs");
			model.addAttribute("content", "document/docMain.jsp");
			break;
		}
		
		return "document/common/container";
		
	}
	
	
	
	
}
