package com.mskim.frontendService.usr.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mskim.backendservice.member.vo.MemberVo;
import com.mskim.frontendService.usr.dao.LoginDao;


@Service
public class LoginService {

	@Autowired
	LoginDao loginDao;
	
	public int memberLogin(MemberVo memberVo){
		return loginDao.memberLogin(memberVo);
	}
	
	public MemberVo getLoginMember(HttpSession session){
		if(session.getAttribute("loginSession") != null){
			MemberVo loginMember = (MemberVo) session.getAttribute("loginSession");
		  	return loginMember;
		}else{
			return null;
		}
	}
	
}
