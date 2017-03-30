package controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MongoControllerSH {
	@Autowired
	MongoTemplate mt;
	
	// 검색결과 인서트
	@RequestMapping("/mongo/search")
	public void searchInsert(){
			String[] targetArray={"서울","서울","서울","서울","서울","서울","서울","서울","서울","서울","서울","서울","서울","서울","서울","서울","서울","서울",
								"부산","부산","부산","부산","부산","부산","부산","부산","부산","부산","부산","부산",
								"대구","대구","대구","대구","대구","대구","대구","대구","대구",
								"인천","인천","인천","인천","인천","인천","인천","인천","인천",
								"광주","광주","광주","광주","광주","광주",
								"대전","대전","대전","대전",
								"울산","울산","울산","울산",
								"춘천","춘천","춘천","춘천","춘천","춘천","춘천","춘천","춘천","춘천",
								"강릉","강릉","강릉","강릉","강릉","강릉","강릉","강릉","강릉","강릉","강릉","강릉",
								"속초","속초","속초","속초","속초","속초","속초","속초","속초","속초","속초","속초",
								"동해","동해","동해","동해",
								"삼척","삼척","삼척","삼척","양양","양양",
								"목포","목포","목포","목포","목포","목포",
								"군산","군산","군산","군산","군산","군산",
								"전주","전주","전주","전주","전주","전주","전주","전주",
								"여수","여수","여수","여수",
								"순천","순천","순천","순천","순천","순천",
								"통영","통영","통영","통영",
								"제주","제주","제주","제주","제주","제주","제주","제주","제주","제주","제주","제주","제주","제주",
								"도쿄","도쿄","도쿄","도쿄","도쿄","도쿄","도쿄","도쿄","도쿄","도쿄","도쿄","도쿄","도쿄","도쿄",
								"오사카","오사카","오사카","오사카","오사카","오사카","오사카","오사카","오사카","오사카",
								"상하이","상하이","상하이","상하이","상하이","상하이","상하이","상하이",
								"방콕","방콕","방콕","방콕","방콕","방콕","방콕","방콕","방콕","방콕","방콕","방콕","방콕","방콕",
								"홍콩","홍콩","홍콩","홍콩","홍콩","홍콩","홍콩","홍콩",
								"마닐라","마닐라","마닐라","마닐라","마닐라","마닐라",
								"베이징","베이징","베이징","베이징",
								"타이페이","타이페이","타이페이","타이페이",
								"워싱턴D.C","워싱턴D.C","워싱턴D.C","워싱턴D.C","워싱턴D.C","워싱턴D.C","워싱턴D.C","워싱턴D.C",
								"뉴욕","뉴욕","뉴욕","뉴욕","뉴욕","뉴욕","뉴욕","뉴욕","뉴욕","뉴욕","뉴욕","뉴욕","뉴욕","뉴욕","뉴욕","뉴욕","뉴욕","뉴욕",
								"라스베가스","라스베가스","라스베가스","라스베가스","라스베가스","라스베가스","라스베가스","라스베가스","라스베가스","라스베가스","라스베가스","라스베가스",
								"토론토","토론토","토론토","토론토","토론토","토론토","토론토","토론토","토론토","토론토",
								"벤쿠버","벤쿠버","벤쿠버","벤쿠버","벤쿠버","벤쿠버","벤쿠버","벤쿠버",
								"모스크바","모스크바","모스크바","모스크바",
								"런던","런던","런던","런던","런던","런던","런던","런던","런던","런던","런던","런던","런던","런던",
								"뮌헨","뮌헨","뮌헨","뮌헨","뮌헨","뮌헨","뮌헨","뮌헨","뮌헨","뮌헨",
								"베를린","베를린","베를린","베를린","베를린","베를린","베를린","베를린",
								"카이로","카이로","카이로","카이로","카이로","카이로",
								"나이로비","나이로비","나이로비","나이로비",
								"프라하","프라하","프라하","프라하","프라하","프라하","프라하","프라하","프라하",
								"브뤼셀","브뤼셀","브뤼셀","브뤼셀","브뤼셀","브뤼셀",
								"리스본","리스본","리스본","리스본","리스본","리스본",
								"헬싱키","헬싱키","헬싱키","헬싱키","헬싱키","헬싱키"
								};
			String[] startMonthArray={"1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"};
			String[] endMonthArray={"1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"};
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
									"12명","12명"};
			String[] ageGroupArray={"10대","10대","10대","10대","10대","10대","10대","10대",
									"20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대","20대",
									"30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대","30대",
									"40대","40대","40대","40대","40대","40대","40대","40대","40대","40대","40대","40대","40대","40대","40대",
									"50대","50대","50대","50대","50대","50대","50대","50대","50대","50대",
									"60대","60대","60대","60대","60대","60대","60대",
									"70대","70대","70대","70대","70대",
									"80대 이상","80대 이상","80대 이상"};
			
			System.out.println("targetArray : "+targetArray.length);
			System.out.println("startMonthArray : "+startMonthArray.length);
			System.out.println("endMonthArray : "+endMonthArray.length);
			System.out.println("peopleCntArray : "+peopleCntArray.length);
			System.out.println("ageGroupArray : "+ageGroupArray.length);
			
			
			for(int i = 0; i<=150000; i++){
				// 목적지 
				int a = (int)(Math.random()*351);
				String target = targetArray[a];
				// 체크인 달
				int b = (int)(Math.random()*12);
				String startMonth = startMonthArray[b];
				// 체크아웃 달
				int c = (int)(Math.random()*12);
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
					
				System.out.println(map);
				mt.insert(map, "search");
			}
	}
	// 검색결과 서치
	@RequestMapping("/mongo/searchfind")
	public void searchFind(){

		// 지역 cnt
		AggregationOperation a1 = Aggregation.group("target").count().as("cnt");
		AggregationOperation a2 = Aggregation.sort(Sort.Direction.DESC, "cnt");
		Aggregation aggr = Aggregation.newAggregation(a1, a2);
		AggregationResults<Map> results = mt.aggregate(aggr, "search", Map.class);
		List<Map> list = results.getMappedResults();
		
		System.out.println(list);
		
		
		
		
	}
}
