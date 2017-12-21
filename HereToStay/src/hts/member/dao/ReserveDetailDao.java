package hts.member.dao;

import hts.model.vo.member.ReservationDetail;
import hts.model.vo.member.Review;

public interface ReserveDetailDao {
	
//	펜션 별 예약 상세보기 메소드
	ReservationDetail getReserve(String memId, String penId);
	
//	예약 취소 메소드
	void delReserve(String resId);
	
//	회원 별 마일리지 얻어오는 메소드
	Integer getMig(String memId);
	
//	마일리지 회수하는 메소드
	void delMig(String resId, String memId);
	
//	리뷰 입력하는 메소드
	String writeReview(Review review);

//  총 결제금액 얻어오는 메소드
	Integer getTotMoney(String resId);
	  
//  마일리지 0 으로 업데이트 하는 메소드
	void setZeroMig(String memId);
}
