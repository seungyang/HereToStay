package hts.member.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import hts.member.dao.ReservationDao;
import hts.model.vo.member.Member;
import hts.model.vo.member.Pension;
import hts.model.vo.member.Room;
import hts.model.vo.member.SearchOpt;
import hts.mongo.services.MongoService;
import hts.mongo.vo.MongoVO;


@Controller
@RequestMapping("/member")
public class ReservationPage {
	
	@Autowired
	private ReservationDao reserve;
	
	@Autowired
	MongoService mongoservice;	
	
	/**
	 * 예약페이지로 이동하는 함수
	 * */
	@RequestMapping("/reservation.do")
	public ModelAndView getInfo(HttpServletRequest request,HttpSession session) {
		String memId = (String)session.getAttribute("memId");
		
		//예약하는 펜션의 정보를 가져옴
		Pension pension =reserve.getPensionInfo(request.getParameter("penId"));
		
		//예약하는 객실의 정보를 가져옴
		Room room = reserve.getRoomInfo(request.getParameter("romId"));
		
		//예약하는 사용자의 정보를 가져옴
		Member member =reserve.getMember(memId);
		SearchOpt opt =(SearchOpt) session.getAttribute("search");
		opt.setCheckIn(request.getParameter("cIn"));
		opt.setCheckOut(request.getParameter("cOut"));
		opt.setPersons(request.getParameter("peo"));
		
		int days=0;
		if(opt!=null){};
		
		//예약 하는 날짜들의 차이를 구하기 위한 것
		if(opt.getCheckIn() !=null && opt.getCheckOut()!=null) {
			StringTokenizer str =new StringTokenizer(opt.getCheckIn(),"/");
			String mm =str.nextToken();
			String dd = str.nextToken();
			String yy =str.nextToken().substring(0,4);			
			Calendar in= Calendar.getInstance();
			in.set(Calendar.YEAR,Integer.parseInt(yy));
			in.set(Calendar.MONTH,Integer.parseInt(mm)-1);
			in.set(Calendar.DATE,Integer.parseInt(dd));
			
			StringTokenizer str2 =new StringTokenizer(opt.getCheckOut(),"/");
			String mm2 =str2.nextToken();
			if(mm2.substring(0,1).equals("0"))
				mm2=mm2.substring(1);
			String dd2 = str2.nextToken();
			if(dd2.substring(0,1).equals("0"))
				dd2=dd2.substring(1);
			String yy2 =str2.nextToken().substring(0,4);	
			
			Calendar out= Calendar.getInstance();
			out.set(Integer.parseInt(yy2),Integer.parseInt(mm2)-1,Integer.parseInt(dd2));
		
			// MilliSecond 로 변환 
			long d1 = in.getTime().getTime(); 
			long d2 = out.getTime().getTime(); 

			// 계산 
			days =(int)((d2-d1)/(1000*60*60*24)); 

		}		
		
		//펜션의 사진을 가져옴
		List<MongoVO> pic =mongoservice.findMongo(pension.getPenId());
		
		//펜션 객체에 사진을 담음
		pension.setPhothList(pic);
	
		int roomCost =Integer.parseInt(request.getParameter("romCost"));	
		
		//모델
		ModelAndView model = new ModelAndView();
		model.setViewName("member/reservation");
		model.addObject("Pension",pension);	
		model.addObject("Room",room);
		model.addObject("romCost",roomCost);
		model.addObject("days",days);
		model.addObject("Member",member);
		return model;
	}

}