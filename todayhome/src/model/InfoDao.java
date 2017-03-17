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

	public List<HashMap> readOne(String id){
		List<HashMap> list = new ArrayList<>();
		SqlSession sql = factory.openSession();
		try{
			list = sql.selectList("info.info", id);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sql.close();
		}
		return list;
	}
	public int updatePic(String id){
		SqlSession sql = factory.openSession();
		int rst = 0;
		try{
			rst = sql.update("info.updatePic", id);
			if(rst == 1)
				sql.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sql.close();
		}
		return rst;
	}
	public int updateInfo(String id){
		SqlSession sql = factory.openSession();
		int rst = 0;
		try{
			rst = sql.update("info.updateInfo", id);
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
