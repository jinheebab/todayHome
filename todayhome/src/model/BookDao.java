package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
			r = session.insert("booking.addOne", map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return r;
	}
	
	public int updateBook(Map map){
		
		SqlSession session = factory.openSession();
		int r = 0;
		try {
			r = session.insert("booking.update", map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return r;
		
	}
	
	public Map getBook(Map param) {	
		
		Map map = new HashMap<>();
		SqlSession sql = factory.openSession();
		try {
			map = sql.selectOne("booking.getBook",param);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return map;
}
	
	public List getReserveDate(Map param){
		
		List list = new ArrayList<>();
		SqlSession sql = factory.openSession();
		try {
			list = sql.selectOne("booking.getReserveDate",param);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return list;
	}
	
	

		
		
	
	
}
