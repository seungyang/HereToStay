package hts.owner.dao;

import java.util.List;

import hts.model.vo.owner.Reservation;

public interface OwnerReserveDao {

   // 게시물 목록 가져오는 DAO
	List<Reservation> reslist(int first, int end, String penId);
   
   // 총매출 ,이용자수 값찍기 
   Reservation resCount(Reservation vo);

   // 월별이용자수
   List<Reservation> resRate(Reservation vo);
   
   // main 예약 리스트 가져오는 메소드
   List<Reservation> getReserve(String penId);
   
   // penId 얻어오는 메소드
   String getPenId(String ownId);
   
   // today 예약 개수 얻어오는 메소드
   Integer getToday(String penId);
   
   // week 예약 개수 얻어오는 메소드
   Integer getWeek(String penId);
   
   // month 예약 개수 얻어오는 메소드
   Integer getMonth(String penId);

// List 개수 얻어오는 메소드
   Integer getListNum(String penId);
}