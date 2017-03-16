package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.HostingDao;

@Controller
public class MainController {
	
	
	@Autowired
	HostingDao hdao;

	@RequestMapping
	public ModelAndView main01(HttpServletRequest request, HttpSession session){	// 컨트롤러 1 - 1번
		
		ModelAndView mav = new ModelAndView();
		
		session.setAttribute("login", "no");
		
		List list = hdao.readHostingSome();
		
		mav.setViewName("main/main");
		
		mav.addObject("list", list);
		
		return mav;
		
		
		
		
	}
}
