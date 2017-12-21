package hts.member.controller;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hts.member.dao.PensionPageSearchDao;
import hts.model.vo.member.Pension;
import hts.model.vo.member.SearchOpt;
import hts.mongo.services.MongoService;
import hts.mongo.vo.MongoVO;


@Controller
@RequestMapping("/member")
public class PensionPageSearch {

	@Autowired
	private  PensionPageSearchDao pensionSearch;
	
	@Autowired 
	private MongoService mongoService;
	
	@RequestMapping("/pensionSearch.do")
	public ModelAndView pensionSearch(HttpServletRequest request) {
			
	    String opt =request.getParameter("opt"); 
	   
		int page =Integer.parseInt(request.getParameter("page"));
	
		int first = (page-1)*6+1;//페이징
		int Last =first+5;
			
		ModelAndView model = new ModelAndView();		
		List<Pension> pl=new ArrayList<Pension>();		
		SearchOpt searchOpt =saveSession(request);
		
		// 검색 세션 설정
		HttpSession session =request.getSession();
		
		//세션에 저장 (불러온값 ) 		
		session.setAttribute("search",searchOpt);//세션저장

		if(request.getParameter("sel")!=null) searchOpt.setPersons(request.getParameter("sel"));
		else searchOpt.setPersons("2");//기본적으로 사람인원은 2로 설정				
		
		//펜션 리스트 불러오기
		pl=pensionSearch.getList(first,Last,searchOpt);
		
		//검색된 펜션 리스트의 사진 가져오기 (mongoDB)
		ArrayList<List<MongoVO>> plist = mongoService.findMongoPList(pl);
		
		//가져온 사진을 검색된 펜션 리스트들에 적용
		for(int i=0;i<pl.size();i++)
		{
			pl.get(i).setPhothList((ArrayList)plist.get(i));			
		}		
		
		//검색된 펜션들을 페이징 처리하기위해 검색된 전체 펜션의 갯수를 가져옴  	
		int totalPage =pensionSearch.getTotal(searchOpt);			
		
		//모델 설정
		model = new ModelAndView();
		model.addObject("currentPage",page);//현재페이지
		model.addObject("List",pl);//펜션 리스트
		model.addObject("result",totalPage);//전체 펜션갯수
		model.addObject("totalPage", (int) Math.ceil(totalPage/(double)6 ));//페이징 갯수
		return model;
	}
	
	/**
	 * 옵션으로 검색할때 저장해둘 옵션들을 세션에 저장하는 함수
	 * parameter HttpServletRequest request
	 * return SearchOpt 객체
	 * */
	public SearchOpt saveSession(HttpServletRequest request) {
		
		SearchOpt opt =new SearchOpt();
		 
	    String priceSort = request.getParameter("sort");
	    if(priceSort!=null) 
	    
	    // 정렬
	    opt.setSort(priceSort);
	    
		opt.setCheckIn(request.getParameter("in"));		
		opt.setCheckOut(request.getParameter("out"));
		if(request.getParameter("sel")!=null)
		{
		opt.setPersons(request.getParameter("sel"));		
		}else
		{
		opt.setPersons("1");
		}		
		opt.setPriceFrom(request.getParameter("ammount-from"));
		opt.setPriceTo(request.getParameter("ammount-to"));
		opt.setSearchName(request.getParameter("place"));//이름검색
		opt.setPenOpt(request.getParameterValues("penOpt"));	
		opt.setRoomOpt(request.getParameterValues("romOpt"));
		
		if(opt.getSearchName()!=null) {}
		if(opt.getCheckIn()!=null) {} //세션 형식으로 날짜를 바꾸어준다
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
		}
		if(opt.getCheckOut()!=null) {}
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
		}
		
		return opt;
		
	}
	
//	@RequestMapping("/pensionSearch.ajax")
//	public void pensionSearch2(HttpServletResponse response) {
//		
//	
//		String personJson = "{\"id\":\""+"ajax"+"\"}";
//		 try {
//			response.getWriter().print(personJson);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
	
	
}
