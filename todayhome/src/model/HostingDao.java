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
		
		
		
		public Map execute(MultipartFile file) throws Exception {
			Map result = new HashMap<>();
				long size = file.getSize();
				result.put("filesize", size);
				String orgName = file.getOriginalFilename();
				result.put("filename",orgName);
				String path = application.getRealPath("/share");
				File dir = new java.io.File(path);
				if (!dir.exists())
					dir.mkdirs(); 
				String saveName = System.currentTimeMillis()+"_"+orgName;
				File dest = new File(path, saveName);
				file.transferTo(dest); 
				result.put("fileaddress", dest.getPath());
				result.put("filelink", "/share/"+saveName);
				
			return result;
		}
		
}
		
		
	

