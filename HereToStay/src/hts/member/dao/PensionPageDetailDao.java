package hts.member.dao;


import java.util.List;

import hts.model.vo.member.Pension;
import hts.model.vo.member.Review;
import hts.model.vo.member.Room;
import hts.model.vo.member.SearchOpt;

public interface PensionPageDetailDao {

	Pension getPension(String penId);
	List<Room> getRooms(String penId,SearchOpt opt);
	List<Review> getReview(String penId);
	List<Pension> getRecoPension(String Id,SearchOpt opt);
	List<Room> getRoomsAjax(String Id,String cIn,String cOut,String peo);
 }
