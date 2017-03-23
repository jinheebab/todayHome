package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	
	@RequestMapping("/sendlist")
	public ModelAndView sendlist(HttpSession session) {
		System.out.println("메시지 '발신' 리스트 접속");
		ModelAndView mav = new ModelAndView();

		String sender = (String) session.getAttribute("auth");
		HashMap map = new HashMap();
		map.put("sender", sender);
		List<HashMap> list = mdao.getsendList(map);

		mav.setViewName("m_index2");
		mav.addObject("main", "message/sendlist");
		mav.addObject("lists", list);

		return mav;
	}

	@RequestMapping("/send")
	public ModelAndView send(HttpSession session) {
		System.out.println("메시지 '작성' 페이지 접속");
		ModelAndView mav = new ModelAndView();

		String send = (String) session.getAttribute("auth");
		mav.setViewName("m_index2");
		mav.addObject("main", "message/send");
		mav.addObject("send", send);
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

}
