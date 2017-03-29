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
		Double score=0.0;
		try{
			score = session.selectOne("review.staravg", map);
			if(score == null){
				return 0.0;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return score;
	}
	
	public HashMap getUserPhoto(HashMap map){
		SqlSession session = factory.openSession();
		HashMap photomap = new HashMap();
		try{
			photomap = session.selectOne("sharing.getuphoto", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return photomap;
	}
	
	public List getHostingPhoto(HashMap map){
		SqlSession session = factory.openSession();
		List<HashMap> photomap = new ArrayList();
		try{
			photomap = session.selectList("sharing.gethphoto", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return photomap;
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
	
	public List getReview(HashMap map){
		SqlSession session= factory.openSession();
		List<HashMap> list = new ArrayList();
		try{
			list= session.selectList("review.getReview", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	
	public List getReviewcnt(HashMap map){
		SqlSession session= factory.openSession();
		List<HashMap> list = new ArrayList();
		try{
			list= session.selectList("review.getReviewcnt", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	public boolean addReview(HashMap map){
		System.out.println("리뷰의 맵은 "+map);
		SqlSession session = factory.openSession();
		boolean rst = false;
		try{
			int r= session.insert("review.addReview", map);
			if(r==1){
				System.out.println("등록성공");
				rst = true;
			}
		}catch(Exception e){
			e.printStackTrace();
			rst = false;
		}finally{
			session.close();
		}
		return rst;
		
	}
	
	public List AjaxReviewHandler(HashMap map){
		SqlSession session = factory.openSession();
		List list = new ArrayList();
		try{
			list = session.selectList("review.queryReview", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	public List getPass(String id){
		SqlSession session = factory.openSession();
		List list = new ArrayList();
		try{
			list = session.selectList("info.getPass", id);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
}
