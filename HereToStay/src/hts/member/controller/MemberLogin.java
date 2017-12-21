package hts.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import hts.member.dao.MemberLoginDao;

@Controller
@RequestMapping("/member")
public class MemberLogin {
	
	@Autowired
	MemberLoginDao memberLogin;
	
	@RequestMapping("/memCheck.do")
	@ResponseBody
	public void memCheck(String memId, String memPwd,HttpServletResponse response,HttpServletRequest request) {
		String resultData = new String();
		
		System.out.println(memId+ ","+ memPwd);
		if(memberLogin.memCheck(memId, memPwd) == 0) {
			resultData = "0";
			try {
				response.getWriter().print("0");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			resultData = "1";
			
			HttpSession session =request.getSession();
			session.setAttribute("memId", memId);
			
			try {
				response.getWriter().print("1");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
//		
//		return resultData;
	}
}