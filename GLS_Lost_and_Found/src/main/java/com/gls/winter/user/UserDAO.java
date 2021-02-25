package com.gls.winter.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.gls.winter.user.UserVO;



@Repository
public class UserDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	private String userid;
	
	public UserVO getUser(UserVO vo) {
		return sqlSession.selectOne("User.getUser", vo);
	}
	public int insertUser(UserVO vo) {
		int result = sqlSession.insert("User.insertUser", vo);
		return result;
	}
	public UserVO getUserid(UserVO vo) {
		return sqlSession.selectOne("User.getUserid", vo);
	}
}
