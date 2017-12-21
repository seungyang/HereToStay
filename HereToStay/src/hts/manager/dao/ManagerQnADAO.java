package hts.manager.dao;

import java.util.List;

import hts.model.vo.manager.QnA;

public interface ManagerQnADAO {
	List<QnA> list(QnA qna); //문의사항 전체 리스트
	List<QnA> ownerlist(QnA qna); // 사장 문의사항 리스트
	List<QnA> memlist(QnA qna); // 고객 문의사항 리스트


}
