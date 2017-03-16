package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.HostingDao;

@Controller
public class MainController {
	
	
	@Autowired
	HostingDao hd;

	@RequestMapping("view/main")
	public ModelAndView main(HttpServletRequest request, HttpSession session){	
		// 컨트롤러 1 - 1번
		ModelAndView mav = new ModelAndView();
		List list = hd.readHostingSome();
		mav.setViewName("t_index");
		mav.addObject("list", list);
		mav.addObject("main", "/main/main");
		System.out.println("들어옴");
		return mav;
	}
}
