package model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageDao {
	@Autowired
	SqlSessionFactory factory;
	
	public List getRecvMsgs(String receiver){
		
		List list = null;
		try{
			SqlSession sql = factory.openSession();
			list = sql.selectList("message.getRecvMsgs", receiver);
			sql.close();
			
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
		return list;
		
	}
	public int sendRecv(HashMap<String, Object> map){
		try{
			SqlSession sql = factory.openSession();
			int rst = sql.insert("mappers.message-mapper.addMsg", map);
			if(rst == 1){
				sql.commit();
			}
			sql.close();
			return rst;
			
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	public List<HashMap> getRecvAll(){
		try{
			SqlSession sql = factory.openSession();
			List<HashMap> list = sql.selectList("mappers.message-mapper.findAll");
			sql.close();
			return list;
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	public boolean existOne(String target) {
		boolean rst = false;
		try {
			SqlSession sql = factory.openSession();
			HashMap map = sql.selectOne("mappers.message-mapper.findTarget");
			if(map != null)
				rst = !rst;
			sql.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rst;
	}
}




