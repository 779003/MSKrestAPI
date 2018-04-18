package com.mskim.frontendService.apps.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mskim.frontendService.apps.vo.ApiListVo;
import com.mskim.frontendService.apps.vo.AppsVo;

@Repository
public class AppsDao{

	@Autowired
	private SqlSession sqlsession;
	
	public int countApiKey(String apiKey) {
		return sqlsession.selectOne("apps.countApiKey", apiKey);
	}

	public void insertApps(AppsVo appsVo) {
		sqlsession.insert("apps.insertApps", appsVo);		
	}

	public List<AppsVo> selectAllApps(String memberId) {
		return sqlsession.selectList("apps.selectAllApps", memberId);
	}

	public int countAllApps(String memberId){
		return sqlsession.selectOne("apps.countAllApps", memberId);
	}
	
	public List<ApiListVo> selectApiList(String permission_level) {
		return sqlsession.selectList("apps.selectApiList", permission_level);
	}

	public void insertApiQuota(AppsVo appsVo){
		sqlsession.insert("apps.insertApiQuota", appsVo);
	}

	public AppsVo selectApp(String apiKey) {
		return sqlsession.selectOne("apps.selectApp", apiKey);
	}

	public void updateApp(AppsVo appsVo) {
		sqlsession.update("apps.updateApp", appsVo);
	}
	
	public void deleteApp(String apiKey) {
		sqlsession.delete("apps.deleteApp", apiKey);
	}
	
	public void deleteQuota(String apiKey) {
		sqlsession.delete("apps.deleteQuota", apiKey);
	}

	public int appUsrCheck(HashMap<String, String> usrInfo) {
		return sqlsession.selectOne("apps.appUsrCheck", usrInfo);
	}
	
	public int thisKeyCorrect(HashMap<String, String> requestInfo){
		return sqlsession.selectOne("apps.thisKeyCorrect", requestInfo);
	}
	
	public HashMap<String, String> selectAllowInfo(String apiKey){
		return sqlsession.selectOne("apps.selectAllowInfo", apiKey);
	}
	
	public int selectCallCount(String apiKey){
		return sqlsession.selectOne("apps.selectCallCount", apiKey);
	}
	
	public void callCount(String apiKey){
		sqlsession.selectOne("apps.callCount", apiKey);
	}
	
	public int getPermissionByApiKey(String apiKey){
		return sqlsession.selectOne("apps.getPermissionByApiKey", apiKey);
	}
}
