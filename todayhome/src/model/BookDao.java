package model;

import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookDao {

	@Autowired
	SqlSessionFactory factory;
	@Autowired
	ServletContext application;
	
	
	public int addBook(Map map) {
		SqlSession session = factory.openSession();
		int r = 0;
		try {
			r = session.insert("booking.add", map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return r;
	}
	
}
