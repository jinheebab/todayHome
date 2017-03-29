package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.DBregister;
import service.DBregister2;

@Controller
@RequestMapping("/register")
public class RegisterController {
	@Autowired
	DBregister db;
	@Autowired
	DBregister2 db2;
	
	@RequestMapping("/hosting")
	public ModelAndView hosting(){
		ModelAndView mav = new ModelAndView();
		db2.hosting();
		mav.addObject("main","/register");
		mav.setViewName("g_index2");
		return mav;
	}
	
	@RequestMapping("/book")
	public ModelAndView book(){
		ModelAndView mav = new ModelAndView();
		db2.book();
		mav.addObject("main","/register");
		mav.setViewName("g_index2");
		return mav;
	}
	@RequestMapping("/member")
	public ModelAndView member(){
		ModelAndView mav = new ModelAndView();
		db2.member();
		mav.addObject("main","/register");
		mav.setViewName("g_index2");
		return mav;
	}
	@RequestMapping("/review")
	public ModelAndView review(){
		ModelAndView mav = new ModelAndView();
		db2.review();
		mav.addObject("main","/register");
		mav.setViewName("g_index2");
		return mav;
	}
	@RequestMapping("/sharing")
	public ModelAndView sharing(){
		ModelAndView mav = new ModelAndView();
		db2.sharing();
		mav.addObject("main","/register");
		mav.setViewName("g_index2");
		return mav;
	}
}
