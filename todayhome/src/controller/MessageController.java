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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.MessageDao;




@Controller
@RequestMapping("/view/message")
public class MessageController {

	@Autowired
	MessageDao mdao;

	@RequestMapping("/") // 수신 리스트 and 메시지 main
	public ModelAndView message(@RequestParam("page")String page,HttpSession session, HttpServletRequest req) throws Exception{
		
		List list = new ArrayList();
		String receiver = (String)session.getAttribute("auth");
		HashMap map = new HashMap(); 
		map.put("receiver", receiver);
		
		list = mdao.getMyMessage(map);
		
		System.out.println(map);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("m_index2");
		mav.addObject("main", "message/message");
		mav.addObject("page",page);
		mav.addObject("list", list);
		return mav;
	}


	@RequestMapping("/sendlist")
	public ModelAndView sendlist(@RequestParam HashMap map,HttpSession session, HttpServletRequest req) throws Exception{

		ModelAndView mav = new ModelAndView();
		int sendpage = 1;
		String sender = (String) session.getAttribute("auth");

		map.put("sender", sender);
		
		List sendlist = mdao.getsendMessage(map);
		
		String pStr = req.getParameter("page") == null ? "1" : req.getParameter("page");
		String pa = req.getParameter("page");

		int start = (Integer.parseInt(pStr) -1 ) *6 +1; 
		int end = Integer.parseInt(pStr) *6;
			map.put("start", start);
			map.put("end", end);;

		int count = mdao.getSMessageNum(map);
		int size = count % 6 == 0 ? count / 6 : count / 6 + 1; 

		mav.setViewName("m_index2");
		mav.addObject("searchK",map);
		mav.addObject("main", "message/sendlist");
		mav.addObject("boards", sendlist);

		return mav;

	}

	
	@RequestMapping("/send")
	public ModelAndView send(@RequestParam Map map, HttpSession session, HttpServletRequest req) {
		String addr = req.getRemoteAddr();
		ModelAndView mav = new ModelAndView();
		
		String send = (String) session.getAttribute("auth");
		
		mav.setViewName("m_index2");
		mav.addObject("main", "message/send");
		mav.addObject("addr", addr);
		mav.addObject("send", send);
		
		return mav;
	}	
		
	@RequestMapping("/sendcomp")
	public String sendcomp(HttpSession session, @RequestParam Map map) {
		String sender = (String) session.getAttribute("auth");
		System.out.println(sender);
			map.put("sender", sender);
		System.out.println(map);
		System.out.println(map);
		
		int r = mdao.send(map);
		String redirect = "";
		
		ModelAndView mav = new ModelAndView();
		
		if(r==1){
			mav.setViewName("m_index2");
			redirect = "redirect:sendresult.jsp";
		} else {
			mav.setViewName("m_index2");
			redirect = "redirect:send";
		}
		return redirect ;
	}
}		
		

