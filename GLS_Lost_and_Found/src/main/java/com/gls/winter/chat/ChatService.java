package com.gls.winter.chat;

import java.util.List;

public interface ChatService {
	public int insertChat(ChatVO vo);
	public int deleteChat(int seq);
	public int updateChat(ChatVO vo);
	public ChatVO getChat(int seq);
	public List<ChatVO> getChatList();
}