package model;

import java.util.ArrayList;
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
	
	
	//수신리스트
	public List<HashMap> getreceiveList(HashMap map){
		System.out.println(map);
		List<HashMap> list = null;
		try{
			SqlSession sql = factory.openSession();
			list = sql.selectList("message.getRecvMsgs", map);
			sql.close();
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}	
			
		return list;
	}		
	
	
	//발신리스트
	public List getsendList(HashMap map){
		
		List list = null;
		try{
			SqlSession sql = factory.openSession();
			list = sql.selectList("message.getSendList", map);
			sql.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}	
		
		return list;
		
	}
	
	//메시지 보내기
	public boolean sendRecv(HashMap map){
		boolean rst = false;
		try{
			SqlSession sql = factory.openSession();
			int r = sql.insert("message.addMsg", map);
			if(r == 1){
				rst= true;
				sql.commit();
			}else{
				rst = false;
			}
			sql.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}	
		return rst;
	}	
		
	//회원찾기
	public List<HashMap> getRecvAll(){
		List<HashMap> list = new ArrayList();
		try{
			SqlSession sql = factory.openSession();
			list = sql.selectList("message.findAll");
			sql.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
}




