package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class StatisticDao {
	@Autowired
	SqlSessionFactory factory;
	
public List location() {	
		
		List list = new ArrayList<>();
		SqlSession sql = factory.openSession();
		try {
			list = sql.selectList("statistic.location");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return list;
}


public List country() {	
	
	List list = new ArrayList<>();
	SqlSession sql = factory.openSession();
	try {
		list = sql.selectList("statistic.country");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		sql.close();
	}
	return list;
}
	
	

public List country2() {	
	
	List list = new ArrayList<>();
	SqlSession sql = factory.openSession();
	try {
		list = sql.selectList("statistic.country2");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		sql.close();
	}
	return list;
}
	
}
