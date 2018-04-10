package com.mskim.backendservice.member.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.mskim.backendservice.member.vo.MemberVo;

@Repository
public class MemberDao{

	@Autowired
	private SqlSession sqlsession;
	
	public void setSqlSession(SqlSession sqlSession){
		this.sqlsession = sqlSession;
	}
	
	/**
	 * 여러 멤버 조회 버전1
	 * @param memberVo {@link MemberVo} 멤버 VO
	 * @return 멤버 목록
	 */
	public List<MemberVo> selectMembers() {
		return sqlsession.selectList("member.selectMembers");
	}
	
	/**
	 * 여러 멤버 조회 버전2 (성별로 구분)
	 * @param String gender 멤버 VO
	 * @return 멤버 목록
	 */
	public List<MemberVo> selectMembers(String gender) {
		return sqlsession.selectList("member.selectMembers", gender);
	}

	/**
	 * 멤버 조회
	 * @param memberVo {@link MemberVo} 멤버 VO
	 * @return 멤버
	 */
	public MemberVo selectMember(String memberId) {
		return sqlsession.selectOne("member.selectMember", memberId);
	}

	/**
	 * 멤버 등록
	 * @param memberVo {@link MemberVo} 멤버 VO
	 * @return 성공여부 int
	 */
	public int insertMember(MemberVo memberVo) {
		return sqlsession.insert("member.insertMember", memberVo);
	}

	/**
	 * 멤버 삭제
	 * @param memberVo {@link MemberVo} 멤버 VO
	 * @return 성공여부 int
	 */
	public int deleteMember(MemberVo memberVo) {
		return sqlsession.delete("member.deleteMember", memberVo);
	}

	/**
	 * 멤버 수정
	 * @param memberVo {@link MemberVo} 멤버 VO
	 */
	public void updateMember(MemberVo memberVo) {
		sqlsession.update("member.updateMember", memberVo);
	}

	/**
	 * 멤버 ID 중복체크를 위한 갯수 확인
	 * @param memberId {@link String} 멤버 ID
	 * @return DB에 저장된 ID 수 
	 */
	public int countId(String memberId) {
		return sqlsession.selectOne("member.countId", memberId);
	}

	public int questionAndAnswer(MemberVo memberVo) {
		return sqlsession.selectOne("member.questionAndAnswer", memberVo);
	}
	
	public void resetPassword(MemberVo memberVo) {
		sqlsession.update("member.resetPassword", memberVo);
	}

}