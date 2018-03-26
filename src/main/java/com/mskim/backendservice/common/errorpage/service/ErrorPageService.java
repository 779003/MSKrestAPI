package com.mskim.backendservice.common.errorpage.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.mskim.backendservice.common.ApiInfoVo;
import com.mskim.backendservice.common.Code;

@Service
public class ErrorPageService {

	@Value("#{resourceProperties['gudide.code']}")
	private String guideCode;

	Gson gson = new Gson();

	public String resultWithCode(Code code) {
		ApiInfoVo info = new ApiInfoVo(null, code);
		info.setInfomation(guideCode);
		String resultJsonToString = gson.toJson(info);
		return resultJsonToString;
	}

}