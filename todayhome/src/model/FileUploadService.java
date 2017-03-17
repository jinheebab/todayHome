package model;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {
	@Autowired
	ServletContext application;
	public HashMap execute(MultipartFile file) throws Exception {
		HashMap result = new HashMap<>();
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
