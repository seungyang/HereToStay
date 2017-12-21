package hts.member.dao;

import java.util.HashMap;
import java.util.StringTokenizer;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hts.model.vo.member.Reservation;

@Repository
public class ReservationResultImpl implements ReservationResultDao{

	@Autowired
	private SqlSessionTemplate ss;

	
	/**
	 * 예약등록하는 함수
	 * */
	@Override
	public int insertRes(Reservation res) {
		// TODO Auto-generated method stub
		
		HashMap hmap =new HashMap();
		
		hmap.put("memId",res.getMemId());
		hmap.put("romId",res.getRomId());		
	
		//날짜를 DB 형식으로 변경
		String temp = res.getResIndate();
		StringTokenizer str =new StringTokenizer(temp,"/");
		String indate =new String();	
		String mm =str.nextToken()+"/";
		String dd = str.nextToken();
		String yy =str.nextToken().substring(2,4)+"/";			
		indate = yy+mm+dd;
		hmap.put("resIndate",indate);

		//날짜를 DB 형식으로 변경
		String temp2 = res.getResOutdate();
		StringTokenizer str2 =new StringTokenizer(temp2,"/");
		String indate2 =null;				
		String mm2 = str2.nextToken()+"/";
		String dd2 = str2.nextToken();
		String yy2 =str2.nextToken().substring(2,4)+"/";			
		indate2=yy2+mm2+dd2;	

		hmap.put("resOutdate",indate2);
		hmap.put("resTot",res.getResTot());
		
		return ss.insert("reserveResult.insertRes",hmap);
	}
	
	/**
	 * 예약 시 마일리지 적립 함수
	 * */
	@Override
	public void addMig(String memId, int resTot) {
		HashMap map = new HashMap<>();
		map.put("memId", memId);
		map.put("resTot", resTot);
		
		ss.update("reserveResult.addMig", map);
	}

	/**
	 * 적립금 사용시 보유 적립금을 변경해주는 함수
	 * */
	@Override
	public int updateMig(String memId, int useMig) {
		// TODO Auto-generated method stub
		HashMap uMap = new HashMap<>();
		uMap.put("memId", memId);
		uMap.put("useMig", useMig);
		return ss.update("reserveResult.useMig",uMap);
	}
}
