package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public int createOne(Map map){
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
	public HashMap read(HashMap map){
		HashMap photomap = new HashMap();
		SqlSession sql = factory.openSession();
		try{
			photomap = sql.selectOne("sharing.getuphoto", map);
			System.out.println("map사이즈"+photomap.size());
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sql.close();
		}
		return photomap;
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
	public int delete(HashMap map){
		SqlSession sql = factory.openSession();
		int rst = 0;
		try{
			rst = sql.delete("sharing.delete", map);
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
