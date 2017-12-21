package hts.owner.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hts.model.vo.owner.Reservation;

@Repository
public class OwnerReserveImpl implements OwnerReserveDao {

   @Autowired
   private SqlSessionTemplate ss1;
   
   @Override
   public List<Reservation> reslist(int first, int end, String penId) {
      HashMap map = new HashMap<>();
      map.put("first", first);
      map.put("end", end);
      map.put("penId", penId);
      
      return ss1.selectList("ownerReserve.getAllReserve", map);
   }
   @Override
   public Reservation resCount(Reservation vo) {
      
      return ss1.selectOne("ownerReserve.resCount",vo);
   }

   @Override
   public List<Reservation> resRate(Reservation vo) {
      
      return ss1.selectList("ownerReserve.resRate");
   }

   
   // main 예약 리스트 가져오는 메소드
   @Override
   public List<Reservation> getReserve(String penId) {
      return ss1.selectList("ownerReserve.getReserve", penId);
   }

   
   // penId 얻어오는 메소드
   @Override
   public String getPenId(String ownId) {
      return ss1.selectOne("ownerReserve.getPenId", ownId);
   }

   // today 예약 개수 얻어오는 메소드
   @Override
   public Integer getToday(String penId) {
      return ss1.selectOne("ownerReserve.getToday", penId);
   }

   // week 예약 개수 얻어오는 메소드
   @Override
   public Integer getWeek(String penId) {
      return ss1.selectOne("ownerReserve.getWeek", penId);
   }

   // month 예약 개수 얻어오는 메소드
   @Override
   public Integer getMonth(String penId) {
      return ss1.selectOne("ownerReserve.getMonth", penId);
   }
   
// List 개수 얻어오는 메소드
   @Override
   public Integer getListNum(String penId) {
      return ss1.selectOne("ownerReserve.getListNum", penId);
   }
}