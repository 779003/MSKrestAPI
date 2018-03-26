package com.mskim.backendservice.common;

import lombok.Getter;

/**
 * 버전정보 enum
 */
@Getter
public enum Version {
	VERSION_1("v1"),
	VERSION_2("v2")
	;
	
	
	private final String shortName;
	
	private Version(String shortName) {
		this.shortName = shortName;
	}
	
	
	/**
	 * <p>문자로 작성된 버전을 받아 {@link Version}을 리턴 (Version.shortName 와 매칭), 
	 * <p>{@link Version}에 해당 버전이 없을 경우 null 리턴
	 * 
	 * @param shortName 
	 * 		  문자로 작성된 버전
	 * @return 매개 문자열과 매칭되는 버전enum
	 */
	public static Version getVersionByString(String shortName){
		for(Version version : values()){
			if(version.shortName.equals(shortName)){
				return version;
			}
		}
		return null;
	}
}
