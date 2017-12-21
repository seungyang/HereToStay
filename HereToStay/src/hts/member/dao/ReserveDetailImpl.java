package hts.member.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hts.model.vo.member.ReservationDetail;
import hts.model.vo.member.Review;

@Repository
public class ReserveDetailImpl implements ReserveDetailDao {

	@Autowired
	private SqlSessionTemplate ss;
	
//	펜션 별 예약 상세정보 가져오기
	@Override
	public ReservationDetail getReserve(String memId, String resId) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("resId", resId);
		
		return ss.selectOne("MyPageReserve.getReserve", map);
	}

//	예약 취소 메소드
	@Override
	public void delReserve(String resId) {
		ss.update("MyPageReserve.delReserve", resId);
	}

//	회원 별 마일리지 얻어오는 메소드
	@Override
	public Integer getMig(String memId) {
		return ss.selectOne("MyPageReserve.getMig", memId);
	}

//	마일리지 회수하는 메소드
	@Override
	public void delMig(String resId, String memId) {
		HashMap<String, String>map = new HashMap<>();
		map.put("resId", resId);
		map.put("memId", memId);
		
		ss.update("MyPageReserve.delMig", map);
	}

	// 리뷰 입력하는 메소드
	@Override
	public String writeReview(Review review) {
		
		String revId = "REV";
		revId += ss.selectOne("MyPageReserve.reviewVal");
		review.setRevId(revId);
		ss.insert("MyPageReserve.writeReview", review);
		return revId;
	}
	
	// 총 결제금액 얻어오는 메소드
	@Override
	public Integer getTotMoney(String resId) {
		return ss.selectOne("MyPageReserve.getTotMoney", resId);
	}

	// 마일리지 0 으로 업데이트 하는 메소드
	@Override
	public void setZeroMig(String memId) {
		ss.update("MyPageReserve.setZeroMig", memId);
	}
}
