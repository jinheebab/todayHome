package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import model.MessageDao;
import model.MongoDao;

@Controller
public class MongoController {
	

	@Autowired
	MongoDao md;
	@Autowired
	MessageDao msd;
	@Autowired
	MongoTemplate mt;
	
	@RequestMapping("/mongo/pop")
	public void popularInsert(){
		List list = new ArrayList();
		list = md.HostingNumHandler();
		
		List id = new ArrayList();
		id = msd.getRecvAll();
		
		for(int i=0; i<150000; i++){
		HashMap map = new HashMap();
			
			
			//hosting num 추출

			int ran = (int)(Math.random()*list.size());
			HashMap nm = (HashMap)list.get(ran);
			
			//during 추출
			int hostingdate = 1+(int)(Math.random()*90); //호스팅 허용기간
			int avg = 1+(int)(Math.random()*hostingdate); //예약된 기간

			Double during = (double)avg/hostingdate;
			int real = (int)(during*100);
			String duringreal = real+"%";
			
			//viewcount 추출
			int viewCnt = 1+(int)(Math.random()*10000);
			
			//id 추출

			int ran2 = (int)(Math.random()*id.size());
			HashMap idMap = (HashMap)id.get(ran2);
			
			
			map.put("num", nm.get("NUM"));
			map.put("during", duringreal);
			map.put("viewCNT", viewCnt);
			map.put("id", idMap.get("ID"));
			System.out.println(map);
			
			mt.insert(map, "popular");
		}
	}
	
}
