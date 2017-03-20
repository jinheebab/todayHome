package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.HostingDao;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	
	@Autowired
	HostingDao hdao;
	@Autowired
	ServletContext ac;
	
	@RequestMapping("/reserve01")
	public ModelAndView reserve01(HttpSession session){
		ModelAndView mav = new ModelAndView();
		
//		if(session.getAttribute("auth") == null){
//			mav.addObject("main","login/pagelogin");
//			
//			mav.setViewName("g_index");
//		}
		
		
//		String id = (String)session.getAttribute("id");
//		
//		mav.addObject("id", id);
		
//		int num = (int)session.getAttribute("num");
//		
//		List hostinglist = hdao.readHostingAll(num);
		
//		mav.addObject("hostinglist", hostinglist);
		
		mav.addObject("main", "reservation/reserve01");
		
		mav.setViewName("m_index2");
		
		return mav;
		
	}
	
	@RequestMapping("/reserve02")
	public ModelAndView reserve02(@RequestParam Map map, HttpServletRequest request) throws FileNotFoundException{
		
		ModelAndView mav = new ModelAndView();
		
		String path = ac.getRealPath("/nation.txt");
		File f = new File(path);
		FileInputStream fis = new FileInputStream(f);
		InputStreamReader isr = new InputStreamReader(fis);
		BufferedReader br = new BufferedReader(isr);
		List countrylist = new ArrayList<>();
		try {
			while(true){
				String ss = br.readLine();
				if(ss==null) break;
				countrylist.add(ss);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String total = (String)request.getAttribute("total");
		
		String message = (String)request.getAttribute("message");
		
		mav.addObject("countrylist", countrylist);
				
		mav.addObject("total", total);
		
		mav.addObject("main", "reservation/reserve02");
		
		mav.setViewName("m_index2");
		
		return mav;
	}
	
}
