package hts.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hts.manager.dao.ManagerQnAViewDAO;
import hts.model.vo.manager.QnA;
import hts.mongo.services.MongoService;
import hts.mongo.vo.MongoVO;

@Controller
@RequestMapping("/manager")
public class ManagerQnAView {
	@Autowired
	private ManagerQnAViewDAO managerQnAViewDAO;
	
	@Autowired
	private MongoService mongoService;
	
	@RequestMapping("/qnaDetail.do") //문의사항 상세보기
	public ModelAndView qnaView(QnA qna,String qnaId){
		QnA qna_vo = managerQnAViewDAO.qnaView(qna);
		
		List<MongoVO> qList = mongoService.findMongo(qnaId);
		for(int i=0;i<qList.size();i++)
		{		qna_vo.setPhotoList(qList); }
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manager/QnADetail");
		mv.addObject("QnAmodel",qna_vo);
		return mv;

	}
	
	@RequestMapping("/QnAreplyModify.do")
	public ModelAndView qnaReply(QnA qna){//문의사항 댓글 달기
		int Replyresult = managerQnAViewDAO.qnaReply(qna);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manager/QnADetail");
		mv.addObject("Replyresult",Replyresult);
		return mv;
	}
}
