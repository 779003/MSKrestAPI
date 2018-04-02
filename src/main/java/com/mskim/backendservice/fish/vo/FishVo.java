package com.mskim.backendservice.fish.vo;

import com.mskim.backendservice.common.ApiInfoVo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FishVo extends ApiInfoVo {
	
	private String fish_seq;
	private String fish_name;
	private String fish_imgurl;
	private String fish_content;
	private String orgn_url;
		
}
