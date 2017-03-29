package service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.HostingDao;
import model.InfoDao;

@Service
public class reviewSetting {
	@Autowired
	HostingDao hd;
	@Autowired
	InfoDao id;

	public HashMap ReviewMaker() {
		HashMap map = new HashMap();
		
		
		//hosting DB가져오기
		List hostinglist = hd.getAll();
		
		List hostingnumber = new ArrayList<>();
		
		for(int i=0; i<hostinglist.size(); i++){
			
			Map temp = new HashMap<>();
			
			temp = (Map) hostinglist.get(i);
			
			
			BigDecimal number = (BigDecimal)temp.get("NUM");
			
			int number2 = number.intValue();
			
			hostingnumber.add(number2);
			
		}
		
		int n = (int)(Math.random()*hostingnumber.size());
		
		int num = (int) hostingnumber.get(n);
		
		System.out.println("hosting num 은 "+num);
		
		Map hostinginfo = hd.readHostingAll(num);
		
		
		//후기 문구 생성하기
		String travel="";
		int r = 1 + (int) (Math.random() * 10);
		if(Math.random()<0.6){
			travel = (String)hostinginfo.get("CITY");
		}else{
			travel = (String)hostinginfo.get("COUNTRY");
		}
		if(r<=6){
			travel +=" 여행, 기대 많이 했었는데.. 숙소 ";
		}else{
			travel +=" 여행 기억에 남을 것 같아요. 숙소";
		}
		String comment = travel;
		switch (r) {
		case 1:{
			comment += " 최악이에요.";
			break;
			}
		case 2:{
			comment += " 실망했어요.";
			break;
			}
		case 3:{
			comment += " 기대에 못 미칩니다.";
			break;
			}
		case 4:{
			comment += " 사진과 많이 달라요.";
			break;
			}
		case 5:{
			comment += " 아쉬움이 남는다.";
			break;
			}
		case 6:{
			comment += " 그저 그럼";
			break;
			}
		case 7:{
			comment += " 좋은 것 같아요.";
			break;
			}
		case 8:{
			comment += " 깔끔해요! 깨끗해서 좋았어요.";
			break;
			}
		case 9:{
			comment += " 정말 잘 쉬다가 갑니다:)";
			break;
			}
		case 10:{
			comment += " 정말 여기서 살고 싶네요. 잊지 못할 것같습니다.";
			break;
			}
		}
		
		//글쓴이 생성하기
		List members = id.readAll();
		
		int nn = (int)(Math.random()*members.size());
		
		Map member = (Map) members.get(nn);
		
		System.out.println("글쓴이정보는 ? " + member);
		
		String writer = (String) member.get("ID");
		
		
		//hosting num 생성하기
		
		
		map.put("writer", writer);
		map.put("content", comment);
		map.put("grade", r);
		map.put("hostingnum", num);
		
		System.out.println("최종 ? " + map.toString());
		
		return map;
	}
}
