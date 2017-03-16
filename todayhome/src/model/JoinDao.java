package model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinDao {
	@Autowired
	SqlSessionFactory factory;
	
	public int addMember(HashMap map){
		SqlSession session = factory.openSession();
		int r = 0;
		try{
			r = session.insert("join.insert", map);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			session.rollback();
		}finally{
			session.close();
		}
		return r;
	}
}
