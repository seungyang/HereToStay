package hts.owner.dao;

import hts.model.vo.owner.Pension;

public interface OwnerPensionDao {
	
	// 펜션 정보 입력 하는 메소드
	int  pensionInsert(Pension pension);
	
	// 로그인 사장님회원 접속여부 체크 하는 메소드
	String findPension(String ownId);
	
	// 예약현황 리스트 출력 하는 메소드
	Pension pensionSelect(Pension pension);
	
	// 펜션 정보 수정 Update 하는 메소드
	int pensionUpdate(Pension pension);
	
	// 펜션 가입 상태 Y/N 표시 하는 메소드
	int updateStatus(String loginInfo);

}
