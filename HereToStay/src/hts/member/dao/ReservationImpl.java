package hts.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hts.model.vo.member.Member;
import hts.model.vo.member.Pension;
import hts.model.vo.member.Room;

@Repository
public class ReservationImpl implements ReservationDao{

	@Autowired
	private SqlSessionTemplate ss;

	/**
	 * 펜션정보 가져오는 함수
	 * */
	@Override
	public Pension getPensionInfo(String penId) {
		// TODO Auto-generated method stub
		return ss.selectOne("Reservation.getPensionInfo", penId);
	}

	/**
	 * 룸 정보를 가져오는 함수
	 * */
	@Override
	public Room getRoomInfo(String romId) {
		// TODO Auto-generated method stub
		return ss.selectOne("Reservation.getRoomInfo",romId);
	}

	/**
	 * 사용자의 정보를 가져오는 함수
	 * */
	@Override
	public Member getMember(String memId) {
		
		return ss.selectOne("Reservation.getMemInfo",memId);
	}	


}
