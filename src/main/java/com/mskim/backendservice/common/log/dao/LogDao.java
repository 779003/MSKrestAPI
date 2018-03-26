package com.mskim.backendservice.common.log.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mskim.backendservice.common.log.vo.LogVo;

@Repository
public class LogDao {

	@Autowired
	private SqlSession sqlsession;
	
	public void insertLog(LogVo logVo){
		sqlsession.insert("log.insertLog", logVo);
	}
	
}
