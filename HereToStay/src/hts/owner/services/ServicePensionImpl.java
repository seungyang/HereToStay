package hts.owner.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hts.model.vo.owner.Pension;
import hts.model.vo.owner.Room;
import hts.owner.dao.OwnerPensionDao;
import hts.owner.dao.OwnerRoomDao;

@Service
public class ServicePensionImpl implements ServicePension{

	@Autowired
	private OwnerPensionDao pensionDao;
	
	@Autowired
	private OwnerRoomDao roomDao;
	
	
	
	// 사장 ID로 펜션 찾기
	@Override
	public String findPension(String ownId) {
	
		return pensionDao.findPension(ownId);
	}
		
	// 사장 ID로 펜션 정보 찾기
	@Override
	public Pension pensionSelect(Pension pension) {
		
		Pension pensiondb = pensionDao.pensionSelect(pension);
		
		if ( pensiondb != null) {
			pensiondb.setPenShot(pensiondb.getPenShot().substring(0,10));
			pensiondb.setPenEhot(pensiondb.getPenEhot().substring(0,10));
		}
		return pensiondb;
	}
	
	// 펜션 입력 및 수정
	@Override
	public int pensionInsert(Pension pension) {
	
		int result = 0;
		
		String addr = pension.getPenA1()+pension.getPenA2();
		
		pension.setPenAddr("");
		pension.setPenAddr2(addr);
		// 펜션 아이디 유무로 삽입문과 업데이트문 확인
		if(pension.getPenId()!=null) {
			result = pensionDao.pensionUpdate(pension);
		}else {
			result = pensionDao.pensionInsert(pension);
		
		}
		
		return result;
	}

	@Override
	public Room roomSelect(String dbPenId,String mode) {
		return roomDao.roomSelect(dbPenId, mode);
	}

	// 객실 정보 삽입 및 코드 가져오기
	@Override
	public String  roomInsert(Room room) {

		String roomId="";
		if(room.getRomId()==null || room.getRomId().equals("")) {
			System.out.println("insert");
			roomId = roomDao.roomInsert(room);

		}else {
			System.out.println("update");
			roomId = roomDao.roomUpdate(room);
		}
		return roomId;
	}

	// 탭에 뿌려주기 위한 객실명 가져오기
	@Override
	public List<Room> roomTagList(String findPenId) {
		return roomDao.roomTagList(findPenId);
	}
	
	
	// 객실 삭제 버튼 클릭시 DB 값 삭제 : mode = rownum
	@Override
	public String deleteRoom(String findPenId, String mode) {

		return roomDao.deleteRoom(findPenId,mode);
	}

	// 검수 요청시 펜션 허가식별키 변경
	@Override
	public int updateStatus(String loginInfo) {
		return pensionDao.updateStatus(loginInfo);
		
	}
}
