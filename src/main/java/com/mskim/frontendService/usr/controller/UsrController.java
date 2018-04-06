package com.mskim.frontendService.usr.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mskim.backendservice.member.service.MemberService;
import com.mskim.backendservice.member.vo.MemberVo;
import com.mskim.frontendService.usr.service.LoginService;

@Controller
@RequestMapping(value="/usr")
public class UsrController {

	@Autowired
	LoginService loginService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String goLogin(HttpServletRequest request, HttpSession session, String currUrl) {

		MemberVo loginMember = (MemberVo) session.getAttribute("loginSession");

		if (loginMember == null) {
			return "usr/login";
		} else {
			currUrl = (currUrl == null || currUrl == "") ? "/docs" : currUrl;
			return "redirect:" + currUrl;
		}
	}
		
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String memberLogin(MemberVo memberVo, HttpSession session, String currUrl) {

		//임시 로그인처리
		memberVo.setId("admin");
		memberVo.setPassword("alstn12#");
		/////////////////////
		
		memberVo.setPassword(Integer.toString(memberVo.getPassword().hashCode()));
		
		if (loginService.memberLogin(memberVo) > 0) {
			session.setAttribute("loginSession", memberService.selectMember(memberVo.getId()));
			currUrl = currUrl.replace(",", "");
			currUrl = (currUrl == null || currUrl == "") ? "/docs" : currUrl;
			return "redirect:" + currUrl;
		} else {
			return "usr/login";
		}

	}
	
	
	@RequestMapping(value="/logout")
	public String logout(Model model, HttpSession session){
		session.removeAttribute("loginSession");
		
		return "redirect:/docs";
	}

	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String register(Model model, HttpSession session){
		session.removeAttribute("loginSession");
		
		return "usr/registerUsr";
	}
	
	
}
