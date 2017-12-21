package hts.owner.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hts.model.vo.owner.Pension;

@Repository
public class OwnerPensionImpl implements OwnerPensionDao {

	@Autowired
	private SqlSessionTemplate ss1;
	
	// 펜션정보 입력 Insert 하는 메소드
	@Override
	public int pensionInsert(Pension pension) {
		int result = 0;
		try {
			result = ss1.insert("ownerPension.pensionInsert",pension);
		} catch (Exception e) {
			System.out.println("OwnerPensionImpl / pensionInsert 에러: " + e.getMessage());
		}
		return result;
	}
	
	// 사장님회원 접속여부 체크하는 메소드
	@Override
	public String findPension(String ownId) {

		return ss1.selectOne("ownerPension.pensionFind",ownId);
	}
	
	// 예약현황 리스트 출력하는 메소드
	@Override
	public Pension pensionSelect(Pension pension) {
		
		return ss1.selectOne("ownerPension.pensionList",pension);
				
	}
	
	// 펜션 정보 수정 Update 하는 메소드
	@Override
	public int pensionUpdate(Pension pension) {
		int result = 0;
		try {
			result = ss1.insert("ownerPension.pensionUpdate",pension);
		} catch (Exception e) {
			System.out.println("OwnerPensionImpl / pensionUpdate 에러: " + e.getMessage());
		}
		return result;
	}
	
	
	// 펜션 가입 상태 Y/N 표시 하는 메소드
	@Override
	public int updateStatus(String loginInfo) {
		int result = 0;
		try {
			result = ss1.update("ownerPension.StatusUpdate", loginInfo);
		} catch (Exception e) {
			System.out.println("OwnerPensionImpl / StatusUpdate 에러: " + e.getMessage());
		}
		return result;
	}

	
}
