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
public class MessageDao {
	@Autowired
	SqlSessionFactory factory;
	
	
	//수신리스트
	public List<HashMap> getMyMessage(Map map){
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
	public List getsendList(Map map){
		
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
	public boolean sendRecv(Map map){
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
	
	//메시지 보내기
	public class RequestModel {
		private String title;
		private String content;

		public String getTitle() {
				return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		} public void setContent(String content) {
			this.content = content;
		}
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




