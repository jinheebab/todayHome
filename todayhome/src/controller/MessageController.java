package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.MessageDao;

@Controller
@RequestMapping("/view")
public class MessageController {

	@Autowired
	MessageDao mdao;

	@RequestMapping("/message") // 수신 리스트 and 메시지 main
	public ModelAndView message(HttpSession session) { //
		System.out.println("메시지 '수신' 리스트 접속");
		ModelAndView mav = new ModelAndView();

		System.out.println((String) session.getAttribute("auth"));
		HashMap map = new HashMap();
		map.put("receiver", (String) session.getAttribute("auth"));
		
		List message = mdao.getMyMessage(map);
		
		List board = new ArrayList<>();
		
		System.out.println(message);
		
		for(int i=0; i< 5 ; i++){
			
			board.add(message.get(i));
			
		}
		System.out.println(board);

		mav.setViewName("m_index2");
		mav.addObject("main", "message/message");
		mav.addObject("board", board);

		return mav;
	}
	
	@RequestMapping("/paging")
	public ModelAndView paging(@RequestParam(name="page")int page, HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		String receiver = (String)session.getAttribute("auth");
		
		Map map = new HashMap<>();
		
		Map move = new HashMap<>();
		
		map.put("receiver", receiver);
		
		List message = mdao.getMyMessage(map);
		
		List board = new ArrayList<>();
		
		for(int i=5*page-5; i< 5*page ; i++){
			
			board.add(message.get(i));
			
		}
		
		mav.setViewName("m_index2");
		mav.addObject("main", "message/message");
		mav.addObject("board", board);
		
		
		return mav;
	}
	
	@RequestMapping("/sendlist")
	public ModelAndView sendlist(HttpSession session) {

		
	ModelAndView mav = new ModelAndView();
		int sendpage=1;
		String sender = (String)session.getAttribute("auth");
		
		Map map = new HashMap<>();
		
		Map move = new HashMap<>();
		
		map.put("sender", sender);
		
		List sendlist = mdao.getsendMessage(map);
		
		List boards = new ArrayList<>();
		
		for(int i=5*sendpage-5; i< 5*sendpage ; i++){
			
			boards.add(sendlist.get(i));
			
		}
		
		mav.setViewName("m_index2");
		mav.addObject("main", "message/sendlist");
		mav.addObject("boards", boards);
		
		return mav;

	}
	
	@RequestMapping("/sendpaging")
	public ModelAndView sendpaging(@RequestParam(name="sendpage")int sendpage, HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		String sender = (String)session.getAttribute("auth");
		
		Map map = new HashMap<>();
		
		Map move = new HashMap<>();
		
		map.put("sender", sender);
		
		List sendlist = mdao.getsendMessage(map);
		
		List boards = new ArrayList<>();
		
		for(int i=5*sendpage-5; i< 5*sendpage ; i++){
			
			boards.add(sendlist.get(i));
			
		}
		
		mav.setViewName("m_index2");
		mav.addObject("main", "message/sendlist");
		mav.addObject("boards", boards);
		
		return mav;
	}
	
	@RequestMapping("/send")
	public ModelAndView send(HttpSession session, HttpServletRequest req) {
		String addr = req.getRemoteAddr();
		System.out.println("메시지 '작성' 페이지 접속");
		ModelAndView mav = new ModelAndView();
//		ModelAndView mav2 = new ModelAndView("s_01");
		
		String send = (String) session.getAttribute("auth");
		
		mav.setViewName("m_index2");
		mav.addObject("main", "message/send");
		mav.addObject("addr", addr);
		mav.addObject("send", send);
		
		
		return mav;
	}
	@RequestMapping("/sendcomp")
	public ModelAndView sendcomp(HttpSession session, HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView();

		mav.setViewName("m_index2");
		mav.addObject("main", "message/sendcomp");

		
		return mav;
		
		
	}
}





























