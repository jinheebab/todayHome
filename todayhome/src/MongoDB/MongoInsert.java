package MongoDB;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

@Service
public class MongoInsert {
	@Autowired
	MongoTemplate mt;
	
	// 검색결과 인서트
	public void searchInsert(){
		HashMap map = new HashMap();
			String[] target={"서울","서울","","",""};
			String[] startMonth={};
			String[] endMonth={};
			String[] peopleCnt={};
			String[] id={}; // 있는거에서 
	}
	// 뷰꾸미기 용 가상 인서트
	public void popularInsert(){
		HashMap map = new HashMap();
			String[] hostingnum={}; // 있는거에서
			String[] during={};
			String[] viewcount={}; 
	}
	// 검색결과가 빈약 지역 홍보용
	public void cntInsert(){
		String[] resultCnt={""};
	}
}
