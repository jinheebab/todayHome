package model;

import java.util.HashMap;
import java.util.Map;

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
	public boolean checkMember(Map map){
		boolean flag = false;
		SqlSession session = factory.openSession();
		try{
			int r = session.selectOne("join.checkOne", map);
			if(r==1)
				flag = true;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return flag;
	}
}
