package MongoDB;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationOperation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.stereotype.Service;

@Service
public class searchInsert {
	@Autowired
	MongoTemplate mt;
	
	// 검색결과 인서트 incheon
	public void insert(){
		String[] targetArray={"서울시","SEOUL","서울특별시","seoul city","Seoul","서울시","seoul","서울시","서울","서울시","서울","seoul","SouthKorea seoul","Korea Seoul","Seoul","Seoul","seoul",
									"busan","BUSAN","부산","Busan","부산광역시","부산 해운대","부산시","대한민국 부산","busan","Korea Busan","korea busan","busan",
									"대구","대구시","대구광역시","DAEGU","Daegu","daegu","daegu","대구","대구",
									"인천광역시","인천시","인천","Inchun","inchun","incheon","Incheon","INCHEON","인천",
									"GWANGJU","광주광역시","광주시","광주","Gwangju","gwangju",
									"대전","대전광역시","Daejeon","대전",
									"울산","울산","울산광역시","울산",
									"춘천시","춘천시"," chuncheon","Chuncheon","춘천","춘천","춘천",
									"강릉시","강릉시","강릉","강릉","gangnueng","강릉","Gangnueng",
									"속초","속초시","속초","속초","sokcho","Sokcho",
									"donghae","동해","동해","동해시",
									"삼척시","삼척","samcheock","삼척","yangyang","yangyang",
									"목포","목포시","mokpo","목포","목포","목포",
									"군산시","군산","jeonju","Jeonju","전주시","전주","전주","jeonju",
									"여수시","여수","yeosu","suncheon","순천","순천시","통영시","Tongyeong",
									"제주","제주","제주시","제주특별시","제주","제주","jeju","JEJU","Jeju","jeju","jeju","jeju","Jeju","Jeju",
									"도쿄","도쿄","도쿄","tokyo","tokyo","tokyo","tokyo","tokyo","tokyo","tokyo","Tokyo","Tokyo","Tokyo","Tokyo",
									"오사카","오사카","오사카","osaka","osaka","osaka","osaka","Osaka","Osaka","Osaka",
									"상하이","상하이","sanghai","sanghai","sanghai","sanghai","Sanghai","Sanghai",
									"방콕","방콕","방콕","방콕","방콕","Bangkok","Bangkok","Bangkok","bangkok","bangkok","bangkok","bangkok","bangkok","방콕",
									"홍콩","홍콩","홍콩","Hongkong","hongkong","hongkong","hongkong","HongKong",
									"마닐라","마닐라","Manila","manila","manila","manila",
									"베이징","beijing","beijing","beijing",
									"타이페이","타이페이","타이페이","타이페이",
									"워싱턴D.C.","Washington, D.C.","Washington, D.C.","Washington, D.C.","워싱턴DC","Washington, D.C.","washington, D.C.","washington",
									"N.Y.","N.Y.","N.Y.","N.Y.","N.Y.","뉴욕","뉴욕","뉴욕","뉴욕","New York","New York","NewYork City","NewYork","NewYork","newyork","NEWYORK","newyork","NewYork",
									"라스베가스","라스베이거스","Las Vegas","Las Vegas","Las Vegas","Las Vegas","LAS VEGAS","Las vegas","las vegas","las vegas","Las Vegas","Las Vegas",
									"토론토","토론토","Toronto","Toronto","Toronto","Toronto","Toronto","toronto","toronto","toronto",
									"벤쿠버","뱅쿠버","Vancouver","Vancouver","Vancouver","vancouver","vancouver","벤쿠버",
									"Moskva","Moskva","moscow","Moscow",
									"런던","런던","London","London","London","London","London","London","London","london","london","london","london","london",
									"뮌헨","Munich","Munich","Munich","Munich","Munich","munich","munich","munich","munich",
									"베를린","베를린","Berlin","Berlin","Berlin","Berlin","berlin","berlin",
									"카이로","Cairo","Cairo","Cairo","cairo","cairo",
									"Nairobi","Nairobi","nairobi","nairobi",
									"프라하","프라하","Praha","Praha","Praha","Praha","praha","praha","praha",
									"브뤼셀","Brussels","Bruxelles","Brussels","Brussels","Bruxelles",
									"리스본","Lisbon","Lisbon","Lisbon","lisbon","Lisboa",
									"헬싱키","헬싱키","Helsinki","Helsinki","helsinki","helsinki"
									};
		String[] startMonthArray={"1월","1월","1월","1월","1월","1월",
										"2월","2월","2월","2월","2월","2월","2월","2월",
										"3월","3월","3월","3월","3월","3월","3월","3월","3월","3월",
										"4월","4월","4월","4월","4월","4월","4월","4월",
										"5월","5월","5월","5월","5월","5월","5월","5월","5월","5월","5월","5월","5월",
										"6월","6월","6월","6월","6월","6월","6월","6월","6월","6월",
										"7월","7월","7월","7월","7월","7월","7월","7월","7월","7월","7월","7월","7월","7월","7월","7월","7월","7월",
										"8월","8월","8월","8월","8월","8월","8월","8월","8월","8월","8월","8월","8월","8월","8월",
										"9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월",
										"10월","10월","10월","10월","10월","10월","10월","10월","10월","10월","10월","10월",
										"11월","11월","11월","11월","11월","11월","11월","11월","11월","11월","11월","11월",
										"12월","12월","12월","12월","12월","12월","12월",
										};
		String[] endMonthArray={"1월","1월","1월","1월","1월","1월","1월","1월","1월",
										"2월","2월","2월","2월","2월","2월","2월","2월","2월","2월","2월",
										"3월","3월","3월","3월","3월","3월","3월","3월","3월","3월","3월","3월","3월",
										"4월","4월","4월","4월","4월","4월","4월","4월","4월","4월",
										"5월","5월","5월","5월","5월","5월","5월","5월","5월","5월","5월","5월",
										"6월","6월","6월","6월","6월","6월","6월","6월","6월",
										"7월","7월","7월","7월","7월","7월","7월","7월","7월","7월","7월",
										"8월","8월","8월","8월","8월","8월","8월","8월","8월","8월","8월","8월","8월","8월","8월","8월","8월",
										"9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월","9월",
										"10월","10월","10월","10월","10월","10월","10월","10월","10월","10월","10월",
										"11월","11월","11월","11월","11월","11월","11월","11월","11월","11월","11월","11월","11월","11월","11월","11월",
										"12월","12월","12월","12월","12월","12월","12월"
										};
		String[] peopleCntArray={"1명","1명","1명","1명","1명","1명","1명","1명","1명","1명","1명","1명","1명","1명","1명","1명",
										"2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명","2명",
										"3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명","3명",
										"4명","4명","4명","4명","4명","4명","4명","4명","4명","4명","4명","4명","4명","4명","4명","4명","4명","4명","4명","4명","4명","4명",
										"5명","5명","5명","5명","5명","5명","5명","5명","5명","5명","5명","5명","5명","5명","5명","5명",
										"6명","6명","6명","6명","6명","6명","6명","6명","6명","6명",
										"7명","7명","7명","7명","7명","7명","7명","7명",
										"8명","8명","8명","8명","8명","8명",
										"9명","9명","9명","9명","9명",
										"10명","10명","10명","10명",
										"11명","11명","11명",
										"12명","12명"
										};
		String[] ageGroupArray={"10대","10대","10대","10대","10대","10대","10대","10대",
										"20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대",
										"30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대",
										"40대","40대","40대","40대","40대","40대","40대","40대","40대","40대","40대","40대","40대","40대","40대",
										"50대","50대","50대","50대","50대","50대","50대","50대","50대","50대",
										"60대","60대","60대","60대","60대","60대","60대",
										"70대","70대","70대","70대","70대",
										"80대 이상","80대 이상","80대 이상"
										};
		
/*		System.out.println("targetArray : "+targetArray.length);
		System.out.println("startMonthArray : "+startMonthArray.length);
		System.out.println("endMonthArray : "+endMonthArray.length);
		System.out.println("peopleCntArray : "+peopleCntArray.length);
		System.out.println("ageGroupArray : "+ageGroupArray.length);*/
		
		
		// 1달 동안 쌓였다는 가정하에 데이터
		for(int i = 0; i<=630000; i++){
			// 목적지 
			int a = (int)(Math.random()*324);
			String target = targetArray[a];
			// 체크인 달
			int b = (int)(Math.random()*144);
			String startMonth = startMonthArray[b];
			// 체크아웃 달
			int c = (int)(Math.random()*141);
			String endMonth = endMonthArray[c];
			// 인원
			int d = (int)(Math.random()*144);
			String peopleCnt = peopleCntArray[d];
			// 연령대
			int e = (int)(Math.random()*88);
			String ageGroup = ageGroupArray[e];
			// 삽입
			HashMap map = new HashMap();
				map.put("target", target);
				map.put("startMonth", startMonth);
				map.put("endMonth", endMonth);
				map.put("peopleCnt", peopleCnt);
				map.put("ageGroup", ageGroup);
				
			mt.insert(map, "search");
		}
	}
	
	public List find(){
		// 지역 cnt
		AggregationOperation a3 = Aggregation.match(Criteria.where("ageGroup").is("20대"));
		AggregationOperation a1 = Aggregation.group("target").count().as("cnt");
		AggregationOperation a2 = Aggregation.sort(Sort.Direction.DESC, "cnt");
		Aggregation aggr1 = Aggregation.newAggregation(a3, a1, a2);
		AggregationResults<Map> results1 = mt.aggregate(aggr1, "search", Map.class);
		List<Map> list = results1.getMappedResults();

		return list;
	}
	public void delete(){
		// 삭제
		mt.dropCollection("search");
	}
}
