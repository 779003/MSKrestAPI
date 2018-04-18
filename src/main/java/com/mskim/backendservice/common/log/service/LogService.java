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

	public void insertLog(HttpServletRequest request, LogVo logVo) {

		if (request.getHeader("referer") != null) {
			logVo.setReferer(request.getHeader("referer"));
		}
		if (request.getRemoteHost() != null) {
			logVo.setRemote_host(request.getRemoteHost());
		}
		if (request.getRequestURI() != null) {
			logVo.setRequest_url(request.getRequestURI());
		}

		try {

			logDao.insertLog(logVo);
			
		} catch (Exception e) {

			e.printStackTrace();
		}

	}
	
	public void insertLog(HttpServletRequest request, LogVo logVo, String requestUrl) {
		
		if (request.getHeader("referer") != null) {
			logVo.setReferer(request.getHeader("referer"));
		}
		if (request.getRemoteHost() != null) {
			logVo.setRemote_host(request.getRemoteHost());
		}
		if (requestUrl != null) {
			logVo.setRequest_url(requestUrl);
		}
		
		try {
			
			logDao.insertLog(logVo);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}

}