package hts.mongo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import hts.model.vo.manager.Strorage;
import hts.model.vo.member.Pension;
import hts.model.vo.member.QnA;
import hts.model.vo.member.Reservation;
import hts.model.vo.member.Review;
import hts.model.vo.member.Room;
import hts.model.vo.owner.ModelQnA;
import hts.mongo.vo.BoardVO;
import hts.mongo.vo.MongoVO;

public interface MongoService {

	// 다중 첨부시 파일 업로드
	int addPension(String penId, MultipartHttpServletRequest mhsq);

	// 펜션명으로 몽고DB에 있는 첨부파일 찾기
	List<MongoVO> findMongo(String penId);

	// 몽고 DB 데이터 지우기
	int removeMongo(String roomId);

	// 펜션 첨부파일명 가져오기 
	ArrayList findMongoPList(List<Pension> pl);

	// 객실 첨부파일명 가져오기 	
	ArrayList findMongoRList(List<Room> rl);

	// 사용자 문의 첨부파일명 가져오기 
	ArrayList findMongoQList(List<QnA> ql);

	// 관리자 문의 첨부파일명 가져오기 
	ArrayList findMongoQnAList(List<hts.model.vo.manager.QnA> ql);

	// 단일 첨부시 파일 업로드
	void insertPhoto(String qnaId, BoardVO boardVO);

	// 예약 첨부파일 가져오기
	ArrayList findMongoReserList(List<Reservation> reserList);

	// 리뷰 첨부파일 가져오기
	ArrayList findMongoReviewList(List<Review> reviewList);

	// 사장님 사업자등록증 저장
	String setLicense(BoardVO boardVO);

	// 재고현황 오라클 DB 및 몽고DB 동기화 작업
	void testScheduler(List<Strorage> pl);

	// 사장 문의 첨부파일명 가져오기
	ArrayList findMongoOQList(List<ModelQnA> qnaList);
	
	// 재고현황 업데이트
	int stoUpdate(String penId, String bath, String charcoal);

	// 재고현황 초기 설정
	int insertStock(String penId);

}
