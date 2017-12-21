package hts.manager.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hts.manager.dao.ManagerQnADAO;
import hts.model.vo.manager.QnA;
import hts.mongo.services.MongoService;
import hts.mongo.vo.MongoVO;


@Controller
@RequestMapping("/manager")
public class ManagerQnA {
   @Autowired
   private ManagerQnADAO managerQnADAO;

   @Autowired
	private MongoService mongoService;
   
   @RequestMapping("/QnAList.do") //문의사항 리스트
   public ModelAndView list(QnA qna) {
      
		
		
      List<QnA> listModel = null;
      List<QnA> memlist = null;
      List<QnA> ownerlist = null;
      ownerlist = managerQnADAO.ownerlist(qna);
      memlist = managerQnADAO.memlist(qna);
      listModel = managerQnADAO.list(qna);
      
      ArrayList<ArrayList<MongoVO>> qList = mongoService.findMongoQnAList(memlist);
		for(int i=0;i<memlist.size();i++)
		{		memlist.get(i).setPhotoList((ArrayList)qList.get(i));			}
    
   
      ModelAndView mv = new ModelAndView();
      mv.setViewName("/manager/QnAList");
      mv.addObject("QnAlist",listModel);
      mv.addObject("memlist",memlist);
      mv.addObject("ownerlist",ownerlist);
      return mv;
   }
   
   
   @RequestMapping("/realQnA")
   public ModelAndView realQnA() { //실시간 채팅
      ModelAndView model = new ModelAndView();
      model.setViewName("manager/realQnA2");
      
      return model;
   }

}