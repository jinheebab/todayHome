package model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainDao {
	@Autowired
	SqlSessionFactory factory;
	
	public List getMainList() {
		SqlSession session = factory.openSession();
		List<HashMap> list= null;
		try {
			list = session.selectList("getMainList");
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	
}
