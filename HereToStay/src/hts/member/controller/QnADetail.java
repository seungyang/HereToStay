package hts.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hts.member.dao.QnADetailDao;
import hts.model.vo.member.MyQnADetail;
import hts.mongo.services.MongoService;
import hts.mongo.vo.MongoVO;

@Controller
@RequestMapping("/member")
public class QnADetail {
	
	@Autowired
	private QnADetailDao qna;
	
	@Autowired
	private MongoService mongoService;
	
	@RequestMapping("/getQnA.do")
	public ModelAndView getQnA(HttpSession session, String qnaId) {
		String memId = (String)session.getAttribute("memId");
		MyQnADetail qnaDetail = qna.getQnA(memId, qnaId);
		
		
		
		// 문의사항 몽고 DB 진입			
		List<MongoVO> qList = mongoService.findMongo(qnaId);
		for(int i=0;i<qList.size();i++)
		{		qnaDetail.setPhotoList(qList); }
		
		ModelAndView model = new ModelAndView();
		model.setViewName("member/QnADetail");
		model.addObject("qnaDetail", qnaDetail);
		
		return model;
	}
	
	  @RequestMapping("/realQnA")
	   public ModelAndView realQnA() {
	      ModelAndView model = new ModelAndView();
	      model.setViewName("member/realQnA");
	      
	      return model;
	   }
}