package hts.mongo.dao;

import java.util.ArrayList;
import java.util.List;

import hts.model.vo.manager.Strorage;
import hts.model.vo.member.Pension;
import hts.model.vo.member.QnA;
import hts.model.vo.member.Reservation;
import hts.model.vo.member.Review;
import hts.model.vo.member.Room;
import hts.model.vo.owner.ModelQnA;
import hts.mongo.vo.MongoVO;

public interface MongoDao {

	// 다중 첨부시 파일 업로드
	public int addPension(MongoVO mongoVo);

	// 펜션명으로 몽고DB에 있는 첨부파일 찾기
	List<MongoVO> findData(String value);
	
	// 몽고 DB 데이터 지우기
	public void deleteData(String value);

	// 펜션 첨부파일명 가져오기 
	public ArrayList findDataPList(List<Pension> pl);
	
	// 객실 첨부파일명 가져오기 
	public ArrayList findDataRList(List<Room> rl);
	
	// 사용자 문의 첨부파일명 가져오기
	public ArrayList findDataQList(List<QnA> ql);

	// 사장 문의 첨부파일명 가져오기
	public ArrayList findDataOQList(List<ModelQnA> qnaList);
	
	// 관리자 문의 첨부파일명 가져오기 
	public ArrayList findDataQnAList(List<hts.model.vo.manager.QnA> ql);
	
	// 예약 첨부파일 가져오기
	public ArrayList findDataReserList(List<Reservation> reserList);

	// 리뷰 첨부파일 가져오기
	public ArrayList findDataReviewList(List<Review> reviewList);
	
	// 몽고 DB 현재 재고 값 가져오기
	public List<Strorage> findDataSList(List<Strorage> pl);
	
	// 재고현황 업데이트
	public int stoUpdate(String penId, String bath, String charcoal);

	// 재고현황 초기 설정
	public int stoInsert(String penId);




}
