package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SharingDao {
	@Autowired
	DataSource ds;
	@Autowired
	SqlSessionFactory factory;
	
	public int createOne(HashMap map){
		int rst = 0;
		SqlSession sql = factory.openSession();
		try {
			rst = sql.insert("sharing.createOne", map);
			if (rst == 1)
				sql.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.close();
		}
		return rst;
	}
	public List<HashMap> read(HashMap map){
		List<HashMap>list = new ArrayList<>();
		SqlSession sql = factory.openSession();
		try{
			list = sql.selectList("sharing.read", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sql.close();
		}
		return list;
	}
	public int update(HashMap map){
		SqlSession sql = factory.openSession();
		int rst = 0;
		try{
			rst = sql.update("sharing.update", map);
			if(rst == 1)
				sql.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sql.close();
		}
		return rst;
	}
}
