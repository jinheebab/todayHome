package controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.FileUploadService;
import model.HostingDao;
import model.SharingDao;
import model.StatisticDao;

@Controller
@RequestMapping("/statistic")
public class StatisticController {

	@Autowired
	StatisticDao sdao;
	
	
	@RequestMapping("/statistic01")
	public ModelAndView statistic01(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("main","/statistic/statistic01");
		
		mav.setViewName("g_index");
		
		return mav;
		
	}
	
	
	@RequestMapping("/graph01")
	public ModelAndView graph01(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("main","/statistic/graph01");
		
		mav.setViewName("m_index3");
		
		List list = new ArrayList<>();
		
		list = sdao.location();
		
		Map map = new HashMap<>();
		
		for(int i=0; i<list.size(); i++){
			
			Map map2 = new HashMap<>();
			
			map2 = (Map) list.get(i);
			
			String key = (String) map2.get("CITY");
			
			switch (key) {
			case "서울특별시":
				map.put("SeoulHosting", map2.get("HOSTING"));
				map.put("SeoulRoomcnt", map2.get("ROOMCNT"));
				break;
			
			case "강남구":
				map.put("GangnamHosting", map2.get("HOSTING"));
				map.put("GangnamRoomcnt", map2.get("ROOMCNT"));
				break;
				
			case "부산광역시":
				map.put("BusanHosting", map2.get("HOSTING"));
				map.put("BusanRoomcnt", map2.get("ROOMCNT"));
				break;
				
			case "대전광역시":
				map.put("DaejeonHosting", map2.get("HOSTING"));
				map.put("DaejeonRoomcnt", map2.get("ROOMCNT"));
				break;
				
			case "인천광역시":
				map.put("InchunHosting", map2.get("HOSTING"));
				map.put("InchunRoomcnt", map2.get("ROOMCNT"));
				break;
				
			case "제주도":
				map.put("JejuHosting", map2.get("HOSTING"));
				map.put("JejuRoomcnt", map2.get("ROOMCNT"));
				break;

			case "대구시":
				map.put("DaeguHosting", map2.get("HOSTING"));
				map.put("DaeguRoomcnt", map2.get("ROOMCNT"));
				break;
				
						
			default:
				break;
			}
			
			
			System.out.println("전달되는 map = " + map);
			
			mav.addObject("map", map);
			mav.addObject("main","/statistic/graph01");
			mav.setViewName("m_index3");
			
		}
		
		
		
		return mav;
		
	}
	@RequestMapping("/graph02")
	public ModelAndView graph02(){
		
		ModelAndView mav = new ModelAndView();
		
		List list = sdao.topten();
		
		System.out.println(list.toString());
		
		mav.addObject("cnt", 1);
		mav.addObject("list", list);
		mav.addObject("main","/statistic/graph02");
		mav.setViewName("m_index3");
		
		
		return mav;
		
		
		
			

}
	
	@RequestMapping("/graph03")
	public ModelAndView graph03(){
		
		ModelAndView mav = new ModelAndView();
		
		List list = new ArrayList<>();
		
		Map map = new HashMap<>();
		
		list = sdao.country_people();
		
		System.out.println(list.toString());				
		
		for(int i=0; i<list.size(); i++){
			
			Map map2 = new HashMap<>();
			
			map2 = (Map) list.get(i);
			
			String key = (String) map2.get("COUNTRY");
			
			BigDecimal value2 = (BigDecimal) map2.get("PEOPLE");
			
			int value = value2.intValue();
			
			if(key.contains("China")){
				map.put("China", value);
			}else if(key.contains("India")){
				map.put("India", value);
			}else if(key.contains("미국")){
				map.put("US", value);
			}else if(key.contains("Indonesia")){
				map.put("Indonesia", value);
			}else if(key.contains("Brazil")){
				map.put("Brazil", value);
			}else if(key.contains("Pakistan")){
				map.put("Pakistan", value);
			}else if(key.contains("Nigeria")){
				map.put("Nigeria", value);
			}else if(key.contains("Bangladesh")){
				map.put("Bangladesh", value);
			}else if(key.contains("Russia")){
				map.put("Russia", value);
			}else if(key.contains("Japan")){
				map.put("Japan", value);
			}else if(key.contains("대한민국")){
				map.put("Korea", value);
		}
		
		
		
		mav.addObject("map", map);
		mav.addObject("main","/statistic/graph03");
		mav.setViewName("m_index3");
		
	}
	
		return mav;
	
}
	
	
	
	@RequestMapping("/graph04")
	public ModelAndView graph04(){
		
		ModelAndView mav = new ModelAndView();
		
		List list = sdao.getCategory();
		
		String category = "";
		
		for(int i=0; i<list.size(); i++){
			
			Map map = new HashMap<>();
			
			map = (Map) list.get(i);
			
			category += map.get("CATEGORY");
		}
		
		String category2 = category.replaceAll("#", " ");
		
		mav.addObject("category2", category2);
		mav.addObject("main","/statistic/graph04");
		mav.setViewName("m_index3");
		
		
		return mav;
		
		
		
			

}
	
}
