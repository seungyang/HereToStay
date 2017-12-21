package hts.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hts.member.dao.MyPageMemInfoDao;
import hts.member.dao.ReserveDetailDao;
import hts.model.vo.member.Member;
import hts.model.vo.member.QnA;
import hts.model.vo.member.Reservation;
import hts.model.vo.member.ReservationDetail;
import hts.model.vo.member.Review;
import hts.mongo.services.MongoService;
import hts.mongo.vo.BoardVO;
import hts.mongo.vo.MongoVO;

@Controller
@RequestMapping("/member")
public class ReserveDetail {
	
	@Autowired
	private ReserveDetailDao reserve;
	@Autowired
	private MyPageMemInfoDao myPage;
	@Autowired
	private MongoService mongoService;
	
	@RequestMapping("/getReserve.do")
	public ModelAndView getReserve(HttpSession session, String resId) {
		String memId = (String)session.getAttribute("memId");
		
		ReservationDetail reservationDetail = reserve.getReserve(memId, resId);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("member/reservationDetail");
		model.addObject("reservationDetail", reservationDetail);
		
		return model;
	}
	
	@RequestMapping("delReserve.do")
	public ModelAndView delReserve(HttpSession session, String resId) {
		reserve.delReserve(resId);

		String id = (String)session.getAttribute("memId");
		int page = 1;
		int first = (page-1)*6+1;
		int last = first+5;
		
	      Member member = myPage.getMember(id);
	      int memMig = reserve.getMig(id);
	      int totMoney = reserve.getTotMoney(resId);

	      if(memMig - (totMoney * 0.01) < 0) {
	         reserve.setZeroMig(id);
	         member.setMemMig(0);
	      } else {
	         reserve.delMig(resId, id);
	         member = myPage.getMember(id);
	      }
		
		List<Reservation> reserList = myPage.getReserList(first, last, id, "1", "1");
		int totalPage = myPage.getListCount(id);
		List<Review> reviewList = myPage.getReviewList(id);
		List<QnA> QnAList = myPage.getQnAList(id);
		
		
		// 예약리스트 몽고 DB 진입			
		ArrayList<ArrayList<MongoVO>> mResList = mongoService.findMongoReserList(reserList);
		for(int i=0;i<reserList.size();i++)
		{		reserList.get(i).setPhotoList((ArrayList)mResList.get(i));			}
		
		// 리뷰리스트 몽고 DB 진입			
		ArrayList<ArrayList<MongoVO>> mRevList = mongoService.findMongoReviewList(reviewList);
		for(int i=0;i<reviewList.size();i++)
		{	reviewList.get(i).setPhotoList((ArrayList)mRevList.get(i));			}
				
		// 문의사항 몽고 DB 진입			
		ArrayList<ArrayList<MongoVO>> qList = mongoService.findMongoQList(QnAList);
		for(int i=0;i<QnAList.size();i++)
		{		QnAList.get(i).setPhotoList((ArrayList)qList.get(i));			}
		
		ModelAndView model= new ModelAndView();
		
		model.setViewName("member/myPage");
		model.addObject("member", member);
		model.addObject("reserList", reserList);
		model.addObject("totalPage", (int) Math.ceil(totalPage/(double)6 ));
		model.addObject("reviewList", reviewList);
		model.addObject("QnAList", QnAList);
		model.addObject("page", page);
		model.addObject("tag",1);
		model.addObject("sort1", 1);
		model.addObject("sort2", 1);
		

		return model;
	}
	
	@RequestMapping("writeReview.do")
	public String writeReview(Review review, HttpSession session,BoardVO boardVO) {
		String id = (String)session.getAttribute("memId");
		int page = 1;
		int first = (page-1)*6+1;
		int last = first+5;

		String resId = reserve.writeReview(review);
		
		mongoService.insertPhoto(resId, boardVO);
		
		return "redirect:/member/myPage.do";
	}
	
}