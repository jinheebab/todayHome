package model;

import java.util.*;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainDao {
	@Autowired
	SqlSessionFactory factory;
	
	public List getMainList() {
		SqlSession session = factory.openSession();
		List<HashMap> list= null;
		try {
			list = session.selectList("hosting.getMainList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public List getDetaillist(HashMap map){
		SqlSession session = factory.openSession();
		List<HashMap> list = new ArrayList<>();
		try{
			list = session.selectList("hosting.getDetailList", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	public double getScore (HashMap map){
		SqlSession session = factory.openSession();
		double score=0.0;
		try{
			score = session.selectOne("review.staravg", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return score;
	}
	
	public List getPhoto(HashMap map){
		SqlSession session = factory.openSession();
		List<HashMap> list = new ArrayList();
		
		try{
			list = session.selectList("sharing.read", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	public String hoster(String num){
		SqlSession session = factory.openSession();
			String hoster="";
		try{
			hoster = session.selectOne("hosting.getHoster", num);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return hoster;
	}
	
	
	
}
