package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.JoinDao;

@Controller
public class JoinController {
	@Autowired
	JoinDao jDao;
	
	@RequestMapping("view/join")
	public ModelAndView joinHandler(){
		ModelAndView mav = new ModelAndView("g_index");
		mav.addObject("main", "/join/join");
		System.out.println("들어옴");
		return mav;
	}
}
