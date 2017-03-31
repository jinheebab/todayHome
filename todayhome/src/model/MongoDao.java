package model;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationOperation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service
public class MongoDao {
	@Autowired
	SqlSessionFactory factory;
	@Autowired
	MongoTemplate mt;
	
	public List HostingNumHandler(){
		SqlSession session = factory.openSession();
		List list = new ArrayList();
		try{
			list = session.selectList("hosting.getNum");
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	public List bookToplist() {
		AggregationOperation a1 = Aggregation.match(Criteria.where("during").gt(70));
		AggregationOperation a2 = Aggregation.sort(Sort.Direction.DESC, "during");
		 AggregationOperation a3 = Aggregation.limit(100);
		Aggregation go = Aggregation.newAggregation(a1,a2,a3);
		System.out.println(go.toString());
		AggregationResults<Map> results = mt.aggregate(go, "popular", Map.class);
		List<Map> li = results.getMappedResults();
		System.out.println(li);
		return li;
	}
	
	public List viewToplist() {
		AggregationOperation a1 = Aggregation.match(Criteria.where("viewCNT").gt(450));
		 AggregationOperation a2 = Aggregation.sort(Sort.Direction.DESC, "viewCNT");
		 AggregationOperation a3 = Aggregation.limit(100);
		// 그것을 count해서 cnt로 출력
		// count연산이 있음 count연산한 것의 field명을 cnt로 하겠다는 것
		Aggregation go = Aggregation.newAggregation(a1,a2,a3);
		System.out.println(go.toString());
		AggregationResults<Map> results = mt.aggregate(go, "popular", Map.class);
		List<Map> li = results.getMappedResults();
		System.out.println(li);
		return li;
	}
}
