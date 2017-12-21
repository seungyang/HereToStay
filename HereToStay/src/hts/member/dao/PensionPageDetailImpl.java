package hts.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hts.model.vo.member.Pension;
import hts.model.vo.member.Review;
import hts.model.vo.member.Room;
import hts.model.vo.member.SearchOpt;
@Repository
public class PensionPageDetailImpl implements PensionPageDetailDao{

	@Autowired
	private SqlSessionTemplate ss;


	/**
	 * 펜션의 정보를 가져옴 
	 * */
	@Override
	public Pension getPension(String penId) {
		// TODO Auto-generated method stub
		return ss.selectOne("pensionPageDetail.getPension",penId);
	}

	/**
	 * 룸의 정보를 가져옴 
	 * */	
	@Override
	public List<Room> getRooms(String penId,SearchOpt opt) {
		// TODO Auto-generated method stub
		
		HashMap map =new HashMap<>();
		map.put("penId",penId);
		if(opt != null) {
			map.put("persons", opt.getPersons());
			setOpt(opt.getCheckIn(),opt.getCheckOut(),map);
		}
		return ss.selectList("pensionPageDetail.getRooms",map);
	}
	
	/**
	 * 옵션중 날짜를 DB 형식으로 바꿈
	 * */
	public void setOpt(String cIn,String cOut,HashMap m)
	{
		//값 조작 
		if(cIn!=null && cIn.length()>9) {
			String temp = cIn;
			StringTokenizer str =new StringTokenizer(temp,"/");
			String indate =new String();	
			String mm =str.nextToken()+"/";
			String dd = str.nextToken();
			String yy =str.nextToken().substring(2,4)+"/";			
			indate = yy+mm+dd;
			m.put("checkIn",indate);
		}
		if(cOut!=null && cOut.length()>9) {
			String temp2 = cOut;
			StringTokenizer str2 =new StringTokenizer(temp2,"/");
			String indate2 =null;				
			String mm2 = str2.nextToken()+"/";
			String dd2 = str2.nextToken();
			String yy2 =str2.nextToken().substring(2,4)+"/";			
			indate2=yy2+mm2+dd2;	
			m.put("checkOut", indate2);	
		}		
		
	}
	/**
	 * 리뷰리스트 정보를 가져옴
	 * */
	@Override
	public List<Review> getReview(String penId) {
		
		return ss.selectList("pensionPageDetail.getReviews",penId);
	}

	/**
	 * 추천 펜션들의 정보를 가져옴
	 * */
	@Override
	public List<Pension> getRecoPension(String Id, SearchOpt opt) {
		// TODO Auto-generated method stub
		HashMap hMap =new HashMap<>();
		
		hMap.put("penId",Id);
		if(opt!=null) {
		if(opt.getSearchName()!=null) {
			if(!(opt.getSearchName().equals(""))) 
				hMap.put("penName",opt.getSearchName());
		}
		//비슷한 옵션으로 검색하기 위해
		if(opt.getPersons()!=null) hMap.put("persons",opt.getPersons());
		if(opt.getPriceFrom()!=null) hMap.put("priceFrom", Integer.parseInt(opt.getPriceFrom()));
		if(opt.getPriceTo()!=null) hMap.put("priceTo", Integer.parseInt(opt.getPriceTo()));		
		if(opt.getPenOpt()!=null) hMap.put("penOpt",opt.getPenOpt());
		if(opt.getRoomOpt()!=null) hMap.put("roomOpt", opt.getRoomOpt());
		
		//정렬 방식
		if(opt.getSort()!=null && opt.getSort().equals("높은 가격순"))
			hMap.put("sort","높은가격순");
		if(opt.getSort()!=null && opt.getSort().equals("낮은 가격순"))
			hMap.put("sort","낮은가격순");
		if(opt.getSort()!=null && opt.getSort().equals("높은 별점순"))
			hMap.put("sort","높은별점순");
		if(opt.getSort()!=null && opt.getSort().equals("리뷰 많은순"))
			hMap.put("sort","리뷰많은순");
		}
		return ss.selectList("pensionPageDetail.getRecoPension",hMap);
	}	
	
	/**
	 * Ajax로 펜션 상세페이지에서 룸만 검색할때 호출되는 함수 
	 * */
	@Override
	public List<Room> getRoomsAjax(String Id, String cIn, String cOut, String peo) {
		// TODO Auto-generated method stub
		HashMap hmp= new HashMap<>();
		
		setOpt(cIn,cOut,hmp);
		hmp.put("penId", Id);
		if(peo!=null)
		{	hmp.put("persons",peo);
		}
		return ss.selectList("pensionPageDetail.getRoomsAjax",hmp);
	}
	

}
