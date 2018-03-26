package com.mskim.backendservice.member.vo;

import lombok.Getter;
import lombok.Setter;

import com.mskim.backendservice.common.ApiInfoVo;
import com.mskim.backendservice.common.Code;

@Getter
@Setter
public class MemberVo extends ApiInfoVo {

	private String id;
	private String password;
	private String name;
	private String gender;
	private String permission_level;
	private String question;
	private String answer;
	
	public MemberVo() {
	}

	public MemberVo(String version, Code code) {
		super(version, code);
	}
	
}