package hts.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hts.member.dao.IndexDao;
import hts.model.vo.member.Pension;
import hts.model.vo.member.Room;
import hts.model.vo.member.SearchOpt;
import hts.mongo.services.MongoService;
import hts.mongo.vo.MongoVO;

@Controller
@RequestMapping("/member")
public class Index_member {
	
	@Autowired
	private IndexDao indexDao;
	
	@Autowired 
	private MongoService mongoService;
	
	// WEB-INF 파일 index.jsp 이동 컨트롤러
	@RequestMapping("/index_member.do")
	public ModelAndView startHTS(HttpSession sess,HttpServletRequest request) {
		
		List<Pension> pension = indexDao.getPopularPension();
		for (int i = 0; i < pension.size(); i++) {
			pension.get(i).setMinCost(indexDao.getMinCost(pension.get(i).getPenId()));
		}
		ArrayList<List<MongoVO>> plist = mongoService.findMongoPList(pension);
		
		SearchOpt searchOpt =saveSession(request);
		// 검색 세션 설정
		HttpSession se =request.getSession();
		
		
		//세션에 저장 (불러온값 ) 		
		se.setAttribute("search",searchOpt);//세션저장
		
		for(int i=0;i<pension.size();i++)
		{		
			pension.get(i).setPhothList((ArrayList)plist.get(i));
		
		}
		
		List<Room> minPension = indexDao.getMinPension();
		
		ArrayList<ArrayList<MongoVO>> rlist = mongoService.findMongoRList(minPension);
		
		for(int i=0;i<minPension.size();i++)
		{
			minPension.get(i).setPhotoList(rlist.get(i));				
		
		}				
		
		ModelAndView model = new ModelAndView();
		model.setViewName("member/index_member");
		model.addObject("popular", pension);
		model.addObject("minCostRoom", minPension);
		
		return model;
	}
	@RequestMapping("/index_memberLogout.do")
	public void logout(HttpSession sess,HttpServletRequest request,HttpServletResponse response) {
		 sess.invalidate();
		
		try {
			response.sendRedirect("/member/index_member.do");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public SearchOpt saveSession(HttpServletRequest request) {
		
		SearchOpt opt =new SearchOpt();
		 
	    String priceSort = request.getParameter("sort");
	    if(priceSort!=null) 
	    	System.out.println(priceSort+ " sort ");
	    
	    // 정렬
	    opt.setSort(priceSort);
	    
		opt.setCheckIn(request.getParameter("in"));		
		opt.setCheckOut(request.getParameter("out"));
		if(request.getParameter("sel")!=null)
		{
		opt.setPersons(request.getParameter("sel"));		
		}else
		{
		opt.setPersons("2");
		}		
		opt.setPriceFrom(request.getParameter("ammount-from"));
		opt.setPriceTo(request.getParameter("ammount-to"));
		opt.setSearchName(request.getParameter("place"));//이름검색
		opt.setPenOpt(request.getParameterValues("penOpt"));	
		opt.setRoomOpt(request.getParameterValues("romOpt"));
		

		if(opt.getSearchName()!=null) System.out.println("search "+ opt.getSearchName());
		if(opt.getCheckIn()!=null) System.out.println("checkIn "+opt.getCheckIn());
		else {
			Calendar today =Calendar.getInstance();
			String month=String.valueOf(today.get(Calendar.MONTH)+1);
			if(month.length()==1)
				month ="0"+month;
			String date =String.valueOf(today.get(Calendar.DATE));
			if(date.length()==1)
				date="0"+date;
			String year = String.valueOf(today.get(Calendar.YEAR));
			opt.setCheckIn(month+"/"+date+"/"+year);		
			System.out.println(opt.getCheckIn());
		}
		if(opt.getCheckOut()!=null) System.out.println("checkOut"+opt.getCheckOut());
		else {
			Calendar today =Calendar.getInstance();
			today.add(Calendar.DATE,1);
			String month=String.valueOf(today.get(Calendar.MONTH)+1);
			if(month.length()==1)
				month ="0"+month;
			String date =String.valueOf(today.get(Calendar.DATE));
			if(date.length()==1)
				date="0"+date;
			String year = String.valueOf(today.get(Calendar.YEAR));
			opt.setCheckOut(month+"/"+date+"/"+year);		
			System.out.println(opt.getCheckOut());
		}
	
		
		return opt;
		
	}
}