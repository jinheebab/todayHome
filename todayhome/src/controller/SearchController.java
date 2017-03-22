package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.HostingDao;
import model.MainDao;

@Controller
public class SearchController {
	@Autowired
	HostingDao hDao;
	@Autowired
	MainDao mDao;

	@RequestMapping("/search/search")
	public ModelAndView search(@RequestParam HashMap map, HttpSession session, HttpServletRequest req){
		String target = (String)map.get("target");
		String sdate = (String)map.get("sdate");
		String edate = (String)map.get("edate");
		String cnt = (String)map.get("cnt");
		int count = hDao.selectCnt(map);
		System.out.println(sdate);			
		
		List<HashMap> list = hDao.searchList(map);
		ModelAndView mav = new ModelAndView("m_index3");
			mav.addObject("main", "search/searchList");
			mav.addObject("val", list);
			mav.addObject("count", count);
	
		return mav;
	}				
							
//				페이징소스
//				int size = count % 6 == 0 ? count / 6 : count / 6 + 1; 
//				 
//				String pStr = req.getParameter("page") == null ? "1" : req.getParameter("page");
//				String pa = req.getParameter("page");
//				
//				int start = (Integer.parseInt(pStr) -1 ) *6 +1; 
//				int end = Integer.parseInt(pStr) *6;
//					map.put("start", start);
//					map.put("end", end);;
				
//				mav.addObject("size", size);
//				mav.addObject("page", pStr);
	

}
