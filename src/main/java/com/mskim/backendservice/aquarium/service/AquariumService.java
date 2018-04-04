package com.mskim.backendservice.aquarium.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.mskim.backendservice.aquarium.dao.AquariumDao;
import com.mskim.backendservice.aquarium.vo.AquariumVo;
import com.mskim.backendservice.common.ApiInfoVo;
import com.mskim.backendservice.common.Code;
import com.mskim.backendservice.common.api.ApiServiceInterface;
import com.mskim.frontendService.apps.dao.AppsDao;

@Service
public class AquariumService implements ApiServiceInterface {

	static final int MAX_QUOTA_USER = 200; 
	static final int MAX_QUOTA_ADMIN = 500; 
	static final String USER = "2"; 
	static final String ADMIN = "1"; 
	
	@Value("#{resourceProperties['gudide.code']}")
	private String guideCode;

	Gson gson = new Gson();
	
	@Autowired
	AquariumDao aquariumDao;
	
	@Autowired
	AppsDao appsDao;

	@Override
	public String resultWithCode(Object apiVo, Code code) {

		AquariumVo aquariumVo = new AquariumVo();
		aquariumVo = (AquariumVo) apiVo;
		
		ApiInfoVo info = new ApiInfoVo(aquariumVo.getVersion(), code);
		
		if(code.equals(Code.NO_RESULT_WITH_VALUE)){
			String reMessage = String.format(code.getMessage(), aquariumVo.getAquarium_name());
			info.setMessage(reMessage);
		}
		
		info.setInfomation(guideCode);
		String resultJsonToString = gson.toJson(info);
		return resultJsonToString;
	}

	@Override
	public String resultWithCode(String message, Code code) {
		
		String reMessage = String.format(code.getMessage(), message);
		ApiInfoVo info = new ApiInfoVo(code);		
		info.setInfomation(guideCode);
		info.setMessage(reMessage);
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
			return -2001;
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
						return -2003;				
					}
				
			}else{
				return -2002; 
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
	public boolean alreadyHasValue(String aquariumSeq) {
		
		if(aquariumDao.countAquarium(aquariumSeq) == 0) {
			 return false;
		 }else{
			return true;
		}
	}
	
	@Override
	public String dataMissingCheck(Object apiVo) {

		AquariumVo aquariumVo = new AquariumVo();
		aquariumVo = (AquariumVo) apiVo;
		
		String missingField = "";
			
		if(aquariumVo.getAquarium_name() == null) {
			missingField = missingField.equals("") ? "aquarium_name" : ", aquarium_name";
		}
		if(aquariumVo.getAquarium_address() == null) {
			missingField += missingField.equals("") ? "aquarium_address" : ", aquarium_address";
		}
		if(aquariumVo.getAquarium_time() == null) {
			missingField += missingField.equals("") ? "aquarium_time" : ", aquarium_time";
		}
		if(aquariumVo.getAquarium_tel() == null) {
			missingField += missingField.equals("") ? "aquarium_tel" : ", aquarium_tel";
		}
		
		return missingField;
	}
	
	
	public List<AquariumVo> selectAquariums(){
		return aquariumDao.selectAquariums();
	}
	
	public AquariumVo selectAquarium(String aquariumSeq){
		return aquariumDao.selectAquarium(aquariumSeq);
	}
	
	public void insertAquarium(AquariumVo aquariumVo){
		aquariumDao.insertAquarium(aquariumVo);
	}
	
	public void deleteAquarium(String aquariumSeq){
		aquariumDao.deleteAquarium(aquariumSeq);
	}
	
	public void updateAquarium(AquariumVo aquariumVo){
		aquariumDao.updateAquarium(aquariumVo);
	}
	
	public int countAquarium(String aquariumSeq){
		return aquariumDao.countAquarium(aquariumSeq);
	}
}
