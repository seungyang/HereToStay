package hts.manager.dao;

import hts.model.vo.manager.QnA;

public interface ManagerQnAViewDAO {

	QnA qnaView(QnA qna); //문의 사항 상세보기
	
	int qnaReply(QnA qna); //문의사항 댓글 달기
}
