package com.mskim.backendservice.common.log.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mskim.backendservice.common.log.dao.LogDao;
import com.mskim.backendservice.common.log.vo.LogVo;

@Service
public class LogService {

	@Autowired
	LogDao logDao;	

	public void insertLog(HttpServletRequest request, String success, String apikey, String API_SEQ, String errorCode, String logType){
		
		LogVo logVo = new LogVo();
		logVo.setApi_key(apikey);
		logVo.setSuccess(success);
		logVo.setApi_seq(API_SEQ);
		logVo.setLog_type(logType);
		
		if(request.getHeader("accept_time") != null){
			logVo.setAccept_time(request.getHeader("accept_time"));
		}
		if(request.getHeader("referer") != null){		
			logVo.setReferer(request.getHeader("referer"));
		}
		if(request.getRemoteHost() != null){		
			logVo.setRemote_host(request.getRemoteHost());
		}
		if(request.getRequestURI() != null){			
			logVo.setRequest_url(request.getRequestURI());		
		}
		if(errorCode != null){
			logVo.setError_code(errorCode);
		}
		
		logDao.insertLog(logVo);
	}
	
}