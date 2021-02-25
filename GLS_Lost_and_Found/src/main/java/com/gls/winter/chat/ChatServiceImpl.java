package com.gls.winter.chat;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service 
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	ChatDAO ChatDAO;

	@Override
	public int insertChat(ChatVO vo) {
		return ChatDAO.insertChat(vo);
	}

	@Override
	public int deleteChat(int seq) {
		return ChatDAO.deleteChat(seq);
	}

	@Override
	public int updateChat(ChatVO vo) {
		return ChatDAO.updateChat(vo);
	}

	@Override
	public ChatVO getChat(int seq) {
		return ChatDAO.getChat(seq);
	}

	@Override
	public List<ChatVO> getChatList() {
		return ChatDAO.getChatList();
	}
}