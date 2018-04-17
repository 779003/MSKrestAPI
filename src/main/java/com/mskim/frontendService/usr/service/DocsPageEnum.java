package com.mskim.frontendService.usr.service;

import lombok.Getter;

@Getter
public enum DocsPageEnum {
	MAIN(""),
	CODE("code"),
	KEY("key"),
	STATS("stats"),
	API_USE("api-use"),
	AQUARIUMINFO("aquariumInfo"),
	FISH_INFO("fishInfo");
	
	private final String url;

	private DocsPageEnum(String url) {
		this.url = url;
	}

	public static DocsPageEnum getPageEnumByString(String pageUrl){
		for (DocsPageEnum docsPageEnum : values()) {
			if(docsPageEnum.url.equals(pageUrl)){
				return docsPageEnum;
			}
		}
		return MAIN;
	}

	
	
}
