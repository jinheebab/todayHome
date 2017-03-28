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
			case "서울시":
				map.put("SeoulHosting", map2.get("HOSTING"));
				map.put("SeoulRoomcnt", map2.get("ROOMCNT"));
				break;
			
			case "용인시":
				map.put("YonginHosting", map2.get("HOSTING"));
				map.put("YonginRoomcnt", map2.get("ROOMCNT"));
				break;
				
			case "안양시":
				map.put("AnyangHosting", map2.get("HOSTING"));
				map.put("AnyangRoomcnt", map2.get("ROOMCNT"));
				break;
				
			case "안산시":
				map.put("AnsanHosting", map2.get("HOSTING"));
				map.put("AnsanRoomcnt", map2.get("ROOMCNT"));
				break;
				
			case "인천시":
				map.put("InchunHosting", map2.get("HOSTING"));
				map.put("InchunRoomcnt", map2.get("ROOMCNT"));
				break;
				
			case "제주시":
				map.put("JejuHosting", map2.get("HOSTING"));
				map.put("JejuRoomcnt", map2.get("ROOMCNT"));
				break;

			case "부천시":
				map.put("BuchunHosting", map2.get("HOSTING"));
				map.put("BuchunRoomcnt", map2.get("ROOMCNT"));
				break;
				
			case "부산시":
				map.put("BusanHosting", map2.get("HOSTING"));
				map.put("BusanRoomcnt", map2.get("ROOMCNT"));
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
		
		
		List list = new ArrayList<>();
		
		List list2 = new ArrayList<>();
		
		list = sdao.country();
		
		list2 = sdao.country2();
		
		
		Map map = new HashMap<>();
		
		Map mapmember = new HashMap<>();
		
		for(int i=0; i<list.size(); i++){
				Map map2 = new HashMap<>();
			
				map2 = (Map) list.get(i);
			
			String key = (String) map2.get("COUNTRY");
			
			switch (key) {
			case "미국":
				
				map.put("usa", map2.get("COUNT"));
				
				break;
			
			case "중국":
				map.put("china", map2.get("COUNT"));
				break;
				
			case "대한민국":
				map.put("korea", map2.get("COUNT"));
				break;
				
			case "영국":
				map.put("uk", map2.get("COUNT"));
				break;
				
			case "그리스":
				map.put("greece", map2.get("COUNT"));
				break;
				
			case "필리핀":
				map.put("philipin", map2.get("COUNT"));
				break;

			case "호주":
				map.put("austrailia", map2.get("COUNT"));
				break;
				
			case "일본":
				map.put("japan", map2.get("COUNT"));
				break;
				
			default:
				
				
				break;
			
			
		}
			
			
			
			
			///////////////////////////////////////////////////////////////////////////
			
			
			for(int a=0; a<list2.size(); a++){
				Map map3 = new HashMap<>();
			
				map3 = (Map) list2.get(a);
			
			String key2 = (String) map3.get("COUNTRY");
			
			switch (key2) {
			case "미국":
				
				mapmember.put("usa", map3.get("COUNT"));
				
				break;
			
			case "중국":
				mapmember.put("china", map3.get("COUNT"));
				break;
				
			case "대한민국":
				mapmember.put("korea", map3.get("COUNT"));
				break;
				
			case "영국":
				mapmember.put("uk", map3.get("COUNT"));
				break;
				
			case "그리스":
				mapmember.put("greece", map3.get("COUNT"));
				break;
				
			case "필리핀":
				mapmember.put("philipin", map3.get("COUNT"));
				break;

			case "호주":
				mapmember.put("austrailia", map3.get("COUNT"));
				break;
				
			case "일본":
				mapmember.put("japan", map3.get("COUNT"));
				break;
				
			default:
				
				
				break;
			
			
		}
		
		
		mav.addObject("map", map);
		mav.addObject("mapmember",mapmember);
		mav.addObject("main","/statistic/graph02");
		mav.setViewName("m_index3");
		
	}
}
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
	
}
