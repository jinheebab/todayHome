package controller;

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
	ServletContext application;
	@Autowired
	FileUploadService fs;
	
	@RequestMapping("/info/info")
	public ModelAndView infoHandler(HttpSession session){
		String id = (String)session.getAttribute("auth");
		List<HashMap> val = iDao.readOne(id);
		
		ModelAndView mav = new ModelAndView("m_index");
			mav.addObject(val);
		return mav;
	}
	@RequestMapping("/info/ajax")
	@ResponseBody
	public ModelAndView infoAjaxHandler(@RequestParam HashMap map, HttpSession session){
		int rst = iDao.updateInfo(map);
		ModelAndView mav = new ModelAndView();
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
