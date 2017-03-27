package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.BookDao;
import model.HostingDao;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	
	@Autowired
	HostingDao hdao;
	@Autowired
	BookDao bdao;
	@Autowired
	ServletContext ac;
	
	@RequestMapping("/reserve01")
	public ModelAndView reserve01(HttpSession session,@RequestParam(name="num")int num) throws JsonProcessingException{
		ModelAndView mav = new ModelAndView();
		
		
		if(session.getAttribute("auth") == null){
			
			mav.addObject("main","login/pagelogin");
			
			mav.setViewName("g_index");
		}
		
		
		String id = (String)session.getAttribute("auth");
		
		mav.addObject("id", id);
		
	
		
		Map hostinglist = hdao.readHostingAll(num);
		
		List reservelist = bdao.getReserveDate(num);
		
		System.out.println(reservelist);
		
		List reserve = new ArrayList<>();
		
			Iterator<Map> it = reservelist.iterator();
			
			while(it.hasNext()){
				Map map = it.next();
				Date startdate = (Date) map.get("STARTDATE"); 
				
				Date enddate = (Date)map.get("ENDDATE");
				
				long diff = (int) (enddate.getTime() - startdate.getTime());
				
				long diffDays = diff / (24*60*60*1000);
				
				
				
				System.out.println(diffDays+"일 차이");
				
				Calendar cal = new GregorianCalendar(Locale.KOREA);
				
				cal.setTime(startdate);
				
				for(int i=0; i< diffDays; i++){
					
					cal.add(Calendar.DAY_OF_YEAR, 1);
					
					
					SimpleDateFormat transformer = new SimpleDateFormat("yyyy-MM-dd");
					
					String reservedate = transformer.format(cal.getTime());
					
					
					reserve.add(reservedate);
					
				}
				System.out.println("최종 예약리스트는 ? " + reserve.toString());
			}
			
			
			
			
			
		
		
		mav.addObject("reserve", new ObjectMapper().writeValueAsString(reserve));
		
		mav.addObject("hostinglist", hostinglist);
		
		mav.addObject("hostingnum", num);
		
		
		
		mav.addObject("main", "reservation/reserve01");
		
		mav.setViewName("m_index3");
		
		return mav;
		
	}
	
	@RequestMapping("/reserve02")
	public ModelAndView reserve02(@RequestParam Map map, HttpServletRequest request, HttpSession session) throws FileNotFoundException{
		
		ModelAndView mav = new ModelAndView();
		
		String path = ac.getRealPath("/nation.txt");
		File f = new File(path);
		FileInputStream fis = new FileInputStream(f);
		InputStreamReader isr = new InputStreamReader(fis);
		BufferedReader br = new BufferedReader(isr);
		List countrylist = new ArrayList<>();
		try {
			while(true){
				String ss = br.readLine();
				if(ss==null) break;
				countrylist.add(ss);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String totalmoney = (String)map.get("totalmoney");
		
		System.out.println(totalmoney);
		
		request.setAttribute("totalmoney", totalmoney);
		
		String name = (String)session.getAttribute("auth");
		
		map.put("name", name);
		
		System.out.println(map.toString());
		
		String hostingnum = (String)map.get("hostingnum");
		
		
		int r = bdao.addBook(map);
		
		System.out.println("1차 북 등록 여부(1이면 true) : " + r);

		mav.addObject("hostingnum", hostingnum);
				
		mav.addObject("countrylist", countrylist);
				
		mav.addObject("totalmoney", totalmoney);
					
		mav.addObject("main", "reservation/reserve02");
		
		mav.setViewName("m_index2");
		
		return mav;
	}
	
	@RequestMapping("/reserve03")
	public ModelAndView reserve03(@RequestParam Map map, HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		int hostingnum = Integer.parseInt((String)map.get("hostingnum"));
		
		String name = (String)session.getAttribute("auth");
		
		System.out.println("아이디는 " + name);
		
		Map param = new HashMap<>();
		
		
		param.put("hostingnum", hostingnum);
		
		param.put("name", name);
		
		int r = bdao.updateBook(map);	// 나머지 두개 마저 업데이트
		
		Map bookinfo = bdao.getBook(param);
		
		System.out.println(bookinfo.toString());
		
		System.out.println("2차 북 등록 여부(1이면 true) : " + r);
		
		mav.addObject("bookinfo", bookinfo);
		
		mav.addObject("main", "reservation/reserve03");
		
		mav.setViewName("m_index2");
		
		return mav;
	}
	
	
	@RequestMapping("/mywishlist")
	public ModelAndView mywishlist(HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		String id = (String)session.getAttribute("auth");
		
		
		System.out.println("아이디는 " + id);
		
		Map param = new HashMap<>();
		
		param.put("id", id);
		
		List wishlist = hdao.getWishList(param);
		
		List hostinglist = hdao.getHostingList(param);
		
		mav.addObject("wishlist", wishlist);
		
		mav.addObject("hostinglist", hostinglist);
		
		mav.addObject("main", "reservation/mywishlist");
		
		mav.setViewName("m_index3");
		
		return mav;
		
	}
	
	@RequestMapping("/hostinglist")
	public ModelAndView allHostinglistHandler(@RequestParam("id")String id){
		HashMap map = new HashMap();
		map.put("id", id);
		List hostinglist = hdao.getHostingList(map);
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("m_index3");
		mav.addObject("main", "reservation/hostinglist");
		mav.addObject("list", hostinglist);
		return mav;
		
		
		
	}
	
	@RequestMapping("/booklist")
	public ModelAndView allbooklistHandler(@RequestParam("id")String id){
		HashMap map = new HashMap();
		map.put("id", id);
		List wishlist = hdao.getWishList(map);
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("m_index3");
		mav.addObject("main", "reservation/hostinglist");
		mav.addObject("list", wishlist);
		return mav;
		
		
		
	}
}
