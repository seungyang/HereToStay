package hts.owner.dao;

import java.util.List;

import hts.model.vo.owner.ModelQnA;

public interface OwnerQnADao {
	
	// 문의사항 저장하는 메소드
	String qnaInsert(ModelQnA qna);
	
	// 문의사항 자세히 보는 메소드
	ModelQnA qnaDetail(String qnaId, String ownId);
	
	// 문의사항 리스트 가져오는 메소드
	List<ModelQnA> getQnAList(String ownId);
}