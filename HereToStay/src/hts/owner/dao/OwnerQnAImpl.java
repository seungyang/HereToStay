package hts.owner.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hts.model.vo.owner.ModelQnA;

@Repository
public class OwnerQnAImpl implements OwnerQnADao {

	@Autowired
	private SqlSessionTemplate ss1;
	
	// 문의사항 저장하는 메소드
	@Override
	public String qnaInsert(ModelQnA qna) {
		
		String qnaId = "QNA" + ss1.selectOne("ownerQnA.getQnAId");
		qna.setQnaId(qnaId);
		ss1.insert("ownerQnA.qnaInsert", qna);
		
		return qnaId;
	}

	// 문의사항 자세히 보는 메소드
	@Override
	public ModelQnA qnaDetail(String qnaId, String ownId) {
		HashMap<String, String> map = new HashMap<>();
		
		map.put("qnaId", qnaId);
		map.put("ownId", ownId);
		
		return ss1.selectOne("ownerQnA.qnaDetail", map);
	}

	// 문의사항 리스트 가져오는 메소드
	@Override
	public List<ModelQnA> getQnAList(String ownId) {
		return ss1.selectList("ownerQnA.getQnAList", ownId);
	}
}
