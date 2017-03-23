package model;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class HostingDao {

	@Autowired
	SqlSessionFactory factory;
	@Autowired
	ServletContext application;
	
		public List<HashMap> readHostingSome() {	
			// DAO 1-1번
			List<HashMap> list = new ArrayList<>();
			SqlSession sql = factory.openSession();
			try {
				list = sql.selectList("hosting.getMainList");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sql.close();
			}
			return list;
		}
		
		public Map getPrice(Map param){
			
			Map map = new HashMap<>();
			
			SqlSession sql = factory.openSession();
			try {
				map = sql.selectOne("hosting.getPrice",param);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sql.close();
			}
			
			return map;
			
		}
		public List<HashMap> getAll(){
			List<HashMap> list = new ArrayList<>();
			
			SqlSession sql = factory.openSession();
			try {
				list = sql.selectList("hosting.getAll");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sql.close();
			}
			return list;
		}
		public int allCnt() {
			SqlSession session = factory.openSession();
			int r = 0;
			try {
				r = session.selectOne("hosting.allCnt");
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return r;
		}
		
		public int addHosting(Map map) {
			SqlSession session = factory.openSession();
			int r = 0;
			try {
				r = session.insert("hosting.register", map);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return r;
		}
		
		
		public Map readHostingAll(int num) {	
			
			Map map = new HashMap<>();
			SqlSession sql = factory.openSession();
			try {
				map = sql.selectOne("hosting.getAllList",num);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sql.close();
			}
			return map;
	}
		
		public List<HashMap> searchList(HashMap search) {	
			List<HashMap> list = new ArrayList<>();
			SqlSession sql = factory.openSession();
			try {
				list = sql.selectList("hosting.searchList", search);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sql.close();
			}
			return list;
		}		
		
		public int selectCnt(Map map) {
			SqlSession session = factory.openSession();
			int r = 0;
			try {
				r = session.selectOne("hosting.searchCnt", map);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return r;
		}
//		페이징 처리
		public List<HashMap> getSelectPage(HashMap map){
			List<HashMap> list = new ArrayList<>();
			SqlSession sql = factory.openSession();
			try {
				list = sql.selectList("hosting.pagingSelect", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sql.close();
			}
			return list;
		}
		
		public int getHostingNum(Map param){
			int hostingNumber = 0;
			SqlSession sql = factory.openSession();
			try {
				hostingNumber = sql.selectOne("hosting.getHostingNum",param);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sql.close();
			}
			return hostingNumber;
		}
		
		public List getWishList(Map param){
			
			List<HashMap> list = new ArrayList<>();
			SqlSession sql = factory.openSession();
			try {
				list = sql.selectList("hosting.getWishList", param);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sql.close();
			}
			return list;
		}
}
		

		
		
	

