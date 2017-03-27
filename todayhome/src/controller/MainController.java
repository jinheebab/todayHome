package controller;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.HostingDao;
import model.MainDao;

@Controller
public class MainController {

	@Autowired
	HostingDao hd;
	@Autowired
	MainDao md;

	@RequestMapping("/view/")
	public ModelAndView main(HttpServletRequest request, HttpSession session) {
		// 컨트롤러 1 - 1번
		
		Cookie s = null;
		Cookie[] ar = request.getCookies();
		if (ar != null) {
			for (Cookie t : ar) {
				if (t.getName().equals("auto")) {
					s = t;
				}
			}
		}
		
		ModelAndView mav = new ModelAndView();
		List<HashMap> list = hd.readHostingSome();
		
		if (s != null) {
			session.setAttribute("id", s.getValue());
			mav.setViewName("m_index");
			mav.addObject("list", list);
			mav.addObject("main", "/main/main");
			
		}else if(session.getAttribute("auth")!=null){
			mav.setViewName("m_index");
			mav.addObject("list", list);
			mav.addObject("main", "/main/main");
			
		}else {
			mav.setViewName("g_index");
			mav.addObject("list", list);
			mav.addObject("main", "/main/main");
		}
		return mav;
	}
	
	
	@RequestMapping("view/detail")
	public ModelAndView detailHandler(@RequestParam("num")String num, HttpSession session){
		HashMap map = new HashMap();
		map.put("num", num);
		
		List<HashMap> list = md.getDetaillist(map);
		
		double avgstar = md.getScore(map);
		System.out.println(avgstar);
		avgstar = avgstar*10;
		int score = (int)avgstar;
		
		List<HashMap> review = md.getReview(map);
		System.out.println("리뮤갯수: "+review.size());
		List<HashMap> reviewerphoto = new ArrayList();
		HashMap reviewer = new HashMap();
		Iterator<HashMap> it = review.iterator();
		while(it.hasNext()){
			reviewer.put("id", it.next().get("WRITER"));
			reviewerphoto.add(md.getUserPhoto(reviewer)); 
		}
		
		List<HashMap> reviewcnt  = md.getReviewcnt(map);
		
		String hoster = md.hoster(num);
		System.out.println("hoster name="+ hoster);
		HashMap map2 = new HashMap();
		map2.put("id", hoster);
		HashMap uphoto = md.getUserPhoto(map2);
		
		HashMap map3 = new HashMap();
		map3.put("id", hoster);
		List<HashMap> hphoto = md.getHostingPhoto(map3);
		
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("auth")!=null){
		mav.setViewName("m_detail");
		System.out.println("멤버임");
		}else{
			mav.setViewName("g_detail");
			System.out.println("멤버아님");	
		}
		mav.addObject("list", list);
		mav.addObject("score", score);
		mav.addObject("uphoto", uphoto);
		mav.addObject("hphoto", hphoto);
		mav.addObject("review", review);
		mav.addObject("reviewcnt", reviewcnt);
		mav.addObject("reviewerphoto", reviewerphoto);
		mav.addObject("main", "main/detail");
		
		
		return mav;
	}
	
	
	@RequestMapping("view/review/resultAjax")
	@ResponseBody 
	public boolean chatHandler(@RequestParam("msg")String msg, @RequestParam("grade")double grade, @RequestParam("hostingnum")int num,
			HttpSession session){
			HashMap map = new HashMap (); 
			map.put("writer", session.getAttribute("auth"));
			map.put("msg", msg);
			map.put("grade", grade);
			map.put("hostingnum", num);
			
			System.out.println(msg);
			boolean rst = md.addReview(map);
		return rst;
	}
	
	@RequestMapping("view/review/listAjax")
	@ResponseBody 
	public List listHandler(@RequestParam("num")String num) {	
		System.out.println("넘 대령이오:"+ num);
		HashMap map = new HashMap();
		map.put("num", num);
		List li = new ArrayList();
		li = md.AjaxReviewHandler(map);
		
		HashMap map2 = new HashMap();
		
		double avgstar = md.getScore(map);
		avgstar = avgstar*10;
		int score = (int)avgstar;
		map2.put("SCORE", score);
		li.add(map2);
		
		List<HashMap> ll = md.getReviewcnt(map);
		Iterator c = ll.iterator();
		while(c.hasNext()){
			HashMap cnt =(HashMap)c.next();
			li.add(cnt);
		}
		System.out.println("아작스 가져옴");
		
		return li;
	
	}
	
}
