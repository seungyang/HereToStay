package hts.member.dao;


import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hts.model.vo.member.Pension;
import hts.model.vo.member.SearchOpt;
@Repository
public class PensionPageSearchImpl implements PensionPageSearchDao {

	@Autowired
	private SqlSessionTemplate ss;
	HashMap map;
	
	/**
	 * 검색하는 펜션들을 가져오는 함수 
	 * */
	@Override
	public List<Pension> getList(int first,int last, SearchOpt opt) {
		// TODO Auto-generated method stub
		
		map =new HashMap<>();
			
		setOpt(opt);
		
		//페이징 처리
		map.put("first", first);
		map.put("last", last);
		
		//옵션들을 다시 map 객체에 설정
		if(opt.getSearchName()!=null) {
			if(!(opt.getSearchName().equals(""))) 
				map.put("penName",opt.getSearchName());
		}		
		if(opt.getPersons()!=null) map.put("persons",opt.getPersons());
		if(opt.getPriceFrom()!=null) map.put("priceFrom", Integer.parseInt(opt.getPriceFrom()));
		if(opt.getPriceTo()!=null) map.put("priceTo", Integer.parseInt(opt.getPriceTo()));		
		if(opt.getPenOpt()!=null) map.put("penOpt",opt.getPenOpt());
		if(opt.getRoomOpt()!=null) map.put("roomOpt", opt.getRoomOpt());
		
		//정렬
		if(opt.getSort()!=null && opt.getSort().equals("높은 가격순"))
			map.put("sort","높은가격순");
		if(opt.getSort()!=null && opt.getSort().equals("낮은 가격순"))
			map.put("sort","낮은가격순");
		if(opt.getSort()!=null && opt.getSort().equals("높은 별점순"))
			map.put("sort","높은별점순");
		if(opt.getSort()!=null && opt.getSort().equals("리뷰 많은순"))
			map.put("sort","리뷰많은순");	
		
		return ss.selectList("pensionPageSearch.getListOpt",map);			
	}
	
	/**
	 * 검색된 펜션들의  전체리스트의 갯수를 가져오는 함수 
	 * */
	@Override
	public int getTotal(SearchOpt opt) {	
		return ss.selectOne("pensionPageSearch.getTotal",map);
	}
	
	/**
	 * 날짜를 DB 형식으로 바꿔주는 함수
	 * */
	public void setOpt(SearchOpt opt)
	{
		//값 조작 
		if(opt.getCheckIn()!=null && opt.getCheckIn().length()>9) {
			String temp = opt.getCheckIn();
			StringTokenizer str =new StringTokenizer(temp,"/");
			String indate =new String();	
			String mm =str.nextToken()+"/";
			String dd = str.nextToken();
			String yy =str.nextToken().substring(2,4)+"/";			
			indate = yy+mm+dd;
			map.put("checkIn",indate);
		}
		if(opt.getCheckOut()!=null && opt.getCheckOut().length()>9) {
			String temp2 = opt.getCheckOut();
			StringTokenizer str2 =new StringTokenizer(temp2,"/");
			String indate2 =null;				
			String mm2 = str2.nextToken()+"/";
			String dd2 = str2.nextToken();
			String yy2 =str2.nextToken().substring(2,4)+"/";			
			indate2=yy2+mm2+dd2;	
			map.put("checkOut", indate2);	
		}		
		
	}

	
}
