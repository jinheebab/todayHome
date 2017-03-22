package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.MessageDao;

@Controller
@RequestMapping("/view/")
public class MessageController {

	@Autowired
	MessageDao mdao;

	@RequestMapping("/message") // 수신 리스트 and 메시지 main
	public ModelAndView message(HttpSession session) { //
		System.out.println("메시지 '수신' 리스트 접속");
		ModelAndView mav = new ModelAndView();

		System.out.println((String) session.getAttribute("auth"));
		HashMap map = new HashMap();
		map.put("receiver", (String) session.getAttribute("auth"));
		List message = mdao.getreceiveList(map);
		System.out.println(message);

		mav.setViewName("m_index2");
		mav.addObject("main", "message/message");
		mav.addObject("listl", message);

		return mav;
	}

	/*
	 * // 페이징 컨트롤러
	 * 
	 * @RequestMapping(value = "/message", method = RequestMethod.GET ) public
	 * ModelAndView list(HttpSession MessageDao, Model model) {
	 * 
	 * logger.info("START LIST"); int count = 0;
	 * 
	 * pagemaker.setPage(pagemaker.getPage());
	 * 
	 * count = service.count(); // 레코드 총 갯수 구함 pagemaker.setCount(count); // 페이지
	 * 계산 List<BoardVO>
	 * 
	 * list = service.getRead(pagemaker.getPage()); System.out.println("list = "
	 * + list.toString()); model.addAttribute("auth",);
	 * 
	 * model.addAttribute("pageMaker", pagemaker); return "/board/list"; }
	 */

	@RequestMapping("/sendlist")
	public ModelAndView sendlist(HttpSession session) {
		System.out.println("메시지 '발신' 리스트 접속");
		ModelAndView mav = new ModelAndView();

		String sender = (String) session.getAttribute("auth");
		HashMap map = new HashMap();
		map.put("sender", sender);
		List<HashMap> list = mdao.getsendList(map);

		mav.setViewName("m_index2");
		mav.addObject("main", "message/sendlist");
		mav.addObject("lists", list);

		return mav;
	}

	@RequestMapping("/send")
	public ModelAndView send(HttpSession session) {
		System.out.println("메시지 '작성' 페이지 접속");
		ModelAndView mav = new ModelAndView();

		String send = (String) session.getAttribute("auth");
		mav.setViewName("m_index2");
		mav.addObject("main", "message/send");
		mav.addObject("send", send);
		return mav;
	}

}
