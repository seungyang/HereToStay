package hts.member.dao;

import hts.model.vo.member.Member;
import hts.model.vo.member.Pension;
import hts.model.vo.member.Room;

public interface ReservationDao {

	
	Pension getPensionInfo(String penId);
	Room getRoomInfo(String romId);
	Member getMember(String memId);
}
