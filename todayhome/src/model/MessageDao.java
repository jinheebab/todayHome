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

	// 수신리스트
	public List<HashMap> getMyMessage(Map map) {
		System.out.println(map);
		List<HashMap> list = null;
		try {
			SqlSession sql = factory.openSession();
			list = sql.selectList("message.getRecvMsgs", map);
			sql.close();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}

	// 발신리스트
	public List<HashMap> getsendMessage(Map map) {
		System.out.println(map);
		List<HashMap> list = null;
		try {
			SqlSession sql = factory.openSession();
			list = sql.selectList("message.getSendList", map);
			sql.close();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}

	// 메시지 보내기
/*	public boolean sendRecv(Map map){ // 메시지 DAO 원본!!
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
	}*/
	// 메시지 보내기
	public int sendRecv(String title, String content ) {
		int rst = 0;
		SqlSession sql = factory.openSession();
		try{
			HashMap param = new HashMap<>();
			param.put("TITLE", title);
			param.put("CONTENT", content);
			rst = sql.insert("message.addMsg", param);
			if(rst == 1)
				sql.commit();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return rst;
	}

/*	public int createOne(String writer, String content, String ip) {
	int rst = 0;
	SqlSession sql = factroy.openSession();
	try {
		HashMap param = new HashMap<>();
		param.put("WRITER", writer);
		param.put("CONTENT", content);
		param.put("IP", ip);
		rst = sql.insert("review.createOne", param);
		if (rst == 1)
			sql.commit();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		sql.close();
	}
	return rst;
	}			*/

	
	// 회원찾기
	public List<HashMap> getRecvAll() {
		List<HashMap> list = new ArrayList();
		SqlSession sql = factory.openSession();
		try {
			list = sql.selectList("message.findAll");
			sql.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}