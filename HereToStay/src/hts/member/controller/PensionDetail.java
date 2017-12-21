package hts.member.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hts.member.dao.PensionPageDetailDao;
import hts.member.dao.PensionPageSearchDao;
import hts.model.vo.member.Pension;
import hts.model.vo.member.Review;
import hts.model.vo.member.Room;
import hts.model.vo.member.SearchOpt;
import hts.mongo.services.MongoService;
import hts.mongo.vo.MongoVO;

@Controller
@RequestMapping("/member")
public class PensionDetail {
	@Autowired
	private  PensionPageDetailDao pensionPageDetailDao;
	
	@Autowired
	private MongoService mongoService; 
	
	@RequestMapping("/pensionDetail.do")
	public ModelAndView pensionDetail(HttpServletRequest req,HttpSession session) {
		
		String memId = (String)session.getAttribute("memId");
		SearchOpt opt =(SearchOpt) session.getAttribute("search");
		String Id= req.getParameter("id");
		
		//펜션 정보가져오기	
		Pension pension=pensionPageDetailDao.getPension(Id);
		
		//룸 리스트의 정보가져오기	
		List<Room> rooms=pensionPageDetailDao.getRooms(Id,opt);
		
		//리뷰리스트의 정보가져오기
		List<Review> reviews =pensionPageDetailDao.getReview(Id);
			
		//추천 펜션 정보 가져오기
		List<Pension> recoPension =pensionPageDetailDao.getRecoPension(Id,opt);
	
		//추천하는 펜션 사진 가져오기
		ArrayList<List<MongoVO>> plistrecoPhotoList =mongoService.findMongoPList(recoPension);
		
		//추천하는 펜션들의 정보에 사진 넣기
		for(int i=0;i<recoPension.size();i++)
		{recoPension.get(i).setPhothList((ArrayList)plistrecoPhotoList.get(i));}
		
		//추천하는 펜션들을 랜덤으로 보여주기 위한 설정
		List<Pension> recoRandom= new ArrayList<Pension>();
		Random random=new Random();
		for(int i=0;i<3;i++)
		{
			int ran=random.nextInt(recoPension.size());
			recoRandom.add(recoPension.get(ran));
		}		
		
		// 펜션 사진가져오기
		List<MongoVO> plist = mongoService.findMongo(Id);

		//펜션에 사진 설정
		for(int j=0;j<plist.size();j++)
		{
			pension.setPhothList(plist);				
		}			
		
		//객실 사진들 가져오기
		ArrayList<ArrayList<MongoVO>> rlist = mongoService.findMongoRList(rooms);
		
		//객실리스트 객체에 사진 설정
		for(int i=0;i<rooms.size();i++)
		{
			rooms.get(i).setPhotoList(rlist.get(i));			
		}		
		
		//모델설정
		ModelAndView model=new ModelAndView();
		model.addObject("Pension", pension);
		model.addObject("Rooms",rooms);
		model.addObject("Reviews",reviews);
		model.addObject("recoPension",recoRandom);
		
		return model;
	}

	/**
	 * room search (ajax) */
	
	@RequestMapping("pensionDetailRooms.do")
	public void roomSearch(HttpServletRequest request, HttpSession session,HttpServletResponse response)
	{
		
		String penId =request.getParameter("Id");
		String cIn =request.getParameter("cIn");
		String cOut=request.getParameter("cOut");
		String peo =request.getParameter("peo");

		List<Room> roomsAjax =pensionPageDetailDao.getRoomsAjax(penId,cIn,cOut,peo);


		String roomJson=new String();

		// 객실 사진 정보 가져오기
		ArrayList<ArrayList<MongoVO>> rlistAjax = mongoService.findMongoRList(roomsAjax);

		//객실객체에 사진 넣기
		for(int i=0;i<roomsAjax.size();i++)
		{
			roomsAjax.get(i).setPhotoList(rlistAjax.get(i));		
		}		
		
		//객실 객체에 담기위한 json 처리
		JSONObject job;
		
		//객실 객체들을 담기 위한 array
		JSONArray arr =new JSONArray();

		//사진 하나를 담을 객체
		JSONObject photo =new JSONObject();
		
		//사진 리스트를 담기위한 jsonArray
		JSONArray rPhotoArr =new JSONArray();
	
		JSONObject fPhoto =new JSONObject();
		JSONArray photoArr =new JSONArray();
		
		
		for(int i=0;i<roomsAjax.size();i++)
		{
			job=new JSONObject();
			job.put("romId",roomsAjax.get(i).getRomId());
			job.put("romName",roomsAjax.get(i).getRomName());
			job.put("romType",roomsAjax.get(i).getRomType());
			job.put("romPeople",roomsAjax.get(i).getRomPeople());
			job.put("romIntro",roomsAjax.get(i).getRomIntro());
			job.put("romOpt",roomsAjax.get(i).getRomOpt());
			job.put("romCost",roomsAjax.get(i).getRomCost());
			job.put("minPeople",roomsAjax.get(i).getMinPeople());
			photo =new JSONObject();
			photoArr=new JSONArray();
			fPhoto =new JSONObject();
			for(int j=0;j<roomsAjax.get(i).getPhotoList().size();j++)
			{

				photo.put("photo",roomsAjax.get(i).getPhotoList().get(j).getFullname());
				photoArr.add(photo);
				photo =new JSONObject();

			}	
			fPhoto.put("fPhto",photoArr);
			rPhotoArr.add(fPhoto);
			arr.add(job);
		}

		JSONObject out =new JSONObject();
		//객실 배열
		out.put("rooms", arr);
		//사진 배열
		out.put("phoList", rPhotoArr);

		out.toJSONString();
		
		//한글 처리
		response.setContentType("text/html;charset=UTF-8");

		try {
			response.getWriter().print(out);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
