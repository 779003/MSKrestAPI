package com.mskim.backendservice.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApiInfoVo {
	private String version;
	private String code;
	private String message;
	private String infomation;

	
	public ApiInfoVo() {
	}

	public ApiInfoVo(Code code) {
		this.code = code.getCode();
		this.message = code.getMessage();
	}
		
	public ApiInfoVo(String version, Code code) {
		this.version = version;
		this.code = code.getCode();
		this.message = code.getMessage();
	}
	
}
