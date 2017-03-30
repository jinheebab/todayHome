package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public void popularInsert() {
		List list = new ArrayList();
		list = md.HostingNumHandler();

		List id = new ArrayList();
		id = msd.getRecvAll();

		Set<Integer> set = new HashSet<Integer>();
		List random = new ArrayList();
		for (int t = 0; t < 100000; t++) {
			int ran = (int) (Math.random() * list.size());
			set.add(ran);
		}
		for (int r : set) {
			random.add(r);
		}
		for (int i = 0; i < 6047; i++) {
			HashMap map = new HashMap();

			// hosting num 추출
			HashMap nm = (HashMap) list.get((int)random.get(i));

			// during 추출
			int hostingdate = 1 + (int) (Math.random() * 90); // 호스팅 허용기간
			int avg = 1 + (int) (Math.random() * hostingdate); // 예약된 기간

			Double during = (double) avg / hostingdate;
			int real = (int) (during * 100);

			// viewcount 추출
			int viewCnt = 1 + (int) (Math.random() * 500);

			// id 추출

			int ran2 = (int) (Math.random() * id.size());
			HashMap idMap = (HashMap) id.get(ran2);

			map.put("num", nm.get("NUM"));
			map.put("during", real);
			map.put("viewCNT", viewCnt);
			map.put("id", idMap.get("ID"));
			System.out.println(map);

			mt.insert(map, "popular");

		}
	}

	@RequestMapping("/mongo/get")
	public void getToplist() {
		List list = md.Toplist();
		
		
	}
}
