package controller;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.HostingDao;
import model.MainDao;

@Controller
public class MainController {

	@Autowired
	HostingDao hd;
	@Autowired
	MainDao md;

	@RequestMapping("/view/")
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
	
	
	@RequestMapping("view/detail")
	public ModelAndView detailHandler(@RequestParam("num")String num, HttpSession session){
		HashMap map = new HashMap();
		map.put("num", num);
		List<HashMap> list = md.getDetaillist(map);
		double avgstar = md.getScore(map);
		System.out.println(avgstar);
		avgstar = avgstar*10;
		int score = (int)avgstar;
		
		String hoster = md.hoster(num);
		System.out.println("hoster name="+ hoster);
		HashMap map2 = new HashMap();
		map2.put("id", hoster);
		map2.put("type", "info");
		List<HashMap> uphoto = md.getPhoto(map2);
		
		
		HashMap map3 = new HashMap();
		map3.put("id", hoster);
		map3.put("type", "hosting");
		List<HashMap> hphoto = md.getPhoto(map3);
		
		
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("auth")!=null){
		mav.setViewName("m_index2");
		System.out.println("멤버임");
		}else{
			mav.setViewName("g_index2");
			System.out.println("멤버아님");		
		}
		mav.addObject("list", list);
		mav.addObject("score", score);
		mav.addObject("uphoto", uphoto);
		mav.addObject("hphoto", hphoto);
		mav.addObject("main", "main/detail");
		
		System.out.println("여기까지 옴");
		
		return mav;
	}
	
}
