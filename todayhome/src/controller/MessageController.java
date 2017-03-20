package controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.MessageDao;
		
@Controller
@RequestMapping("/view/")
public class MessageController {
		
	@Autowired
	MessageDao mdao;
		
	@RequestMapping("/message")
	public ModelAndView message(HttpSession session){	//
		System.out.println("message main 접속");
		ModelAndView mav = new ModelAndView();
		
		String receiver = (String)session.getAttribute("auth");
		
		List message = mdao.getRecvMsgs(receiver);
		
		mav.setViewName("m_index2");
		mav.addObject("main", "message/message");
		
		return mav;
	}	
		
	@RequestMapping("/message02")
	@ResponseBody					
	public String message02(@RequestParam ("Send")String Send){
		System.out.println(Send);
		
		
		
		return null;
	}	
		
		
		
}		

