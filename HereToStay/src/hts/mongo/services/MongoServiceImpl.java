package hts.mongo.services;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hts.manager.dao.ManagerStorageDAO;
import hts.model.vo.manager.Strorage;
import hts.model.vo.member.Pension;
import hts.model.vo.member.QnA;
import hts.model.vo.member.Reservation;
import hts.model.vo.member.Review;
import hts.model.vo.member.Room;
import hts.model.vo.owner.ModelQnA;
import hts.mongo.dao.MongoDao;
import hts.mongo.vo.BoardVO;
import hts.mongo.vo.MongoVO;

@Service
public class MongoServiceImpl implements MongoService {

	@Autowired
	private MongoDao mongoDao;
	@Autowired
	private ManagerStorageDAO managerStorageDAO;
	
	// MultipartHttpServletRequest 다중 파일을 받아주는 객체
	// 다중 첨부시 파일 업로드
	@Override
	public int addPension(String code, MultipartHttpServletRequest mhsq) {
		// 다중 파일 전송\
		
		String realFolder = "C:/Users/kosta/Desktop/HereToStay_member/HereToStay_member/WebContent/uploadPhoto/";
		File dir = new File(realFolder);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		// 기존에 데이터가 잇을경우 데이터 삭제 진행
		List<MongoVO> data = mongoDao.findData(code);
		if (data.size() > 0) {
				mongoDao.deleteData(code);
				for( int i = 0; i<data.size() ; i++) {
					String savePath = realFolder + data.get(i).getFullname();
					File f = new File(savePath);
					if (f.delete()) {
					     System.out.println("파일 또는 디렉토리를 성공적으로 지웠습니다: " + savePath);
					} else {
					   System.err.println("파일 또는 디렉토리 지우기 실패: " + savePath);
					}
				}
		}
		
		List<MultipartFile> mf = mhsq.getFiles("uploadFile");
		if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
            
        } else {
            for (int i = 0; i < mf.size(); i++) {
                // 파일 중복명 처리
//                String genId = UUID.randomUUID().toString();
            	String encryptFileName = UUID.randomUUID().toString();
                // 본래 파일명
//                String originalfileName = mf.get(i).getOriginalFilename();
    			String realFileName = mf.get(i).getOriginalFilename();
                 
                String saveFileName = encryptFileName + "." + FilenameUtils.getExtension(realFileName);
                // 저장되는 파일 이름
                String savePath = realFolder + saveFileName; // 저장 될 파일 경로

                try {
					mf.get(i).transferTo(new File(savePath));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
                // 파일 업로드 함수
                fileUpload(code, realFileName, encryptFileName, saveFileName);
            }
            return 1;
        }
		return 0;

}
	 // 파일 업로드 함수 // 몽고 입력폼에 맞게 객체 수정
	public void fileUpload(String code, String realFileName,String encryptFileName, String saveFileName) {
		MongoVO mongovo = new MongoVO();
		
		mongovo.setCode(code);
		mongovo.setEncryName(encryptFileName);
		mongovo.setRealName(realFileName);
		mongovo.setFullname(saveFileName);
		
	    mongoDao.addPension(mongovo);

	}

	
	// 펜션명으로 몽고DB에 있는 첨부파일 찾기
	@Override
	public List<MongoVO> findMongo(String penId) {
			
		return  mongoDao.findData(penId);
	}
	// 몽고 DB 데이터 지우기
	// 몽고 DB 값 지우고 파일 삭제도 하는 부분
	@Override
	public int removeMongo(String roomId) {
		String realFolder = "C:/Users/kosta/Desktop/HereToStay_member/HereToStay_member/WebContent/uploadPhoto/";
		List<MongoVO> data = mongoDao.findData(roomId);
		// 몽고로부터 받은 객실 값이 있다면 파일 삭제
		if (data.size() > 0) {
				// 몽고 db 삭제
				mongoDao.deleteData(roomId);
				for( int i = 0; i<data.size() ; i++) {
					String savePath = realFolder + data.get(i).getFullname();
					File f = new File(savePath);
					if (f.delete()) {
					     System.out.println("파일 또는 디렉토리를 성공적으로 지웠습니다: " + savePath);
					} else {
					   System.err.println("파일 또는 디렉토리 지우기 실패: " + savePath);
					}
				}
		}
		return 0;
	}

	// 펜션 전체 정보 받아보기
	@Override
	public ArrayList findMongoPList(List<Pension> pl) {
		return mongoDao.findDataPList(pl);
	}

	// 객실 전체 정보 받아오기
	@Override
	public ArrayList findMongoRList(List<Room> rl) {
		return mongoDao.findDataRList(rl);
	}
	// 예약 전체 정보 받아오기
	@Override
	public ArrayList findMongoReserList(List<Reservation> reserList) {
		return mongoDao.findDataReserList(reserList);
	}
	// 리뷰 전체 정보 받아오기
	@Override
	public ArrayList findMongoReviewList(List<Review> reviewList) {
		return mongoDao.findDataReviewList(reviewList);
	}
	// 사용자 문의 첨부파일명 가져오기
	@Override
	public ArrayList findMongoQList(List<QnA> ql) {
		return mongoDao.findDataQList(ql);
	}
	// 사장 문의 첨부파일명 가져오기
	@Override
	public ArrayList findMongoOQList(List<ModelQnA> qnaList) {
		return mongoDao.findDataOQList(qnaList);
	}
	// 관리자 문의 첨부파일명 가져오기
	@Override
	public ArrayList findMongoQnAList(List<hts.model.vo.manager.QnA> ql) {
		return mongoDao.findDataQnAList(ql);
	}
	
	// QNA 사진 첨부 
	@Override
	public void insertPhoto(String qnaId, BoardVO boardVO) {
		// TODO Auto-generated method stub
		
		MultipartFile file = boardVO.getFileUpload();
		String realFolder = "C:/Users/kosta/Desktop/HereToStay_member/HereToStay_member/WebContent/uploadPhoto/";
		File dir = new File(realFolder);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
			
               // 파일 중복명 처리
            	String encryptFileName = UUID.randomUUID().toString();
                // 본래 파일명
            	String realFileName = file.getOriginalFilename();
                 
                String saveFileName = encryptFileName + "." + FilenameUtils.getExtension(realFileName);
                System.out.println("test1 : "+ realFileName);
                System.out.println("test2 : "+ saveFileName);
                // 저장되는 파일 이름
                 String savePath = realFolder + saveFileName; // 저장 될 파일 경로
 
                try {
                	file.transferTo(new File(savePath));
				} catch (IllegalStateException e) {} catch (IOException e) {} 
          fileUpload(qnaId, realFileName, encryptFileName, saveFileName);
			
	}
	// 사장님 사업자등록증 저장
	@Override
	public String setLicense(BoardVO boardVO) {

		MultipartFile file = boardVO.getFileUpload();
		
		System.out.println("license  " + file);	
		
		String realFolder = "C:/Users/kosta/Desktop/HereToStay_member/HereToStay_member/WebContent/uploadPhoto/";
		File dir = new File(realFolder);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
        // 파일 중복명 처리
        String encryptFileName = UUID.randomUUID().toString(); // 128371283=12312=3123132
        System.out.println("encryptFileName  " + encryptFileName);
        // 본래 파일명
    	String realFileName = file.getOriginalFilename();  // 1.jpg
        System.out.println("realFileName  " + realFileName);
    	// 저장되는 파일 이름
    	// FilenameUtils.getExtension == jpg 등 확장자를 가져오는 함수
        String saveFileName = encryptFileName + "." + FilenameUtils.getExtension(realFileName);
        
        String savePath = realFolder + saveFileName; // 저장 될 파일 경로
        
        try {
        	file.transferTo(new File(savePath));
        } catch (IllegalStateException e) {} catch (IOException e) {} 
        
        return saveFileName;
	}
	
	// 재고현황 오라클 DB 및 몽고DB 동기화 작업
	@Override
    public void testScheduler(List<Strorage> pl ){
		// 몽고 DB 현재 재고 값 가져오기
    	List<Strorage> mStoList = mongoDao.findDataSList(pl);

    	for (int i = 0; i < mStoList.size();i++) {
    		// 몽고 db 값으로 Merge로 인설트 및 업데이트 
    		int chk = managerStorageDAO.stoMerge(mStoList.get(i));
	
    	}
    	    	
    }
	// 재고현황 업데이트
	@Override
	public int stoUpdate(String penId, String bath, String charcoal) {
		return mongoDao.stoUpdate(penId,bath,charcoal);
		
	}
	// 재고현황 초기 설정
	@Override
	public int insertStock(String penId) {
		
		return mongoDao.stoInsert(penId);
	}


	
}