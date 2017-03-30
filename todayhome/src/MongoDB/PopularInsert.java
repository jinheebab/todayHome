package MongoDB;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;

import model.MongoDao;

@Controller
public class PopularInsert {
	
	@Autowired
	MongoTemplate mt;
	@Autowired
	MongoDao md;
	// 뷰꾸미기 용 가상 인서트
	public void popularInsert(){
		HashMap map = new HashMap();
			String[] hostingnum={}; // 있는거에서
			String[] during={};
			String[] viewcount={}; 
			
			//hosting num 추출
			List list = new ArrayList();
			list = md.HostingNumHandler();
			
	}
}
