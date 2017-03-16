package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
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

	@RequestMapping("view/")
	public ModelAndView main(HttpServletRequest request, HttpSession session) {
		// 컨트롤러 1 - 1번
		
		Cookie s = null;
		Cookie[] ar = request.getCookies();
		if (ar != null) {
			for (Cookie t : ar) {
				if (t.getName().equals("auto")) {
					s = t;
				}
			}
		}
		
		ModelAndView mav = new ModelAndView();
		List<HashMap> list = hd.readHostingSome();
		
		if (s != null) {
			session.setAttribute("id", s.getValue());
			mav.setViewName("m_index");
			mav.addObject("list", list);
			mav.addObject("main", "/main/main");
			
		}else if(session.getAttribute("auth")!=null){
			mav.setViewName("m_index");
			mav.addObject("list", list);
			mav.addObject("main", "/main/main");
			
		}else {
			mav.setViewName("g_index");
			mav.addObject("list", list);
			mav.addObject("main", "/main/main");
		}
		return mav;
	}
}
