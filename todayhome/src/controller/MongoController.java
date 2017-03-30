package controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import model.MongoDao;

@Controller
public class MongoController {
	
/*	@Autowired
	MongoTemplate mt;*/
	@Autowired
	MongoDao md;
	
	@RequestMapping("/mongo/pop")
	public void popularInsert(){
		HashMap map = new HashMap();
			
			
			//hosting num 추출
			List list = new ArrayList();
			list = md.HostingNumHandler();
			int ran = (int)(Math.random()*list.size());
			HashMap nm = (HashMap)list.get(ran);
			map.put("num", nm.get("NUM"));
			System.out.println("넘버값은 "+nm.get("NUM"));
			
			//during 추출
			int hostingdate = 1+(int)(Math.random()*90); //호스팅 허용기간
			int avg = 1+(int)(Math.random()*hostingdate); //예약된 기간

			Double during = (double)avg/hostingdate;
			int real = (int)(during*100);
			System.out.println("한달 후 예약마감율: "+real+"%"); //real은 호스팅 후 한달 후에 예약된 비율을 말한다.
			
			//viewcount 추출
			int viewCnt = 1+(int)(Math.random()*10000);
			System.out.println("viewcount:"+viewCnt);
			
	}
	
}
