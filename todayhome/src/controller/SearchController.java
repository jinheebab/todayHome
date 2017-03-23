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
	public ModelAndView search(@RequestParam HashMap map, HttpSession session, HttpServletRequest req) throws Exception{
		
		String pStr = req.getParameter("page") == null ? "1" : req.getParameter("page");
		String pa = req.getParameter("page");
		
		int start = (Integer.parseInt(pStr) -1 ) *6 +1; 
		int end = Integer.parseInt(pStr) *6;
			map.put("start", start);
			map.put("end", end);;
		
		int count = hDao.selectCnt(map);
		int size = count % 6 == 0 ? count / 6 : count / 6 + 1; 
		
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
						+ "&key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&language=ko";
				
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
				loc.add(result);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView("m_index3");
			System.out.println(loc);
			mav.addObject("searchK",map);
			mav.addObject("main", "search/searchList");
			mav.addObject("val", list);
			mav.addObject("count", count);
			mav.addObject("page", pStr);		
			mav.addObject("size", size);
			mav.addObject("loc", loc);
			
		return mav;
	}
}				
						


