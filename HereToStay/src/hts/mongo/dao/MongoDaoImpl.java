package hts.mongo.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import hts.model.vo.manager.Strorage;
import hts.model.vo.member.Pension;
import hts.model.vo.member.QnA;
import hts.model.vo.member.Reservation;
import hts.model.vo.member.Review;
import hts.model.vo.member.Room;
import hts.model.vo.owner.ModelQnA;
import hts.mongo.vo.MongoVO;
import hts.mongo.vo.StrorageVO;

@Repository
public class MongoDaoImpl implements MongoDao {

	@Autowired
	private MongoTemplate mongoTemplate;
	
	// 다중 첨부시 파일 업로드
	@Override
	public int addPension(MongoVO mongoVO) {
		
		System.out.println("몽고 DAO 진입 : File");
		mongoTemplate.insert(mongoVO,"hts");
		System.out.println("몽고 hts 입력 완료");
		
		return 0;
	}
	
	// key : 컬럼명 / value : 조건
	// key 에 value 값을 가진 값을 찾는다.
	// 펜션명으로 몽고DB에 있는 첨부파일 찾기
	@Override
	public List<MongoVO> findData(String value) {
        Criteria criteria = new Criteria("code");
 
        // 해당 value에 맞는 것만 찾을 수 있다.
         criteria.is(value);
 
        // 둘리로 시작하는 것을 찾을 수 있다.
//        criteria.regex("^둘리");
 
         Query query = new Query(criteria);
        List<MongoVO> data = mongoTemplate.find(query, MongoVO.class, "hts");
 
        int index = 0;
        for (MongoVO mongoTestVO : data) {
            System.out.println(index + " " + mongoTestVO.getCode());
            System.out.println(index + " " + mongoTestVO.getRealName());
            System.out.println(index + " " + mongoTestVO.getEncryName());
            System.out.println(index + " " + mongoTestVO.getFullname());
            index++;
        }
        return data;
    }

	// 몽고 db 삭제
	// 몽고 DB 데이터 지우기
	@Override
	public void deleteData(String value) {
		Criteria criteria = new Criteria("code");
		 
        // 해당 value에 맞는 것만 찾을 수 있다.
         criteria.is(value);
         Query query = new Query(criteria);
         mongoTemplate.remove(query, "hts");
		
	}

	// 펜션 첨부파일명 가져오기 
	@Override
	public ArrayList findDataPList(List<Pension> pl) {
		
		ArrayList mlist = new ArrayList();
		
		for( int i=0; i<pl.size();i++) {
			Criteria criteria = new Criteria("code");
			String penId = pl.get(i).getPenId();
			criteria.is(penId);
			Query query = new Query(criteria);
		    List<MongoVO> data = mongoTemplate.find(query, MongoVO.class, "hts");
		    mlist.add(data);
		}
		return mlist;
	}

	// 객실 첨부파일명 가져오기 
	@Override
	public ArrayList findDataRList(List<Room> rl) {
		
		ArrayList mlist = new ArrayList();
		
		for( int i=0; i<rl.size();i++) {
			Criteria criteria = new Criteria("code");
			String romId = rl.get(i).getRomId();
			criteria.is(romId);
			Query query = new Query(criteria);
		    List<MongoVO> data = mongoTemplate.find(query, MongoVO.class, "hts");
		    mlist.add(data);
		}
		return mlist;
	}

	
	// 예약 첨부파일 가져오기
	@Override
	public ArrayList findDataReserList(List<Reservation> reserList) {
		ArrayList mlist = new ArrayList();
		
		for( int i=0; i<reserList.size();i++) {
			Criteria criteria = new Criteria("code");
			String romId = reserList.get(i).getRomId();
			criteria.is(romId);
			Query query = new Query(criteria);
		    List<MongoVO> data = mongoTemplate.find(query, MongoVO.class, "hts");
		    mlist.add(data);
		}
		return mlist;
	}

	// 리뷰 첨부파일 가져오기
	@Override
	public ArrayList findDataReviewList(List<Review> reviewList) {
		ArrayList mlist = new ArrayList();
		
		for( int i=0; i<reviewList.size();i++) {
			Criteria criteria = new Criteria("code");
			String revId = reviewList.get(i).getRevId();
			criteria.is(revId);
			Query query = new Query(criteria);
		    List<MongoVO> data = mongoTemplate.find(query, MongoVO.class, "hts");
		    mlist.add(data);
		}
		return mlist;
	}
	// 사용자 문의 첨부파일명 가져오기
	@Override
	public ArrayList findDataQList(List<QnA> ql) {
		
		ArrayList mlist = new ArrayList();
		
		for( int i=0; i<ql.size();i++) {
			Criteria criteria = new Criteria("code");
			String qnaId = ql.get(i).getQnaId();
			criteria.is(qnaId);
			Query query = new Query(criteria);
		    List<MongoVO> data = mongoTemplate.find(query, MongoVO.class, "hts");
		    mlist.add(data);
		}
		return mlist;
	}
	
	// 사장 문의 첨부파일명 가져오기
	@Override
	public ArrayList findDataOQList(List<ModelQnA> qnaList) {
			ArrayList mlist = new ArrayList();
		
		for( int i=0; i<qnaList.size();i++) {
			Criteria criteria = new Criteria("code");
			String qnaId = qnaList.get(i).getQnaId();
			criteria.is(qnaId);
			Query query = new Query(criteria);
		    List<MongoVO> data = mongoTemplate.find(query, MongoVO.class, "hts");
		    mlist.add(data);
		}
		return mlist;
	}

	// 관리자 문의 첨부파일명 가져오기
	@Override
	public ArrayList findDataQnAList(List<hts.model.vo.manager.QnA> ql) {
		
		ArrayList mlist = new ArrayList();
		
		for( int i=0; i<ql.size();i++) {
			Criteria criteria = new Criteria("code");
			String qnaId = ql.get(i).getQnaId();
			criteria.is(qnaId);
			Query query = new Query(criteria);
		    List<MongoVO> data = mongoTemplate.find(query, MongoVO.class, "hts");
		    mlist.add(data);
		}
		return mlist;
	}
	// 몽고 DB 현재 재고 값 가져오기
	@Override
	public List<Strorage> findDataSList(List<Strorage> pl) {

		for( int i=0; i<pl.size();i++) {
			Criteria criteria = new Criteria("code");
			String penId = pl.get(i).getPenId();
			criteria.is(penId);
			Query query = new Query(criteria);
		    List<StrorageVO> data = mongoTemplate.find(query, StrorageVO.class, "stock");
		    
		    pl.get(i).setStoBath(Integer.parseInt(data.get(0).getBath()));
		    pl.get(i).setStoTnc(Integer.parseInt(data.get(0).getCharcoal()));
		}
		return pl;
	
	}
	// 재고현황 업데이트
	@Override
	public int stoUpdate(String penId, String bath, String charcoal) {
		Criteria criteria = new Criteria("code");
		criteria.is(penId);

		Query query = new Query(criteria);

		Update update = new Update();
		update.set("bath",bath);
		update.set("charcoal",charcoal);

		mongoTemplate.updateMulti(query,update,"stock");
		
		return 1;
	}
	// 재고현황 초기 설정
	@Override
	public int stoInsert(String penId) {
		StrorageVO strorageVO = new StrorageVO();
		
		strorageVO.setCode(penId);
		strorageVO.setBath("20");
		strorageVO.setCharcoal("20");
		
		System.out.println("몽고 DAO 진입 : stock ");
		mongoTemplate.insert(strorageVO,"stock");
		System.out.println("몽고 stock 입력 완료");
		
		return 1;
	}

}

