package com.mskim.backendservice.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.mskim.backendservice.common.ApiInfoVo;
import com.mskim.backendservice.common.Code;
import com.mskim.backendservice.common.api.ApiServiceInterface;
import com.mskim.backendservice.member.dao.MemberDao;
import com.mskim.backendservice.member.vo.MemberVo;
import com.mskim.frontendService.apps.dao.AppsDao;

@Service
public class MemberService implements ApiServiceInterface {

	static final int MAX_QUOTA_USER = 200; 
	static final int MAX_QUOTA_ADMIN = 500; 
	static final String USER = "2"; 
	static final String ADMIN = "1"; 
	
	
	@Value("#{resourceProperties['gudide.code']}")
	private String guideCode;

	Gson gson = new Gson();

	/**
     * {@link MemberDao} MemberDao
     */
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	AppsDao appsDao;
	
	@Override
	public String resultWithCode(Object apiVo, Code code) {
		
		MemberVo memberVo = new MemberVo();
		memberVo = (MemberVo) apiVo;		
		ApiInfoVo info = new ApiInfoVo(memberVo.getVersion(), code);
		
		if(code.equals(Code.UPDATE_ID) || code.equals(Code.DELETE_ID) || code.equals(Code.INSERT_ID)){
			
			String reMessage = String.format(code.getMessage(), memberVo.getId());
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
	public void callCount(String apiKey){
		appsDao.callCount(apiKey);
	}
	
	@Override
	public boolean alreadyHasValue(String memberId) {
		return memberDao.countId(memberId) == 0 ? false : true;
	}
	
	@Override
	public String dataMissingCheck(Object apiVo) {

		MemberVo memberVo = new MemberVo();
		memberVo = (MemberVo) apiVo;
		
		String missingField = "";
		
		if(memberVo.getId() == null) {
			missingField = missingField.equals("") ? "id" : ", id";
		}
		if(memberVo.getName() == null) {
			missingField += missingField.equals("") ? "name" : ", name";
		}
		if(memberVo.getGender() == null) {
			missingField += missingField.equals("") ? "gender" : ", gender";
		}
		if(memberVo.getPassword() == null) {
			missingField += missingField.equals("") ? "password" : ", password";
		}
		
		return missingField;
	}
	
	
	/**
	 * 여러 멤버 조회 버전1
	 * @param memberVo {@link MemberVo} 멤버 VO
	 * @return 멤버 목록
	 */
	public List<MemberVo> selectMembers() {
		
		return memberDao.selectMembers();
	}
	
	/**
	 * 여러 멤버 조회 버전2 (성별로 구분)
	 * @param String gender 성별
	 * @return 멤버 목록
	 */
	public List<MemberVo> selectMembers(String gender) {
		
		return memberDao.selectMembers(gender);
	}

	/**
	 * 멤버 조회
	 * @param memberVo {@link MemberVo} 멤버 VO
	 * @return 멤버
	 */
	public MemberVo selectMember(String memberId) {
		
		return memberDao.selectMember(memberId);
	}

	/**
	 * 멤버 등록
	 * @param memberVo {@link MemberVo} 멤버 VO
	 * @return 성공여부 int
	 */
	public int insertMember(MemberVo memberVo) {
		
		return memberDao.insertMember(memberVo);
	}

	/**
	 * 멤버 삭제
	 * @param memberVo {@link MemberVo} 멤버 VO
	 * @return 성공여부 int
	 */
	public int deleteMember(MemberVo memberVo) {
		
		return memberDao.deleteMember(memberVo);
	}

	/**
	 * 멤버 수정
	 * @param memberVo {@link MemberVo} 멤버 VO
	 * @return 성공여부 int
	 */
	public int updateMember(MemberVo memberVo) {
		
		return memberDao.updateMember(memberVo);
	}
}