package model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginDao {
	
	@Autowired
	SqlSessionFactory factory;
	
	
	public boolean confirm(HashMap map){
		SqlSession sql = factory.openSession();
			try {
			int r = sql.selectOne("join.confirm", map);
			if(r==1){
				return true;
			}else{
				return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return false;
	}
	

}
