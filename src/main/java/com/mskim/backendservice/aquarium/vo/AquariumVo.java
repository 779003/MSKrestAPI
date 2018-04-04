package com.mskim.backendservice.aquarium.vo;

import com.mskim.backendservice.common.ApiInfoVo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AquariumVo extends ApiInfoVo {
	private String aquarium_seq;
	private String aquarium_name;
	private String aquarium_address;
	private String aquarium_time;
	private String aquarium_tel;
}
