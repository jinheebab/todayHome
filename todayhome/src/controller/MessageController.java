package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/message")
public class MessageController {

	@RequestMapping("/msg01")
	public ModelAndView msg01(){	// 
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("main", "message/");
		
		
		return mav;
		
	}
	
	
}
