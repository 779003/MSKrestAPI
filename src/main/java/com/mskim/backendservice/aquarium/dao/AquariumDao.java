package com.mskim.backendservice.aquarium.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mskim.backendservice.aquarium.vo.AquariumVo;

@Repository
public class AquariumDao {

	@Autowired
	private SqlSession sqlsession;
	
	public void setSqlSession(SqlSession sqlSession){
		this.sqlsession = sqlSession;
	}
	
	public List<AquariumVo> selectAquariums(){
		return sqlsession.selectList("aquarium.selectAquariums");
	}
	
	public AquariumVo selectAquarium(String aquariumSeq){
		return sqlsession.selectOne("aquarium.selectAquarium", aquariumSeq);
	}
	
	public void insertAquarium(AquariumVo aquariumVo){
		sqlsession.insert("aquarium.insertAquarium", aquariumVo);
	}
	
	public void deleteAquarium(String aquariumSeq){
		sqlsession.delete("aquarium.deleteAquarium", aquariumSeq);
	}
	
	public void updateAquarium(AquariumVo aquariumVo){
		sqlsession.update("aquarium.updateAquarium", aquariumVo);
	}
	
	public int countAquarium(String aquariumSeq){
		return sqlsession.selectOne("aquarium.countAquarium", aquariumSeq);
	}
}