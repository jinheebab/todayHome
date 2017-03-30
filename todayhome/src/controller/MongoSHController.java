package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import MongoDB.searchInsert;


@Controller
public class MongoSHController {
	@Autowired
	searchInsert si;
	
	// 검색결과 인서트
	@RequestMapping("/mongo/search")
	public void searchInsert(){
		si.insert();
	}
	// 검색결과 서치
	@RequestMapping("/mongo/searchfind")
	public void searchFind(){
		List list= si.find();
		System.out.println(list);
	}
	@RequestMapping("/mongo/searchdelete")
	public void searchdelete(){
		si.delete();
	}
}
