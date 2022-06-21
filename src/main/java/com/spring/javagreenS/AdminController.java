package com.spring.javagreenS;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.javagreenS.service.AdminService;
import com.spring.javagreenS.vo.AdminVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adService;
	
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String loginGet() {
		
		return "admin/login";
	}
	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String logoutGet(HttpSession session) {
		session.invalidate();
		
		return "redirect:/msg/adminLogout";
	}
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String loginPost(AdminVO vo,HttpSession session) {
		AdminVO advo = adService.getAdminKey(vo.getMid());
		
        int setKey = Integer.parseInt(advo.getAdKey());
        
        String getKey = adService.getKey(setKey);
        
        long testkey;
        String strKey = "";
        for(int i=0; i<getKey.length(); i++) {
        	testkey = getKey.charAt(i);
            strKey += testkey;
        }
        
        testkey = Long.parseLong(strKey);
        
        String pwd = vo.getPwd().toUpperCase();
        
        long testPwd;
        String strPwd = "";
        for(int i=0; i<pwd.length(); i++) {
        	testPwd = pwd.charAt(i);
            strPwd += testPwd;
        }
        
        long encPwd;
        
        testPwd = Long.parseLong(strPwd);
        
        encPwd = testPwd ^ testkey;
        
        strPwd = String.valueOf(encPwd);
        
        if(advo.getPwd().equals(strPwd)) {
            session.setAttribute("sMid", advo.getMid());
            return "redirect:/msg/adminLoginOk";
        }
        else {
            return "redirect:/msg/adminLoginNo";
        }
	}
	@RequestMapping(value = "/join",method = RequestMethod.GET)
	public String joinGet() {
		return "admin/join";
	}
	@RequestMapping(value = "/join",method = RequestMethod.POST)
	public String joinPost(AdminVO vo) {
		int setKey = (int)(Math.random()*50)+1;
		String getKey = adService.getKey(setKey);
	        
        long testKey;
        String strKey = "";
        for(int i=0; i<getKey.length(); i++) {
        	testKey = getKey.charAt(i);
            strKey += testKey;
        }
        testKey = Long.parseLong(strKey);
        
        String pwd = vo.getPwd().toUpperCase();
        
        long testPwd;
        String strPwd = "";
        for(int i=0; i<pwd.length(); i++) {
        	testPwd = pwd.charAt(i);
            strPwd += testPwd;
        }
        long encPwd;
        
        testPwd = Long.parseLong(strPwd);
        
        encPwd = testPwd ^ testKey;
        
        strPwd = String.valueOf(encPwd);
	    
        adService.setAdminInput(vo,strPwd,setKey);
        
		return "redirect:/msg/adminInputOk";
	}
}
