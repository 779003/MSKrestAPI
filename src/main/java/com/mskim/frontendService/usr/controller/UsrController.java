package com.mskim.frontendService.usr.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String goLogin(HttpSession session, String currUrl) {

		MemberVo loginMember = (MemberVo) session.getAttribute("loginSession");

		if (loginMember == null) {
			return "usr/login";
		} else {
			currUrl = (currUrl == null || currUrl == "") ? "/docs" : currUrl;
			return "redirect:" + currUrl;
		}
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String memberLogin(MemberVo memberVo, HttpSession session, String currUrl, RedirectAttributes redirectAttr) {
		
		if (loginService.memberLogin(memberVo) > 0) {
			session.setAttribute("loginSession", memberService.selectMember(memberVo.getId()));
			currUrl = currUrl.replace(",", "");
			currUrl = (currUrl == null || currUrl == "") ? "/docs" : currUrl;
			return "redirect:" + currUrl;
		} else {
			redirectAttr.addFlashAttribute("alert","비밀번호가 틀렸습니다.");
			redirectAttr.addFlashAttribute("memberId",memberVo.getId());
			return "redirect:/usr/login";
		}
	}
	
	@RequestMapping(value="/logout")
	public String logout(Model model, HttpSession session){
		session.removeAttribute("loginSession");
		return "redirect:/docs";
	}

	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String registerUsrPage(Model model, HttpSession session){
		session.removeAttribute("loginSession");
		return "usr/registerUsr";
	}

	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String registerUsr(Model model, MemberVo memberVo, RedirectAttributes redirectAttr){
		
		if(!memberService.alreadyHasValue(memberVo.getId())) {
			memberService.insertMember(memberVo);
			redirectAttr.addFlashAttribute("alert", "회원가입이 완료되었습니다.");
			return "redirect:/docs";
		}else {
			redirectAttr.addFlashAttribute("alert", "잘못된 접근입니다.");
			return "redirect:/docs";
		}
	}
	
	@RequestMapping(value="/validCheck/id", method = RequestMethod.POST)
	public @ResponseBody boolean idCheck(String memberId) {
		return memberService.alreadyHasValue(memberId);
	}

	@RequestMapping(value="/findPassword", method = RequestMethod.GET)
	public String findPasswordPage(Model model, HttpSession session){
			return "usr/findPassword";
	}
	
	@RequestMapping(value="/question", method = RequestMethod.POST)
	public String findPassword(Model model, HttpSession session, String memberId, RedirectAttributes redirectAttr){
		
		if(memberService.alreadyHasValue(memberId)) {
			MemberVo memberVo = memberService.selectMember(memberId);
			model.addAttribute("question", memberVo.getQuestion());
			model.addAttribute("memberId", memberId);
			return "/usr/question";
		}else {
			redirectAttr.addFlashAttribute("alert", "없는 계정입니다.");
			return "redirect:/usr/findPassword";
		}
	}

	@RequestMapping(value="/answer", method = RequestMethod.POST)
	public String findPasswordGetAnswer(Model model, MemberVo memberVo, RedirectAttributes redirectAttr){
		
		if(memberService.questionAndAnswer(memberVo)) {
			memberService.resetPassword(memberVo);
			redirectAttr.addFlashAttribute("alert", "비밀번호가 초기화되었습니다.\\n비밀번호가 아이디와 같게 변경되었으니 로그인 후 마이페이지에서 수정해주세요.");
			return "redirect:/docs";
		}else {
			model.addAttribute("alert", "틀렸습니다. 다시 입력해주세요.");
			model.addAttribute("question", memberVo.getQuestion());
			model.addAttribute("memberId", memberVo.getId());
			return "/usr/question";
		}
	}
	
	@RequestMapping(value ="modify", method = RequestMethod.GET)
	public String modifyUsrPage(Model model, HttpSession session) {
		        
        if(session == null) {
        	return "redirect:/usr/login?currUrl=/usr/modify";
        }
        if(loginService.getLoginMember(session) == null){
        	return "redirect:/usr/login?currUrl=/usr/modify";
        }
                
        MemberVo memberVo = loginService.getLoginMember(session);
        model.addAttribute("memberVo", memberVo);
        
		return "/usr/modifyUsr";
	}
	
	@RequestMapping(value ="modify", method = RequestMethod.POST)
	public String modifyUsr(Model model, HttpSession session, MemberVo memberVo, RedirectAttributes redirectAttr) {
		
		MemberVo sessionMemberVo = loginService.getLoginMember(session);
		if(!memberVo.getId().equals(sessionMemberVo.getId())) {
			redirectAttr.addFlashAttribute("alert", "잘못된 접근입니다.");
		}
		
		memberService.updateMember(memberVo);
		session.setAttribute("loginSession", memberService.selectMember(memberVo.getId()));
		 
		redirectAttr.addFlashAttribute("alert", "정보 수정이 완료되었습니다.");
		return "redirect:/docs";
	}

}

