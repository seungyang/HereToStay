package hts.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hts.member.dao.MyPageMemInfoDao;
import hts.member.dao.QnADetailDao;
import hts.model.vo.member.Member;
import hts.model.vo.member.MyQnADetail;
import hts.model.vo.member.QnA;
import hts.model.vo.member.Reservation;
import hts.model.vo.member.Review;
import hts.mongo.services.MongoService;
import hts.mongo.vo.BoardVO;

@Controller
@RequestMapping("/member")
public class QnAInsert {

	@Autowired
	private QnADetailDao qnaDetail;
	@Autowired
	private MyPageMemInfoDao myPage;
	@Autowired
	private MongoService mongoService;
	
	@RequestMapping("/qnaWrite.do")
	public ModelAndView qnaWrite(HttpSession session) {
		String memId = (String)session.getAttribute("memId");
		ModelAndView model = new ModelAndView();
		
		if(memId != null) {
			model.setViewName("member/QnAWrite");
		} else {
		}
		return model;
	}
	
	@RequestMapping("/qnaInsert.do")
	public String qnaInsert(HttpSession session, QnA qna, BoardVO boardVO) {
		String memId = (String)session.getAttribute("memId");
		qna.setUserId(memId);
		
		if(qna.getQnaType().equals("펜션관리")) {
			qna.setMgrId("admin4");
		} else if(qna.getQnaType().equals("예약관리")) {
			qna.setMgrId("admin3");
		} else if(qna.getQnaType().equals("불만사항")) {
			qna.setMgrId("admin2");
		} else if(qna.getQnaType().equals("기타")) {
			qna.setMgrId("admin1");
		}
		
		// 문의ID 가져오는부분있어야함
		String qnaId = qnaDetail.qnaInsert(qna);
		// 몽고 진입
		mongoService.insertPhoto(qnaId, boardVO);
		
		return "redirect:/member/myPage.do";
	}
}