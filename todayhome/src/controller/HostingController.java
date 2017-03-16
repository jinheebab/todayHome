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
@RequestMapping("/hosting")
public class HostingController {
	
	
	
	@RequestMapping("/host01")
	public ModelAndView host01(HttpServletRequest request, HttpSession session){	// 컨트롤러  7 - 1번
		
		ModelAndView mav = new ModelAndView();
		
		//String id = (String)session.getAttribute("id");
		
		//mav.addObject("id",id);
				
		mav.addObject("main", "/hosting/host01");
		
		mav.setViewName("t_index");
		
		return mav;
								
	}
	
	
}