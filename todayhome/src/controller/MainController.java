package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.HostingDao;
import model.MainDao;
import model.MongoDao;
import service.reviewSetting;

@Controller
public class MainController {

	@Autowired
	HostingDao hd;
	@Autowired
	MainDao md;
	@Autowired
	reviewSetting rs;
	@Autowired
	MongoDao mongd;
	@Autowired
	ServletContext application;
	
	
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
		List viewtop = mongd.viewToplist();
		application.setAttribute("viewtop", viewtop);
		List booktop = mongd.bookToplist();
		application.setAttribute("booktop", booktop);
		
		List viewNum = new ArrayList();
		Iterator it = viewtop.iterator();
		while(it.hasNext()){
			HashMap imsi = (HashMap)it.next();
			viewNum.add(imsi.get("num"));
		}
		
		List bookNum = new ArrayList();
		Iterator itt = booktop.iterator();
		while(itt.hasNext()){
			HashMap imsi = (HashMap)itt.next();
			bookNum.add(imsi.get("num"));
		}
		
		List<HashMap> booklist = hd.getbooktopList(bookNum);
		List<HashMap> viewlist = hd.getviewtopList(viewNum);
		ModelAndView mav = new ModelAndView();
		
		if (s != null) {
			session.setAttribute("id", s.getValue());
			mav.setViewName("m_index");
			mav.addObject("viewlist", viewlist);
			mav.addObject("booklist", booklist);
			mav.addObject("main", "/main/main");
			
		}else if(session.getAttribute("auth")!=null){
			mav.setViewName("m_index");
			mav.addObject("viewlist", viewlist);
			mav.addObject("booklist", booklist);
			mav.addObject("main", "/main/main");
			
		}else {
			mav.setViewName("g_index");
			mav.addObject("viewlist", viewlist);
			mav.addObject("booklist", booklist);
			mav.addObject("main", "/main/main");
		}
		return mav;
	}
	
	
	@RequestMapping("view/detail")
	public ModelAndView detailHandler(@RequestParam("num")int num, HttpSession session){
		String id = (String)session.getAttribute("auth");
		
		System.out.println("넘어온 호스팅 넘버는 ? " + num);
		
		session.setAttribute("hostingnum",num);
		
		HashMap map = new HashMap();
		map.put("num", num);
		
		List<HashMap> list = md.getDetaillist(map);
		System.out.println(list);
		
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
		mav.addObject("top", application.getAttribute("booktop"));
		mav.addObject("score", score);
		mav.addObject("uphoto", uphoto);
		mav.addObject("hphoto", hphoto);
		mav.addObject("review", review);
		mav.addObject("reviewcnt", reviewcnt);
		mav.addObject("reviewerphoto", reviewerphoto);
		mav.addObject("main", "main/detail");
		mav.addObject("id", id);
		
		return mav;
	}
	// 삭제
	@RequestMapping("view/delete")
	public ModelAndView hostingDelete(){
		ModelAndView mav = new ModelAndView();
			mav = new ModelAndView("m_index2");
			mav.addObject("main", "/main/delete");
		return mav;
	}
	@RequestMapping("view/delete1")
	public ModelAndView hostingDeleteAjax(@RequestParam(name="pass") String pass, HttpSession session){
		String id = (String)session.getAttribute("auth");
		Integer hostingnum = ((Integer)(session.getAttribute("hostingnum"))).intValue();
		
		
		HashMap map = new HashMap();
			map.put("hname", id);
			map.put("num", hostingnum);
			
		List li = new ArrayList();
			li = md.getPass(id);
		HashMap result = (HashMap)li.get(0);
		String PASS = (String)result.get("PASS");
		if(PASS.equals(pass)){
			int r = hd.delete(map);
			ModelAndView mav = new ModelAndView();
				if(r == 0){
						mav = new ModelAndView("/main/delete1");
						mav.addObject("msg", "호스팅 삭제가 실패하였습니다.");
				}else{
						mav = new ModelAndView("/main/delete1");
						mav.addObject("msg", "호스팅 삭제가 성공하였습니다.");
				}
			return mav;
		}
		
		ModelAndView mav = new ModelAndView();
			mav = new ModelAndView("/main/delete1");
		return mav;
	}
	
	
	@RequestMapping("view/review/resultAjax")
	@ResponseBody 
	public boolean chatHandler(@RequestParam("msg")String msg, @RequestParam("grade")double grade, @RequestParam("hostingnum")int num,
			HttpSession session){
			HashMap map = new HashMap (); 
			map.put("writer", session.getAttribute("auth"));
			map.put("content", msg);
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
	
	@RequestMapping("view/make")
	public void MakeHandler(){
		rs.ReviewMaker();
	}
	
}
