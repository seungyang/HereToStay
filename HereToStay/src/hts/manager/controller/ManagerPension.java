package hts.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hts.manager.dao.ManagerPensionDAO;

import hts.model.vo.manager.Pension;
import hts.model.vo.manager.PensionDetail;
import hts.model.vo.manager.StorageDetail;
import hts.model.vo.manager.Strorage;
import hts.mongo.services.MongoService;
import hts.mongo.vo.BoardVO;
import hts.mongo.vo.MongoVO;
 


@Controller
@RequestMapping("/manager")
public class ManagerPension {
	 @Autowired
	private MongoService mongoService;
	
   @Autowired
   private ManagerPensionDAO managerPensionDAO;
   
   
   @RequestMapping("/pensionList.do") //펜션 리스트 이동
   public ModelAndView pensionList(Pension pension,StorageDetail storageDetail) {


      List<Pension> penModel = null;
      penModel = managerPensionDAO.list(pension);
      
      List<StorageDetail> stoModel = null;
      stoModel = managerPensionDAO.stolist(storageDetail);
      
      Pension countDay = managerPensionDAO.countDay(pension);
      
      Pension countMonth = managerPensionDAO.countMonth(pension);
      
      Pension countOk = managerPensionDAO.countOk(pension);
      
      List<Strorage> pl = managerPensionDAO.findPenId();
      System.out.println(pl.size());
      mongoService.testScheduler(pl);
      
      ModelAndView mv = new ModelAndView();
//      mv.addAttribute("listModel",listModel);
      mv.setViewName("/manager/pensionList");
      mv.addObject("listmodel",penModel);
      mv.addObject("listModel",stoModel);
      mv.addObject("countday",countDay);
      mv.addObject("countmonth",countMonth);
      mv.addObject("countok",countOk);
   
      
      return mv;   
   }
   
   @RequestMapping("/pensionMore.do") // 펜션 리스트 더보기
   public ModelAndView pensionListMore(Pension pension,StorageDetail storageDetail) {


      int totalCount = managerPensionDAO.pensionTC(pension);
      
      pension.setTotalCount(totalCount);
      
      List<Pension> penModel = null;
      penModel = managerPensionDAO.list3(pension);

      ModelAndView mv = new ModelAndView();

      mv.setViewName("/manager/pensionMore");
      mv.addObject("listmodel",penModel);
      mv.addObject("pageVO",pension);
   
      
      return mv;   
   }
   

   
   @RequestMapping("/storageDetail.do") // 재고 상세보기
   public ModelAndView storageDetail(Pension pension,StorageDetail storageDetail) {

      // 재고리스트 더보기 페이징처리 시에 카운트
      int totalCount = managerPensionDAO.storageTC(storageDetail);

      storageDetail.setTotalCount(totalCount);
      
      List<Strorage> pl = managerPensionDAO.findPenId();
      mongoService.testScheduler(pl);
      
      
      List<StorageDetail> stoModel = null;
      stoModel = managerPensionDAO.list4(storageDetail);
   
      
      ModelAndView mv = new ModelAndView();

      mv.setViewName("/manager/storageDetail");
      mv.addObject("listModel",stoModel);
      mv.addObject("pageVO",storageDetail);
   
      
      return mv;   
   }
   
   
   
   @RequestMapping("/pensionDetail.do") // 펜션 정보 상세보기
   public ModelAndView pensionDetail(String selectId, BoardVO boardVO) {

      List<PensionDetail> pensionList = managerPensionDAO.list2(selectId);
      

      List<MongoVO> plist = mongoService.findMongo(selectId);
      

      
      for (PensionDetail d : pensionList) {

      }
      System.out.println();
      

      ModelAndView mv = new ModelAndView();

      mv.setViewName("/manager/pensionDetail");
      mv.addObject("detail", pensionList);
      mv.addObject("plist",plist);
      return mv;

   }
   

   
   @RequestMapping("/localPermission.do") //펜션 수락
   public ModelAndView localPermission(String penId, String penAddr) {

  
      int pensionList = managerPensionDAO.pensionLocalUpdate(penId, penAddr);
      int result = mongoService.insertStock(penId);
 
      ModelAndView mv = new ModelAndView();
      mv.setViewName("/manager/pensionDetail");
      mv.addObject("permission",pensionList);
      
      return mv;   
   }
   
   
   @RequestMapping("/pensionRefuse.do") //펜션 거절
   public ModelAndView pensionRefuse(Pension pension) {
      int refuse = managerPensionDAO.pensionRefuse(pension);
      ModelAndView mv = new ModelAndView();
      mv.setViewName("/manager/pensionDetail");
      mv.addObject("refuse",refuse);

      return mv;
   }
   @RequestMapping("/stoSearch.do")
   public ModelAndView stoSearch(StorageDetail storageDetail) { //재고리스트에서 펜션 검색
      
      int totalCount = managerPensionDAO.storageSearchTC(storageDetail);
      storageDetail.setTotalCount(totalCount);
      
      List<StorageDetail> stoModel = null;
      stoModel = managerPensionDAO.list5(storageDetail);
      
      ModelAndView mv = new ModelAndView();
      
      mv.setViewName("/manager/storageDetail");
      mv.addObject("listModel",stoModel);
      mv.addObject("pageVO",storageDetail);
      
      return mv;   
   }
}
