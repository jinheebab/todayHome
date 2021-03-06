package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.HostingDao;
import model.MainDao;

@Controller
public class SearchController {
	@Autowired
	HostingDao hDao;
	@Autowired
	MainDao mDao;

	
	@RequestMapping("/search/search")
	public ModelAndView search(@RequestParam(name="target", defaultValue="대한민국", required = false)String target1, @RequestParam(name="sdate", defaultValue="2017-05-01", required = false)String sdate, @RequestParam(name="edate", defaultValue="2017-05-01", required = false)String edate, @RequestParam(name="cnt")int cnt, HttpSession session, HttpServletRequest req,@RequestParam(name="page",defaultValue="1") int page) throws Exception{
		//페이징처리
		HashMap map = new HashMap();
			map.put("target", target1);
			map.put("sdate", sdate);
			map.put("edate", edate);
			map.put("cnt", cnt);
		
		int pageStart = page % 10 == 1 ? page : (page-1)/10 * 10+1;
		int pageEnd = pageStart + 9;
		
		
		
		int count = hDao.selectCnt(map);
		int size = count/6;
		
		if(pageEnd > size){
			pageEnd = size;
		}
		
		int start = (page -1 ) *5 +1; 
		int end = start + 5;
			map.put("start", start);
			map.put("end", end);;
		
		
		//리스트 가져오기
		List<HashMap> list = hDao.getSelectPage(map);
		List addr = new ArrayList();
		// 지오코딩
		List loc = new ArrayList();
		try{
			for(int i=0; i<list.size(); i++){
				HashMap addrmap = (HashMap)list.get(i);
				String add= (String)addrmap.get("ADDRESS");
				addr.add(add);
			}
			for(int i =0; i<addr.size(); i++){
				String ad = (String)addr.get(i);
				ad=ad.replaceAll("\\s", "");
				String target = "https://maps.googleapis.com/maps/api/geocode/json?address=" + ad
						+ "&key=AIzaSyAlKtilIxIb3u52hJegDeUbqmkY1qFJJ6Y&language=ko";
				
				URL url = new URL(target);
				BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
				String outstr = "";
					while (true) {
						String str = br.readLine();
						if (str == null)
							break;
						outstr += str;
				}
				
				Map result = (HashMap)new ObjectMapper().readValue(outstr, Map.class);
					result.put("num", list.get(i).get("NUM"));
					result.put("title", list.get(i).get("TITLE"));
					result.put("picurl", list.get(i).get("PICURL"));
					result.put("price", list.get(i).get("PRICE"));
				
				loc.add(result);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		System.out.println("페이지엔드  " + pageEnd);
		
		ModelAndView mav = new ModelAndView("m_index3");
				
			mav.addObject("main", "search/searchList");
			mav.addObject("val", list);
			mav.addObject("count", count);
			mav.addObject("page", page);		
			mav.addObject("size", size);
			mav.addObject("loc", loc);
			mav.addObject("pageStart", pageStart);
			mav.addObject("pageEnd", pageEnd);
			mav.addObject("searchK",map);
			
		return mav;
	}
}				
						


