package model;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MongoDao {
	@Autowired
	SqlSessionFactory factory;
	
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
}
