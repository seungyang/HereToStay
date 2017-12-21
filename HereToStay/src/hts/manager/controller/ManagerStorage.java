package hts.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hts.manager.dao.ManagerStorageDAO;
import hts.model.vo.manager.Strorage;
import hts.mongo.services.MongoService;

@Controller
@RequestMapping("/manager")
public class ManagerStorage {
	
	@Autowired
	private ManagerStorageDAO managerStorageDAO;
	
	@Autowired
	private MongoService mongoService;
	
	@RequestMapping("/pensionList2.do") //재고 리스트
	public ModelAndView storageUpdate(Strorage sto) {
//		int result = managerStorageDAO.storageUpdate(sto);
		
		String penId=sto.getPenId();
		String bath = "20";
		String charcoal = "20";
		
		
		int result=mongoService.stoUpdate(penId,bath,charcoal);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manager/pensionList"); 
		mv.addObject("result",result);
		return mv;
	}
	
	@RequestMapping("/bathUpdate.do") //목욕세트 갯수 업데이트
	public ModelAndView bathUpdate(Strorage sto) {

		String penId=sto.getPenId();
		int bath = sto.getStoBath();
		String charcoal = String.valueOf(sto.getStoTnc());
		String imsi = String.valueOf(sto.getStoImsi()+bath);		
		
		int result=mongoService.stoUpdate(penId,imsi,charcoal);
//		int result = managerStorageDAO.bathUpdate(sto);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manager/storageDetail");
		mv.addObject("result",result);
		return mv;
	}
	
	@RequestMapping("/tncUpdate.do") //숯 갯수 업데이트
	public ModelAndView tncUpdate(Strorage sto) {
		String penId=sto.getPenId();
		String bath = String.valueOf(sto.getStoBath());
		int charcoal = sto.getStoTnc();
		String imsi = String.valueOf(sto.getStoImsi()+charcoal);
		
		int result=mongoService.stoUpdate(penId,bath,imsi);
//		int result = managerStorageDAO.tncUpdate(sto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manager/storageDetail");
		mv.addObject("result",result);
		return mv;
	}
	
}
