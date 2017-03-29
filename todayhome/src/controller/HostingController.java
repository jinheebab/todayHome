package controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.ast.ContinueStatement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.BookDao;
import model.FileUploadService;
import model.HostingDao;
import model.SharingDao;

@Controller
@RequestMapping("/hosting")
public class HostingController {
	@Autowired
	HostingDao hdao;
	@Autowired
	FileUploadService fdao;
	@Autowired
	SharingDao sdao;
		
	@RequestMapping("/host01")
	public ModelAndView host01(HttpServletRequest request, HttpSession session){	// 컨트롤러  7 - 1번
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("auth") == null){
			mav.addObject("main","login/pagelogin");
			mav.setViewName("g_index");
		}
		String id = (String)session.getAttribute("auth");
			mav.addObject("id",id);
			mav.addObject("main", "hosting/host01");
			mav.setViewName("m_index3");
		return mav;
	}	
	// 타이틀 아작스
	@RequestMapping("/titleAjax")
	@ResponseBody
	public String ajax(@RequestParam(name="title") String title){
		HashMap<String, Object> map = new HashMap<>();
			map.put("title", title);
		boolean rst = hdao.checkTitle(map);
		if(rst)
			return "NNNNN";
		else
			return "YYYYY";
	}
	
	@RequestMapping("/host02")
	@ResponseBody
	public String host02(@RequestParam ("city") String city){
		BigDecimal price = null;
		Map param = new HashMap<>();
		try{
			param.put("city", city);
			Map map = hdao.getPrice(param);
			price = (BigDecimal)map.get("PRICE");	
			return price.toString();
		}catch(Exception e){
			return null;
		}
	}	
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(@RequestParam(name="fileObj") MultipartFile file, HttpSession session) throws Exception {
		Map map = fdao.execute(file);
		String picurl = (String)map.get("filelink");
		session.setAttribute("picurl", picurl);
		return picurl.toString();
	}
	
	// 추가 사진 등록 1
	@RequestMapping("/upload1")
	@ResponseBody
	public String upload1(@RequestParam(name="fileObj") MultipartFile file, HttpSession session) throws Exception {
		Map map = fdao.execute(file);
		String id = (String)session.getAttribute("auth");
		Integer hostingnum = ((Integer)(session.getAttribute("hostingnum"))).intValue();
			map.put("type", "hosting");
			map.put("id", id);
			map.put("hostingnum", hostingnum);
			map.put("additionnum", 1);
			System.out.println(map);
			
		int r = sdao.createOne(map);	
		String picurl = (String)map.get("filelink");
		return picurl.toString();
	}
	// 추가 사진 삭제 1
	@RequestMapping("/delete1")
	@ResponseBody
	public int delete1(HttpSession session){
		String id = (String)session.getAttribute("auth");
		Integer hostingnum = ((Integer)(session.getAttribute("hostingnum"))).intValue();
		HashMap map = new HashMap();
			map.put("type", "hosting");		
			map.put("id", id);
			map.put("hostingnum", hostingnum);
			map.put("additionnum", 1);
			
		int r = sdao.delete(map);
		return r;
	}
	// 추가 사진 등록 2
		@RequestMapping("/upload2")
		@ResponseBody
		public String upload2(@RequestParam(name="fileObj") MultipartFile file, HttpSession session) throws Exception {
			Map map = fdao.execute(file);
			String id = (String)session.getAttribute("auth");
			Integer hostingnum = ((Integer)(session.getAttribute("hostingnum"))).intValue();
				map.put("type", "hosting");
				map.put("id", id);
				map.put("hostingnum", hostingnum);
				map.put("additionnum", 2);
				
			int r = sdao.createOne(map);	
			String picurl = (String)map.get("filelink");
			return picurl.toString();
		}
		// 추가 사진 삭제 2
		@RequestMapping("/delete2")
		@ResponseBody
		public int delete2(HttpSession session){
			String id = (String)session.getAttribute("auth");
			Integer hostingnum = ((Integer)(session.getAttribute("hostingnum"))).intValue();
			HashMap map = new HashMap();
				map.put("type", "hosting");		
				map.put("id", id);
				map.put("hostingnum", hostingnum);
				map.put("additionnum", 2);
			
			int r = sdao.delete(map);
			return r;
		}
		// 추가 사진 등록 3
		@RequestMapping("/upload3")
		@ResponseBody
		public String upload3(@RequestParam(name="fileObj") MultipartFile file, HttpSession session) throws Exception {
			Map map = fdao.execute(file);
			String id = (String)session.getAttribute("auth");
			Integer hostingnum = ((Integer)(session.getAttribute("hostingnum"))).intValue();
				map.put("type", "hosting");
				map.put("id", id);
				map.put("hostingnum", hostingnum);
				map.put("additionnum", 3);
				
			int r = sdao.createOne(map);	
			String picurl = (String)map.get("filelink");
			return picurl.toString();
		}
		// 추가 사진 삭제 3
		@RequestMapping("/delete3")
		@ResponseBody
		public int delete3(HttpSession session){
			String id = (String)session.getAttribute("auth");
			Integer hostingnum = ((Integer)(session.getAttribute("hostingnum"))).intValue();
			HashMap map = new HashMap();
				map.put("type", "hosting");		
				map.put("id", id);
				map.put("hostingnum", hostingnum);
				map.put("additionnum", 3);
			
			int r = sdao.delete(map);
			return r;
		}
		// 추가 사진 등록 4
		@RequestMapping("/upload4")
		@ResponseBody
		public String upload4(@RequestParam(name="fileObj") MultipartFile file, HttpSession session) throws Exception {
			Map map = fdao.execute(file);
			String id = (String)session.getAttribute("auth");
			Integer hostingnum = ((Integer)(session.getAttribute("hostingnum"))).intValue();
				map.put("type", "hosting");
				map.put("id", id);
				map.put("hostingnum", hostingnum);
				map.put("additionnum", 4);
				
			int r = sdao.createOne(map);	
			String picurl = (String)map.get("filelink");
			return picurl.toString();
		}
		// 추가 사진 삭제 4
		@RequestMapping("/delete4")
		@ResponseBody
		public int delete4(HttpSession session){
			String id = (String)session.getAttribute("auth");
			Integer hostingnum = ((Integer)(session.getAttribute("hostingnum"))).intValue();
			HashMap map = new HashMap();
				map.put("type", "hosting");		
				map.put("id", id);
				map.put("hostingnum", hostingnum);
				map.put("additionnum", 4);
			
			int r = sdao.delete(map);
			return r;
		}
	
	
	@RequestMapping("/host03")
	public ModelAndView host03(@RequestParam Map map, HttpSession session){
		System.out.println(map);
		
		String hname = (String)session.getAttribute("auth");
			map.put("hname", hname);
		ModelAndView mav= new ModelAndView();
		Map hostinginfo = map;
		int n = hdao.addHosting(map);
		int hostingNumber = hdao.getHostingNum(map);
		session.setAttribute("hostingnum", new Integer(hostingNumber));
		
		if(n == 1){
			mav.addObject("hostinginfo", hostinginfo);
			mav.addObject("hostingNumber", hostingNumber);
			mav.addObject("main", "hosting/host03");
			mav.setViewName("m_index3");
		}else{
			mav.addObject("main", "hosting/host01");
			mav.setViewName("m_index3");
		}
		return mav;
	}
	@RequestMapping("/host04")
	public ModelAndView host04(HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping("/again")
	public ModelAndView again(HttpSession session){
		String picurl = (String)session.getAttribute("picurl");
		ModelAndView mav = new ModelAndView();
			mav.addObject("main", "hosting/host02");
			mav.addObject("picurl", picurl);
			mav.setViewName("m_index3");
		return mav;
	}
}