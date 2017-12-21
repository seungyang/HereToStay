package hts.manager.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hts.model.vo.manager.ManagerPaging;
import hts.model.vo.manager.QnA;

@Repository
public class ManagerQnAImpl implements ManagerQnADAO {

	@Autowired
	private SqlSessionTemplate ss2;
	

	@Override
	public List<QnA> list(QnA qna) {// 문의사항 전체 리스트
	
		return ss2.selectList("ManagerQnA.qnaList",qna);
	}


	@Override
	public List<QnA> ownerlist(QnA qna) { //사장 문의사항 리스트
	
		return ss2.selectList("ManagerQnA.ownerQnA",qna);
	}


	@Override
	public List<QnA> memlist(QnA qna) { //고객 문의사항 리스트
		return ss2.selectList("ManagerQnA.memberQnA",qna);
	}




}
