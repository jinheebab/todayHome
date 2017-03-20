package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.JoinDao;
import model.SharingDao;

@Controller
public class JoinController {
	@Autowired
	JoinDao jDao;
	@Autowired
	SharingDao sDao;
	@Autowired
	ServletContext ac;
	
	@RequestMapping("/join/join")
	public ModelAndView joinHandler() throws FileNotFoundException{
		ModelAndView mav = new ModelAndView("g_index2");
		String path = ac.getRealPath("/nation.txt");
		File f = new File(path);
		FileInputStream fis = new FileInputStream(f);
		InputStreamReader isr = new InputStreamReader(fis);
		BufferedReader br = new BufferedReader(isr);
		List li = new ArrayList<>();
		try {
			while(true){
				String ss = br.readLine();
				if(ss==null) break;
				li.add(ss);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mav.addObject("list", li);
		mav.addObject("main", "/join/join");
		return mav;
	}
	@RequestMapping(value="/join/check", method=RequestMethod.POST)
	public ModelAndView checkHandler(HttpServletRequest req){
		String id = (String)req.getParameter("id");
		String pass = (String)req.getParameter("pass");
		String name = (String)req.getParameter("name");
		String gender = (String)req.getParameter("gender");
		String birth = (String)req.getParameter("bday");
		String mail = (String)req.getParameter("email");
		String country = (String)req.getParameter("country");

		HashMap<String, Object> map = new HashMap<>();	
			map.put("ID", id);
			map.put("PASS", pass);
			map.put("NAME", name);
			map.put("GENDER", gender);
			map.put("BIRTH", birth);
			map.put("MAIL", mail);
			map.put("COUNTRY", country);
			
		ModelAndView mav = null;
		HashMap m = new HashMap();
			m.put("type", "info");
			m.put("filename", "NULL");
			m.put("filesize", "NULL");
			m.put("fileaddress", "NULL");
			m.put("filelink", "/img.png");
			m.put("id", id);
		sDao.createOne(m);
		int rst = jDao.addMember(map);
		
		if(rst==1) {
			mav = new ModelAndView("/join/check");
			mav.addObject("msg", "<h2>회원가입이 완료 되었습니다.</h2><br/><b>로그인을 시도해주세요 :)</b>");
			System.out.println("회원가입 성공");	
			return mav;
			
		}else {
			mav = new ModelAndView("/join/check");
			mav.addObject("msg", "회원가입이 실패하였습니다. 2초 뒤 화면이 전환됩니다.");
			System.out.println("회원가입 실패");
			return mav;
		}
	}
	@RequestMapping("/join/ajax")
	@ResponseBody
	public String ajaxHandler(@RequestParam(name="id") String id){
		HashMap<String, Object> map = new HashMap<>();	
			map.put("ID", id);
		boolean rst = jDao.checkMember(map);
		if(rst)
			return "NNNNN";
		else
			return "YYYYY";
	}
}
