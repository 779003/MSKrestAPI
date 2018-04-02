package com.mskim.backendservice.fish.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.mskim.backendservice.common.ApiInfoVo;
import com.mskim.backendservice.common.Code;
import com.mskim.backendservice.common.api.ApiServiceInterface;
import com.mskim.backendservice.fish.dao.FishDao;
import com.mskim.backendservice.fish.vo.FishVo;
import com.mskim.frontendService.apps.dao.AppsDao;

@Service
public class FishService implements ApiServiceInterface{

	static final int MAX_QUOTA_USER = 200; 
	static final int MAX_QUOTA_ADMIN = 500; 
	static final String USER = "2"; 
	static final String ADMIN = "1"; 
	
	@Value("#{resourceProperties['gudide.code']}")
	private String guideCode;

	Gson gson = new Gson();
	
	@Autowired
	FishDao fishDao;
	
	@Autowired
	AppsDao appsDao;
	
	@Override
	public String resultWithCode(Object apiVo, Code code) {
		
		FishVo fishVo = new FishVo();
		fishVo = (FishVo) apiVo;
		
		ApiInfoVo info = new ApiInfoVo(fishVo.getVersion(), code);
		
		if(code.equals(Code.NO_RESULT_WITH_VALUE)){
			String reMessage = String.format(code.getMessage(), fishVo.getFish_name());
			info.setMessage(reMessage);
		}
		
		info.setInfomation(guideCode);
		String resultJsonToString = gson.toJson(info);
		return resultJsonToString;
	}

	@Override
	public String resultWithCode(Code code) {
		
		ApiInfoVo info = new ApiInfoVo(code);
		info.setInfomation(guideCode);
		String resultJsonToString = gson.toJson(info);
		return resultJsonToString;
	}

	@Override
	public int validityCheck(String apiKey, String apiSeq, String referer) {

		HashMap<String, String> requestInfo = new HashMap<String, String>();
		requestInfo.put("apiKey", apiKey);
		requestInfo.put("apiSeq", apiSeq);
		
		boolean notValidKey = appsDao.thisKeyCorrect(requestInfo) <= 0 ? true : false;		
		
		if (notValidKey) {
			return -8001;
		}
		
		HashMap<String, String> allowInfo = appsDao.selectAllowInfo(apiKey);
		String usrApiAllow = allowInfo.get("API_ALLOW");
		String usrPermissionLevel = allowInfo.get("PERMISSION_LEVEL");
		int usrCallCount = appsDao.selectCallCount(apiKey);
			
		if (usrApiAllow != null) {
			
			if(referer != null){
				usrApiAllow = usrApiAllow.replace("http://", "");   
				usrApiAllow = usrApiAllow.replace("https://", ""); 
				referer = referer.replace("http://", "");
				referer = referer.replace("https://", "");
				
				if(!referer.equals(usrApiAllow)){
						return -8003;				
					}
				
			}else{
				return -8002; 
			}
			
		}
		
		int remainingViews = usrPermissionLevel.equals(ADMIN) ?  MAX_QUOTA_ADMIN - usrCallCount : MAX_QUOTA_USER - usrCallCount;
		remainingViews = remainingViews < 0 ? 0 : remainingViews;
		
		return remainingViews;	
	}

	@Override
	public void callCount(String apiKey) {
		
		appsDao.callCount(apiKey);
	}
	
	@Override
	public boolean alreadyHasValue(String fishName) {
		
		 String fishSeq = getFishSeq(fishName);
		 if(fishSeq == null || fishDao.countFish(fishSeq) == 0) {
			 return false;
		 }else{
			return true;
		}	
	}
	
	public List<FishVo> selectAllFish(){
		return fishDao.selectAllFish();
	}
	
	public FishVo selectFish(String fishName) {
		return fishDao.selectFish(fishName);
	}
	
	public void insertFish(FishVo fishVo) {
		fishDao.insertFish(fishVo);
	}
	
	public void deleteFish(String fishSeq) {
		fishDao.deleteFish(fishSeq);
	}
	
	public void updateFish(FishVo fishVo) {
		fishDao.updateFish(fishVo);
	}
	
	public int countFish(String fishSeq) {
		return fishDao.countFish(fishSeq);
	}

	public String getFishSeq(String fishNmae) {
		return fishDao.getFishSeq(fishNmae);
	}
	
}
