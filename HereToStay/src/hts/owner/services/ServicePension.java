package hts.owner.services;

import java.util.List;

import hts.model.vo.owner.Pension;
import hts.model.vo.owner.Room;

public interface ServicePension {

	// 펜션 입력 및 수정
	int pensionInsert(Pension pension);

	// 사장 ID로 펜션ID 찾기
	String findPension(String ownId);
	
	// 사장 ID로 펜션 정보 찾기
	Pension pensionSelect(Pension pension);
	
	// 객실 정보 삽입 및 코드 가져오기
	String roomInsert(Room room);
	
	// 객실 정보 가져오기 : mode = rownum 
	Room roomSelect(String dbPenId,String mode);

	// 탭에 뿌려주기 위한 객실명 가져오기
	List<Room> roomTagList(String findPenId);

	// 객실 삭제 버튼 클릭시 DB 값 삭제 : mode = rownum
	String deleteRoom(String findPenId, String mode);

	// 검수 요청시 펜션 허가식별키 변경
	int updateStatus(String loginInfo);
	
}
