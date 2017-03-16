package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HostingDao {			

	@Autowired
	SqlSessionFactory factory;
	
		public List<HashMap> readHostingSome() {	
			// DAO 1-1번
			List<HashMap> list = new ArrayList<>();
			SqlSession sql = factory.openSession();
			try {
				list = sql.selectList("hosting.getMainList");
				int r = list.size();
				System.out.println(r);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sql.close();
			}
			return list;
	}
	
}
