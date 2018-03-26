package com.mskim.frontendService.usr.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mskim.backendservice.member.vo.MemberVo;

@Repository
public class LoginDao{
	@Autowired
	private SqlSession sqlsession;

	public int memberLogin(MemberVo memberVo) {
		return sqlsession.selectOne("login.memberLogin", memberVo);
	}
}
