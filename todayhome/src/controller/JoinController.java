package controller;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value="view/check", method=RequestMethod.POST)
	public ModelAndView checkHandler(HttpServletRequest req){
		String id = (String)req.getAttribute("id");
		String pass = (String)req.getAttribute("pass");
		String name = (String)req.getParameter("name");
		String gender = (String)req.getParameter("gender");
		String birth = (String)req.getParameter("bday");
		String mail = (String)req.getParameter("email");
		String country = (String)req.getParameter("country");
				 
		System.out.println(id);
		System.out.println(pass);
		System.out.println(name);
		System.out.println(gender);
		System.out.println(birth);
		System.out.println(mail);
		System.out.println(country);
		
		HashMap<String, Object> map = new HashMap<>();	
			map.put("ID", id);
			map.put("PASS", pass);
			map.put("NAME", name);
			map.put("GENDER", gender);
			map.put("BIRTH", birth);
			map.put("MAIL", mail);
			map.put("COUNTRY", country);
			
		ModelAndView mav = null;
		int rst = jDao.addMember(map);
		
		if(rst==1) {
			mav = new ModelAndView("/join/check");
			mav.addObject("msg", "등록이 완료 되었습니다. 2초 뒤 화면이 전환됩니다.");
			System.out.println("등록 성공");	
			return mav;
			
		}else {
			mav = new ModelAndView("/join/check");
			mav.addObject("msg", "등록이 실패하였습니다. 2초 뒤 화면이 전환됩니다.");
			System.out.println("등록 실패");
			return mav;
		}
	}
}
