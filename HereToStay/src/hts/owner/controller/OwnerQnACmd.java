package hts.owner.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hts.model.vo.owner.ModelQnA;
import hts.mongo.services.MongoService;
import hts.mongo.vo.BoardVO;
import hts.mongo.vo.MongoVO;
import hts.owner.dao.OwnerQnADao;

@Controller
@RequestMapping("/owner")
public class OwnerQnACmd {
	
	@Autowired 
	private OwnerQnADao qnaDAO;
	
	@Autowired 
	private	MongoService mongoService;
	 
	// 문의사항 입력 페이지로 이동
	@RequestMapping("/QnAWrite.do")
	public ModelAndView qnaWrite() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("owner/QnAWrite");
		return mv;
		
	}
	
	// 문의사항 저장 후 문의리스트로 이동
	@RequestMapping("/qnaInsert.do")
	public String qnaInsert(HttpSession session, ModelQnA qna, BoardVO boardVO) {
		String ownId = (String)session.getAttribute("ownId");
		qna.setUserId(ownId);
		
		if(qna.getQnaType().equals("펜션관리")) {
			qna.setMgrId("admin4");
		} else if(qna.getQnaType().equals("예약관리")) {
			qna.setMgrId("admin3");
		} else if(qna.getQnaType().equals("불만사항")) {
			qna.setMgrId("admin2");
		} else if(qna.getQnaType().equals("기타")) {
			qna.setMgrId("admin1");
		}
		//문의 ID 가져오는 부분
		String qnaId = qnaDAO.qnaInsert(qna);
		//몽고진입
		mongoService.insertPhoto(qnaId, boardVO);
		
		return "redirect:/owner/getQnAList.do";
	}
	
	// 문의사항 상세보기 페이지로 이동
	@RequestMapping("/qnaDetail.do")
	public ModelAndView qnaDetail(HttpSession session, String qnaId) {
		String ownId = (String)session.getAttribute("ownId");
		ModelQnA qna = qnaDAO.qnaDetail(qnaId, ownId);

		List<MongoVO> qList = mongoService.findMongo(qnaId);
		for(int i=0;i<qList.size();i++)
		{		qna.setPhotoList(qList); }
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("owner/QnADetail");
		mv.addObject("qnaDetail", qna);
		return mv;
	}
	
	// 문의사항 전체 리스트 얻어오기
	@RequestMapping("/getQnAList.do")
	public ModelAndView getQnAList(HttpSession session) {
		String ownId = (String)session.getAttribute("ownId");
		List<ModelQnA> qnaList = qnaDAO.getQnAList(ownId);

		// 문의사항 몽고 DB 진입			
		ArrayList<ArrayList<MongoVO>> mQnaList = mongoService.findMongoOQList(qnaList);
		for(int i=0;i<qnaList.size();i++)
		{		
			qnaList.get(i).setPhotoList((ArrayList)mQnaList.get(i));
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("owner/QnAList");
		mv.addObject("QnAList", qnaList);
		return mv;
	}
	
	   @RequestMapping("/realQnA")
	   public ModelAndView realQnA() {
	      ModelAndView model = new ModelAndView();
	      model.setViewName("owner/realQnA");
	      
	      return model;
	   }
}