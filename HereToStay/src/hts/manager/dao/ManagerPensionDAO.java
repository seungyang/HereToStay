package hts.manager.dao;

import java.util.List;

import hts.model.vo.manager.Pension;
import hts.model.vo.manager.PensionDetail;
import hts.model.vo.manager.StorageDetail;
import hts.model.vo.manager.Strorage;

public interface ManagerPensionDAO {

   

   
   List<Pension> list(Pension pension); //펜션리스트

   List<StorageDetail> stolist(StorageDetail sto); //재고리스트
   
   List<PensionDetail> list2(String id); //펜션 상세보기
   
   int pensionTC(Pension pension); //펜션리스트 더보기 페이징 처리 시에 카운트
   
   int pensionLocalUpdate(String penId, String penAddr); //펜션 수락
   
   Pension countDay(Pension pension); //펜션 일별 수락 갯수
   
   Pension countMonth(Pension pension); //펜션 월별 수락 갯수
   
   Pension countOk(Pension pension); //펜션 전체 수락 갯수

   int pensionRefuse(Pension pension); //펜션 거절

   List<Pension> list3(Pension pension); //펜션 리스트 더보기
   
   List<StorageDetail> list4(StorageDetail storageDetail);// 재고 리스트 더보기

   int storageTC(StorageDetail storageDetail);//재고리스트 페이징 처리 시에 카운트

   List<StorageDetail> list5(StorageDetail stoSearch);//재고리스트에서 펜션 검색
   
   int storageSearchTC(StorageDetail storageDetail);//재고리스트 상세보기

   List<Strorage> findPenId(); // 몽고에서 펜션id 찾기
   
}