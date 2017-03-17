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
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.FileUploadService;
import model.InfoDao;

@Controller
public class InfoController {
	@Autowired
	InfoDao iDao;
	@Autowired
	ServletContext ac;
	@Autowired
	FileUploadService fs;
	
	@RequestMapping("/info/info")
	public ModelAndView infoHandler(HttpSession session) throws FileNotFoundException{
		String id = (String)session.getAttribute("auth");
		HashMap val = iDao.readOne(id);
		
		String pic  = (String)val.get("PICURL");
		if(pic.equals("NULL") ){
			val.put("PICURL", "/img.png");
		}
		ModelAndView mav = new ModelAndView("m_index");
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
			mav.addObject("main", "info/info");
		return mav;
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
	@RequestMapping("/info/withdraw")
	@ResponseBody
	public ModelAndView withdrawHandler(){
		ModelAndView mav = new ModelAndView("m_index");
			mav.addObject("main", "info/withdraw");
		return mav;
	}
	@RequestMapping("/info/withdrawAjax")
	@ResponseBody
	public ModelAndView infoAjaxHandler(@RequestParam HashMap map, HttpSession session){
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
}
