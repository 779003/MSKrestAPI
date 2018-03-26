package com.mskim.frontendService.apps.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mskim.frontendService.apps.dao.AppsDao;
import com.mskim.frontendService.apps.vo.ApiListVo;
import com.mskim.frontendService.apps.vo.AppsVo;

@Service
public class AppsService {

	@Autowired
	AppsDao appsDao;
	
	public boolean isKeyDuplicated(String apiKey){
		if(appsDao.countApiKey(apiKey) == 0){
			return false;
		}else{
			return true;
		}
	}
	
	public void insertApps(AppsVo appsVo){
		appsDao.insertApps(appsVo);
	}
	
	public List<AppsVo> selectAllApps(String memberId){
		return appsDao.selectAllApps(memberId);
	}
	
	public List<ApiListVo> selectApiList(String permission_level){
		return appsDao.selectApiList(permission_level);
	}
	
	public void insertApiQuota(AppsVo appsVo){
		appsDao.insertApiQuota(appsVo);
	}
	
	public AppsVo selectApp(String apiKey){
		return appsDao.selectApp(apiKey);
	}
	
	public void updateApp(AppsVo appsVo){
		appsDao.updateApp(appsVo);
	}
	
	public int appUsrCheck(HashMap<String, String> usrInfo) {
		return appsDao.appUsrCheck(usrInfo);
	}
	
}
