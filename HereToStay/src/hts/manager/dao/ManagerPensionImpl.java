package hts.manager.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hts.model.vo.manager.Pension;
import hts.model.vo.manager.PensionDetail;
import hts.model.vo.manager.StorageDetail;
import hts.model.vo.manager.Strorage;

@Repository
public class ManagerPensionImpl implements ManagerPensionDAO {
 
   @Autowired
   private SqlSessionTemplate ss2;
      
//   @Override
//   public List<Pension> list(Pension pension) {
//      // TODO Auto-generated method stub 
//       return ss.selectList("ManagerPension.pensionList",pension);
//   }
   @Override
   public List<Pension> list(Pension pension) { //펜션리스트
      // TODO Auto-generated method stub 
       return ss2.selectList("ManagerPension.pensionList", pension);
   }
   
   @Override
   public List<PensionDetail> list2(String id) { //펜션 상세보기
      System.out.println(id);
       return ss2.selectList("ManagerPension.pensionDetail", id);
   }


   @Override
   public int pensionLocalUpdate(String penId, String penAddr) { //펜션 수락
      HashMap map = new HashMap();
      map.put("penId", penId);
      map.put("penAddr", penAddr);
      
      return ss2.update("ManagerPension.pensionLocalUpdate", map);
   }


   public List<StorageDetail> stolist(StorageDetail sto) { //재고 리스트
      // TODO Auto-generated method stub
      return ss2.selectList("ManagerStorage.storageList");
   }
   

   @Override
   public Pension countDay(Pension pension) { //펜션 일별 수락 갯수
      // TODO Auto-generated method stub
      return ss2.selectOne("ManagerPension.countDay",pension);
   }

   @Override
   public Pension countMonth(Pension pension) { //펜션 월별 수락 갯수
      // TODO Auto-generated method stub
      return ss2.selectOne("ManagerPension.countMonth",pension);
   }

   @Override
   public Pension countOk(Pension pension) { // 펜션 전체 수락 갯수
      // TODO Auto-generated method stub
      return ss2.selectOne("ManagerPension.countOk",pension);
   }

   @Override
   public int pensionRefuse(Pension pension) {// 펜션 거절
      // TODO Auto-generated method stub
      return ss2.update("ManagerPension.pensionRefuse", pension);

   }

   @Override
   public int pensionTC(Pension pension) {//펜션 더보기 페이지 카운트
      // TODO Auto-generated method stub
      return ss2.selectOne("ManagerPension.pensionTC",pension);
   }

   public List<Pension> list3(Pension pension) { // 펜션 리스트 전체보기
      // TODO Auto-generated method stub
      return ss2.selectList("ManagerPension.pensionPaging", pension);
   }

   public List<StorageDetail> list4(StorageDetail sto) {//재고리스트 전체보기
      // TODO Auto-generated method stub
      return ss2.selectList("ManagerStorage.stoPaging", sto);
   }

   @Override
   public int storageTC(StorageDetail storageDetail) {//재고 리스트 더보기 페이지 카운트
      // TODO Auto-generated method stub
      return ss2.selectOne("ManagerStorage.storageTC",storageDetail);
   }

   @Override
   public List<StorageDetail> list5(StorageDetail stoSearch) { //재고리스트에서 펜션 검색
      // TODO Auto-generated method stub
      return ss2.selectList("ManagerStorage.stoSearch",stoSearch);
   }

@Override
public int storageSearchTC(StorageDetail storageDetail) {//재고리스트에서 펜션 검색시에 페이징 카운트
	// TODO Auto-generated method stub
	return ss2.selectOne("ManagerStorage.storageSearchTC",storageDetail);
}

@Override
public List<Strorage> findPenId() {//몽고에서 펜션id 찾기
	return ss2.selectList("ManagerPension.penIdSto");
}





}