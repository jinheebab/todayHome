package controller;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.LoginDao;

@Controller
public class LoginController {

	@Autowired
	LoginDao ld;

	@RequestMapping("view/login/confirm")
	public String LoginHandler(@RequestParam("id") String id, @RequestParam("pass") String pass,
			@RequestParam(name = "autologin", defaultValue = "off", required = false) String keep, HttpSession session,
			HttpServletResponse resp) {
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("pass", pass);
		System.out.println(keep);
		boolean r = ld.confirm(map);
		String redirect = "";
		if (r) {
			if (keep.equals("on")) {
				Cookie cookie = new Cookie("auto", id);
				cookie.setMaxAge(60 * 60);
				cookie.setPath("/view/");
				resp.addCookie(cookie);
			}

			session.setAttribute("auth", id);
			
			redirect = "redirect:success.jsp";
		} else {
			redirect = "redirect:fail.jsp";
		}

		return redirect;

	}
	
	@RequestMapping("view/login/pagelogin")
	public ModelAndView pageLoinHandler(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("g_index2");
		mav.addObject("main", "/login/pagelogin");
		return mav;
	}
	
	@RequestMapping("view/login/logout")
	public String logOurHandler(HttpSession session, HttpServletResponse resp) {
		String redirect = "";
		session.removeAttribute("auth");
		Cookie c1 = new Cookie("auto", "");
		Cookie c2 = new Cookie("keep", "");
		c1.setMaxAge(0);
		c1.setPath("/view/");
		resp.addCookie(c1);

		c2.setMaxAge(0);
		c2.setPath("/view/");
		resp.addCookie(c2);

		redirect = "redirect:/view/";

		return redirect;
	}

}
