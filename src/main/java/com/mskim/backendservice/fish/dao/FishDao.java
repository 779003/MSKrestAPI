package com.mskim.backendservice.fish.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mskim.backendservice.fish.vo.FishVo;

@Repository
public class FishDao {

	@Autowired
	private SqlSession sqlsession;
	
	public void setSqlSession(SqlSession sqlSession){
		this.sqlsession = sqlSession;
	}
	
	public List<FishVo> selectAllFish(){
		return sqlsession.selectList("fish.selectAllFish");
	}
	
	public FishVo selectFish(String fishName) {
		return sqlsession.selectOne("fish.selectFish", fishName);
	}
	
	public void insertFish(FishVo fishVo) {
		sqlsession.insert("fish.insertFish", fishVo);
	}
	
	public void deleteFish(String fishSeq) {
		sqlsession.delete("fish.deleteFish", fishSeq);
	}
	
	public void updateFish(FishVo fishVo) {
		sqlsession.update("fish.updateFish", fishVo);
	}
	
	public int countFish(String fishSeq) {
		return sqlsession.selectOne("fish.countFish", fishSeq);
	}
	
	public String getFishSeq(String fishName) {
		return sqlsession.selectOne("fish.getFishSeq", fishName);
	}
}
