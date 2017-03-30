package MongoDB;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

@Service
public class PopularInsert {
	
	@Autowired
	MongoTemplate mt;
	// 뷰꾸미기 용 가상 인서트
	public void popularInsert(){
		HashMap map = new HashMap();
			String[] hostingnum={}; // 있는거에서
			String[] during={};
			String[] viewcount={}; 
	}
}
