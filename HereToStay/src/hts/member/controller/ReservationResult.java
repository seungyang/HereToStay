package hts.member.controller;

import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import hts.member.dao.ReservationDao;
import hts.member.dao.ReservationResultDao;
import hts.model.vo.member.Reservation;
import hts.model.vo.member.ReservationDetail;


@Controller
@RequestMapping("/member")
public class ReservationResult {

	@Autowired
	private ReservationResultDao reservationResult;

	
	/**
	 *예약된 결과를 보여주는 함수 
	 * */
	@RequestMapping("/reservationResult.do")
	public ModelAndView getReserve(HttpServletRequest request,HttpSession session) {

		//모델에 보여줄 정보 객체
		ReservationDetail result =new ReservationDetail();

		String memId = (String)session.getAttribute("memId");
		int tot= Integer.parseInt(request.getParameter("tot"));
		int useMig =0;
		
		//마일리지가 있는경우
		if(request.getParameter("useMig")!=null ||!(request.getParameter("useMig").equals(""))) {
			useMig =Integer.parseInt(request.getParameter("useMig"));
		}		
		
		//뷰단에서 보여줄 정보를 객체로 담음
		result.setPenName(request.getParameter("penName"));
		result.setPenAddr2(request.getParameter("penAddr2"));
		result.setRomName(request.getParameter("romName"));
		result.setResIndate(request.getParameter("in"));
		result.setResOutdate(request.getParameter("out"));
		result.setResTot(request.getParameter("tot"));
		result.setPenId(request.getParameter("penId"));
		result.setPenIntro(request.getParameter("PenIntro"));
		result.setPenNoti(request.getParameter("penNoti"));
		result.setRomPeople(request.getParameter("romPersons"));

		//예약할 때 보낼 정보를 객체에 담음
		Reservation res =new Reservation();
		res.setMemId(session.getAttribute("memId").toString());
		res.setRomId(request.getParameter("romId"));
		res.setResIndate(request.getParameter("in"));
		res.setResOutdate(request.getParameter("out"));
		res.setResTot(request.getParameter("tot"));

		//예약 추가
		int r =reservationResult.insertRes(res);
	
		ModelAndView model = new ModelAndView();
		
		if(r !=0 )//예약에 성공했을 경우
		{	
			if(useMig!=0) {//사용하는 마일리지가 있는경우
				reservationResult.updateMig(memId,useMig);//사용한 마일리지를 차감
				reservationResult.addMig(memId,tot);//해당금액에 대한 마일리지 추가
			}
			else//사용하는 마일리지가 없는경우
			{
				reservationResult.addMig(memId,tot);//해당금액에 대한 마일리지 추가
			}
			model.setViewName("member/reservationResult");
			model.addObject("reservationDetail", result);
		}else {	//예약에 실패한 경우	
			model.setViewName("member/reservationResultFail");
			model.addObject("reservationDetail", result);
		}
		return model;
	}

}