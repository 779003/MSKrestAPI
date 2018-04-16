package com.mskim.frontendService.stats.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatsDao {

	@Autowired
	private SqlSession sqlsession;
	
	public List<HashMap<String, String>> appList(String memberId){
		return sqlsession.selectList("stats.appList", memberId);
	}
	
	public HashMap<String, String> statsDetailMain(String apiKey){
		return sqlsession.selectOne("stats.statsDetailMain", apiKey);
	}
	
	public HashMap<String, String> statsToday(HashMap<String, String> statsParam){
		return sqlsession.selectOne("stats.statsToday", statsParam);
	}
	
	public List<HashMap<String, String>> statsCall(HashMap<String, String> statsParam){
		return sqlsession.selectList("stats.statsCall", statsParam);
	}
	
	public List<HashMap<String, String>> statsError(String apiKey){
		return sqlsession.selectOne("stats.statsError", apiKey);
	}
	
	public List<HashMap<String, String>> statsReferer(String apiKey){
		return sqlsession.selectOne("stats.statsReferer", apiKey);
	}
	
	public List<HashMap<String, String>> statsLogList(String apiKey){
		return sqlsession.selectOne("stats.statsLogList", apiKey);
	}
	
}
