package com.mskim.backendservice.common.api;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mskim.frontendService.apps.service.AppsService;

@Service
public class ApiKeyService {

	@Autowired
	AppsService appsService;
	
	public String makeApiKey(){
		
		String apiKey = "";		
		Random random = new Random();
		
		for (int i = 0; i < 20; i++) {
			if(random.nextBoolean()){
				if(random.nextBoolean()){
					apiKey += (char)(random.nextInt(26)+65); //대문자 랜덤 1자
				}else{
					apiKey += (char)(random.nextInt(26)+97); //소문자 랜덤 1자
				}
			}else{
				apiKey += random.nextInt(10);
			}
		}
		
		while (appsService.isKeyDuplicated(apiKey)) {
			apiKey = makeApiKey();
		}
		return apiKey;
	}
	
}
