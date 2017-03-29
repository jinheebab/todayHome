package MongoDB;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

@Service
public class MongoInsert {
	@Autowired
	MongoTemplate mt;
	
	public int search(){
		HashMap map = new HashMap();
		String target = ""; 
		
		
		int result = 0;
		return result;
	}
}
