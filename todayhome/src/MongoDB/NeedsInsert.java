package MongoDB;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

@Service
public class NeedsInsert {
	
	@Autowired
	MongoTemplate mt;
	// 검색결과가 빈약 지역 홍보용
	public void cntInsert(){
		String[] resultCnt={""};
	}
}
