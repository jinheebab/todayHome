package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpCookie;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.FileUploadService;
import model.InfoDao;
import model.SharingDao;

@Controller
public class InfoController {
	@Autowired
	InfoDao iDao;
	@Autowired
	SharingDao sDao;
	@Autowired
	ServletContext ac;
	@Autowired
	FileUploadService fs;
	
	@RequestMapping("/info/info")
	public ModelAndView infoHandler(HttpSession session) throws FileNotFoundException{
		String id = (String)session.getAttribute("auth");
		HashMap val = iDao.readOne(id);
		
		HashMap map = new HashMap();
			map.put("id", id);
			map.put("type", "info");
		List list = sDao.read(map);
		HashMap sharing = (HashMap) list.get(0);
		
		ModelAndView mav = new ModelAndView("m_index2");
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
			mav.addObject("val", val);
			mav.addObject("sharing", sharing);
			mav.addObject("main", "info/info");
		return mav;
	}
	@RequestMapping("/info/picAjax")
	public ModelAndView procHandler(@RequestParam(name = "pic") MultipartFile file, HttpSession session) throws Exception {
			ModelAndView mav = null;
			String id = (String)session.getAttribute("auth");
			HashMap map = fs.execute(file);
				map.put("id", id);
				map.put("type", "info");
				
			int rst = sDao.update(map);
			if(rst==1) {
				mav = new ModelAndView("/info/picAjax");
				mav.addObject("msg", "");
				System.out.println("등록 성공");	
				return mav;
			}else {
				mav = new ModelAndView("/info/picAjax");
				mav.addObject("msg", "등록이 실패하였습니다. 2초 뒤 화면이 전환됩니다.");
				System.out.println("등록 실패");
				return mav;	
			}
	}

	@RequestMapping("/info/ajax")
	@ResponseBody
	public ModelAndView withdrawAjaxHandler(@RequestParam HashMap map, HttpSession session){
		String id = (String)session.getAttribute("auth");
			map.put("id", id);
			
		int rst = iDao.updateInfo(map);
		
		ModelAndView mav = null;
		if(rst==1) {
			mav = new ModelAndView("/info/ajax");
			mav.addObject("msg", "회원정보가 변경되었습니다.. 2초 뒤 화면이 전환됩니다.");
			System.out.println("회원정보 변경 성공");	
			return mav;
		}else {
			mav = new ModelAndView("/info/ajax");
			mav.addObject("msg", "회원정보 변경이 실패하였습니다. 2초 뒤 화면이 전환됩니다.");
			System.out.println("회원정보 변경 실패");
			return mav;	
		}
	}
	@RequestMapping("/info/withdrawAjax")
	@ResponseBody
	public ModelAndView infoAjaxHandler(@RequestParam HashMap map, HttpSession session, HttpServletRequest req, HttpServletResponse resp){
		String pass = (String)map.get("pass");
		String id = (String)session.getAttribute("auth");
			map.put("id", id);
			map.put("type", "info");
			
		HashMap val = iDao.readOne(id);
		String passs = (String)val.get("PASS");
		
		Cookie[] cookies = req.getCookies();
		
		int rst = 0;
		if(pass.equals(passs)){
			rst = iDao.deleteId(id);
			session.removeAttribute("auth");
			
			for (int i = 0; i < cookies.length; i++) {
				cookies[i].setMaxAge(0);                
				cookies[i].setPath("/");                   
				resp.addCookie(cookies[i]); 
			}
			iDao.deletePic(map);
		}
		ModelAndView mav = null;
		if(rst==1) {
			mav = new ModelAndView("/info/withdrawAjax");
			mav.addObject("msg", "회원탈퇴가 성공하였습니다. 그동안 이용해주셔서 감사합니다.");
			System.out.println("회원탈퇴 성공");	
			return mav;
		}else {
			mav = new ModelAndView("/info/withdrawAjax");
			mav.addObject("msg", "회원탈퇴가 실패하였습니다. 2초 뒤 화면이 전환됩니다.");
			System.out.println("회원탈퇴 실패");
			return mav;	
		}
	}
	
}
