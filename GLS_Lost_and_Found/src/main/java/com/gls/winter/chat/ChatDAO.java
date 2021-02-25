package com.gls.winter.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gls.winter.BoardVO;
import com.gls.winter.user.UserVO;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ChatDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertChat(ChatVO vo) {
		int result = sqlSession.insert("Chat.insertChat", vo);
				return result;
	}
	public int updateChat(ChatVO vo) {
		int result = sqlSession.update("Chat.updateChat", vo);
		return result;
	}
	public int deleteChat(int seq) {
		int result = sqlSession.delete("Chat.deleteChat", seq);
		return result;
	}
	public ChatVO getChat(int seq) {
		return sqlSession.selectOne("Chat.getChat", seq);
	}
	public List<ChatVO> getChatList() {
		return sqlSession.selectList("Chat.getChatList");
	}
}