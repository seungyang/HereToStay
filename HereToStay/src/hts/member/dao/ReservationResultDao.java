package hts.member.dao;


import hts.model.vo.member.Reservation;

public interface ReservationResultDao {

	//예약 
	int insertRes(Reservation res);
	
//	예약 시 마일리지 적립 메소드
	void addMig(String memId, int resTot);
	
	//사용한 마일리지 
	int updateMig(String memId,int useMig);
	

}
