package com.gls.winter.chat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.List;    
import com.gls.winter.chat.ChatVO;
import com.gls.winter.user.UserServiceImpl;
import com.gls.winter.chat.ChatService;

import com.gls.winter.chat.ChatDAO;

@Controller
@RequestMapping(value="/chat")
public class ChatController {
	
	@Autowired
	ChatDAO ChatDAO;
	@Autowired
	ChatService ChatService;

	

    /* It provides list of employees in model object */    

    @RequestMapping("/chat_page")    
    public String chat_page(Model m){    
        List<ChatVO> list=ChatDAO.getChatList();    
        m.addAttribute("list",list);  
        return "chat_page";    
    } 
	
	@RequestMapping(value = "/chatok", method = RequestMethod.POST)
	public String addPostOK(ChatVO vo) {
		if(ChatService.insertChat(vo) == 0)
			System.out.println("데이터 추가 실패");
		else
			System.out.println("데이터 추가 성공!!");
		return "redirect:chat_page";
	}
	
	@RequestMapping(value = "/deleteok/{id}", method = RequestMethod.GET)
	public String deletePost(@PathVariable("id") int id) {
		int i = ChatService.deleteChat(id);
		if(i == 0)
			System.out.println("데이터 삭제 실패 ");
		else 
			System.out.println("데이터 삭제 성공!!!");
		return "redirect:../chat_page";
	}
}
