package controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
	@RequestMapping("/host02")
	@ResponseBody
	public String host02(@RequestParam ("city") String city){
		
		System.out.println(city);
		
		Map param = new HashMap<>();
		
		param.put("city", city);
		
		Map map = hdao.getPrice(param);
		
		System.out.println(map.toString());
		
		BigDecimal price = (BigDecimal)map.get("PRICE");	
															
		System.out.println("price는"+price);				
		
		return price.toString();
	}
	
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(@RequestParam(name="fileObj") MultipartFile file) throws Exception {
		
		System.out.println(file.toString());
		
		Map map = fdao.execute(file);
		
		String picurl = (String)map.get("filelink");
		
		return picurl.toString();
		
	}
	
	
	@RequestMapping("/upload2")
	@ResponseBody
	public Map upload2(@RequestParam(name="fileObj") MultipartFile file, HttpSession session) throws Exception {
		
		System.out.println(file.toString());
		
		String id = (String)session.getAttribute("auth");
		
		Map map = fdao.execute(file);
		
		Map json = new HashMap<>();
		
		String type = (String)map.get("type");
		
		String filename = (String)map.get("filename");
		
		long filesize = (long)map.get("filesize");
		
		String fileaddress = (String)map.get("filelink");
		
		json.put("type", type);
		
		json.put("filename", filename);
		
		json.put("filesize", filesize);
		
		json.put("fileaddress", fileaddress);
		
		json.put("filelink", fileaddress);
		
		json.put("id", id);
		
		String  objm = new ObjectMapper().writeValueAsString(json);
		System.out.println(objm);
		return json;
		
	}
	
	
		
	
	
	
	
	
	@RequestMapping("/host03")
	public ModelAndView host03(@RequestParam Map map){
		
		System.out.println(map.toString());
		
		ModelAndView mav= new ModelAndView();
		
		Map hostinginfo = map;
		
		int n = hdao.addHosting(map);
		
		int hostingNumber = hdao.getHostingNum(map);
		
		System.out.println("호스팅등록성공하면 1 == " +n);
		
		if(n == 1){
			
			mav.addObject("hostinginfo", hostinginfo);
			
			mav.addObject("hostingNumber", hostingNumber);
			
			mav.addObject("main", "hosting/host02");
			
			mav.setViewName("m_index2");
			
		}else{
			
			mav.addObject("main", "hosting/host01");
			
			mav.setViewName("m_index2");
		}
		
			return mav;
		
	}
	
	@RequestMapping("/host04")
	public ModelAndView host04(@RequestParam Map map){
		
		ModelAndView mav = new ModelAndView();
		
		int r = sdao.createOne(map);
		
		if(r == 1){
		
			mav.addObject("main", "hosting/host03");
		
			mav.setViewName("m_index2");
		
		}else{
			mav.addObject("main", "hosting/host02");
			
			mav.setViewName("m_index2");
		}
		return mav;
		
	}
	
	@RequestMapping("/again")
	public ModelAndView again(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("main", "hosting/host02");
		
		mav.setViewName("m_index2");
		
		return mav;
		
	}
	
	
}