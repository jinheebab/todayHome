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
	
	// 수신리스트 '페이징' =====================================================
	public List<HashMap> getMyMessagePage(HashMap map){
		List<HashMap> list = new ArrayList<>();
		SqlSession sql = factory.openSession();
		try {
			list = sql.selectList("message.rpaging", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return list;
	}
	
	public int getRMessageNum(Map param){
		int rMsgnumber = 0;
		SqlSession sql = factory.openSession();
		try {
			rMsgnumber = sql.selectOne("message.getRmessagenum",param);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return rMsgnumber;
	}	
	
	// ========================================================================
	
	
	
	// 발신리스트 ==============================================================
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

	public int getSMessageNum(Map param){
		int sMsgnumber = 0;
		SqlSession sql = factory.openSession();
		try {
			sMsgnumber = sql.selectOne("message.getSmessagenum",param);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return sMsgnumber;
	}	
	

	// 메시지 보내기
	public int send(Map map) {
		try {
			SqlSession sql = factory.openSession();
			int rst = sql.insert("message.addMsg", map);
			if (rst == 1) {
				sql.commit();
			}
			sql.close();
			return rst;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

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
