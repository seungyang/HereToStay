package hts.owner.dao;

import java.util.List;

import hts.model.vo.owner.Room;

public interface OwnerRoomDao {
	
	// 객실 정보 입력하는 메소드 
	String roomInsert(Room room);
	
	// 펜션 에 등록되어있는 객실정보 가져오는 메소드
	Room roomSelect(String dbPenId,String mode);
	
	// 등록되어있는 객실 명 탭에표시 하는 메소드
	List<Room> roomTagList(String findPenId);
	
	// 객실 정보 수정하는 메소드
	String roomUpdate(Room room);
	
	// 객실 정보 삭제하는 메소드
	String deleteRoom(String findPenId, String mode);

}
