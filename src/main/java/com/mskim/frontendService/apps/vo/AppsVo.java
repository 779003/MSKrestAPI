package com.mskim.frontendService.apps.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AppsVo {
	private String app_name;
	private String api_key;
	private String use_api;
	private String api_allow;
	private String reg_dt;
	private String mod_dt;
	private String use_yn;
	private String member_id;
	private String description;
	private String api_name_kor;
	private int api_seq;
	private int call_count;
}
