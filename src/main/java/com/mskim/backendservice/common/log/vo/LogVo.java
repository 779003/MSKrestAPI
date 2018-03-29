package com.mskim.backendservice.common.log.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LogVo {
	private String api_key; 
	private String api_seq; 
	private String referer;
	private String accept_time; 
	private String success;
	private String remote_host; 
	private String request_url;
	private String error_code;
	private String log_type;
	
	public LogVo() {
		this.referer = "";      
		this.accept_time = "";  
		this.remote_host = "";  
		this.request_url = "";  
		this.error_code = "";
	}

	public LogVo(String api_key, String api_seq, String success, String error_code, String log_type) {
		this.api_key = api_key;
		this.api_seq = api_seq;
		this.success = success;
		this.log_type = log_type;
		this.referer = "";      
		this.accept_time = "";  
		this.remote_host = "";  
		this.request_url = "";  
		this.error_code = "";
		if(error_code != null) {
			this.error_code = error_code;
		}
	}
	
	
	
	
	
	
	
}
