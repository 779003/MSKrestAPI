package com.mskim.frontendService.stats;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mskim.frontendService.stats.dao.StatsDao;

@Service
public class StatsService {

	@Autowired
	StatsDao statsDao;
	
	public List<HashMap<String, String>> appList(String memberId){
		return statsDao.appList(memberId);
	}
	
	public HashMap<String, String> statsDetailMain(String apiKey){
		return statsDao.statsDetailMain(apiKey);
	}
	
	public HashMap<String, String> statsToday(HashMap<String, String> statsParam){
		return statsDao.statsToday(statsParam);
	}
	
	public List<HashMap<String, String>> statsCall(HashMap<String, String> statsParam){
		return statsDao.statsCall(statsParam);
	}
	
	public List<HashMap<String, String>> statsError(String apiKey){
		return statsDao.statsError(apiKey);
	}
	
	public List<HashMap<String, String>> statsReferer(String apiKey){
		return statsDao.statsReferer(apiKey);
	}
	
	public List<HashMap<String, String>> statsLogList(String apiKey){
		return statsDao.statsLogList(apiKey);
	}
}
