package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InfoDao {
	@Autowired
	SqlSessionFactory factory;
	
	public HashMap readOne(String id){
		HashMap list = null;
		SqlSession sql = factory.openSession();
		try{
			list = sql.selectOne("info.info", id);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sql.close();
		}
		return list;
	}
	public int updateInfo(HashMap map){
		SqlSession sql = factory.openSession();
		int rst = 0;
		try{
			rst = sql.update("info.updateInfo", map);
			if(rst == 1)
				sql.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sql.close();
		}
		return rst;
	}
	public int deleteId(String id){
		SqlSession sql = factory.openSession();
		int rst = 0;
		try{
			rst = sql.delete("join.deleteId", id);
			if(rst == 1)
				sql.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sql.close();
		}
		return rst;
	}
	public int deletePic(HashMap map){
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
	
	public List getNum(HashMap map){
		SqlSession sql = factory.openSession();
		List list = new ArrayList();
		
		try{
			list = sql.selectList("info.getnum",map);
				sql.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sql.close();
		}
		return list;
	}
	
	
	public List readAll(){
		SqlSession sql = factory.openSession();
		List list = new ArrayList();
		
		try{
			list = sql.selectList("info.readAll");
				sql.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sql.close();
		}
		return list;
	}
}


