package com.gls.winter.chat;

import com.gls.winter.user.UserVO;  

public class ChatVO {

	
	public int seq;
	private String fromID;
	private String toID;
	private String chatContent;


	public int getseq() {
		return seq;
	}
	public void setseq(int seq) {
		this.seq = seq;
	}
	public String getFromID() {
		return fromID;
	}
	public void setFromID(String fromID) {
		this.fromID = fromID;
	}
	public String getToID() {
		return toID;
	}
	public void setToID(String toID) {
		this.toID = toID;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	
	
}