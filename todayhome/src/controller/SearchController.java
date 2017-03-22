package controller;

import java.util.HashMap;
import java.util.List;

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
	public ModelAndView search(@RequestParam HashMap map){
		String target = (String)map.get("target");
		String sdate = (String)map.get("sdate");
		String edate = (String)map.get("edate");
		String cnt = (String)map.get("cnt");
		
		System.out.println(target);
		System.out.println(sdate);
		System.out.println(edate);
		System.out.println(cnt);
		
		List<HashMap> list = hDao.searchList(map);
		System.out.println(list);
		
		
		int count = hDao.selectCnt(map);  
		HashMap countmap = new HashMap();
			countmap.put("count", count);
		
			
		ModelAndView mav = new ModelAndView("m_index3");
			mav.addObject("main", "search/searchList");
			mav.addObject("val", list);
			mav.addObject("vall", countmap);
			mav.addObject("map", map);
		return mav;
	}
}
