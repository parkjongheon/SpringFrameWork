package com.spring.javagreenS;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {
	
	@RequestMapping(value = "/msg/{msgFlag}", method = RequestMethod.GET)
	public String msgGet(@PathVariable String msgFlag,Model model,
			@RequestParam(value="name" , defaultValue = "" ,required = false) String name,
			@RequestParam(value="mid" , defaultValue = "" ,required = false) String mid,
			@RequestParam(value="idx" , defaultValue = "0" ,required = false) int idx
			) {
		//System.out.println("msgFlag : " + msgFlag);
		
		if(msgFlag.indexOf("$") != -1) {
			String[] msgArray = msgFlag.split("\\$");
			System.out.println(msgArray[0]);
			if(msgArray[0].equals("userUpdateOk")) {
				model.addAttribute("msg","유저 정보가 수정되었습니다.");
				model.addAttribute("url","user/userUpdate?"+msgArray[1]);
			}
		}
		else {
			if(msgFlag.equals("guestInputOk")) {
				model.addAttribute("msg","방명록에 글이 등록되었습니다.");
				model.addAttribute("url","guest/guestList");
			}
			else if(msgFlag.equals("adminInputOk")) {
				model.addAttribute("msg","관리자가 등록되었습니다.");
				model.addAttribute("url","admin/login");
			}
			else if(msgFlag.equals("adminLoginOk")) {
				model.addAttribute("msg","로그인되었습니다.");
				model.addAttribute("url","/");
			}
			else if(msgFlag.equals("adminLoginNo")) {
				model.addAttribute("msg","로그인실패");
				model.addAttribute("url","admin/login");
			}
			else if(msgFlag.equals("adminLogout")) {
				model.addAttribute("msg","(관리자)로그아웃하였습니다.");
				model.addAttribute("url","/");
			}
			else if(msgFlag.equals("operatorCheckNo")) {
				model.addAttribute("msg","중복되는 아이디입니다.");
				model.addAttribute("url","study/password2/operatorMenu");
			}
			else if(msgFlag.equals("operatorInputOk")) {
				model.addAttribute("msg","아이디가 등록되었습니다.");
				model.addAttribute("url","study/password2/operatorMenu");
			}
			else if(msgFlag.equals("setProductOk")) {
				model.addAttribute("msg","상품이 등록되었습니다.");
				model.addAttribute("url","shop/input/productMenu");
			}
			else if(msgFlag.equals("inputProduct1Ok")) {
				model.addAttribute("msg","대분류가 등록되었습니다.");
				model.addAttribute("url","shop/input/goodsMenu");
			}
			else if(msgFlag.equals("inputProduct2Ok")) {
				model.addAttribute("msg","중분류가 등록되었습니다.");
				model.addAttribute("url","shop/input/goodsMenu");
			}
			else if(msgFlag.equals("inputProduct3Ok")) {
				model.addAttribute("msg","소분류가 등록되었습니다.");
				model.addAttribute("url","shop/input/goodsMenu");
			}
			else if(msgFlag.equals("mailSendOk")) {
				model.addAttribute("msg","메일이 전송되었습니다");
				model.addAttribute("url","study/mail/mailForm");
			}
			else if(msgFlag.equals("memIdCheckNo")) {
				model.addAttribute("msg","아이디가 중복되었습니다.재입력해주세요");
				model.addAttribute("url","member/memJoin");
			}
			else if(msgFlag.equals("memNickCheckNo")) {
				model.addAttribute("msg","닉네임이 중복되었습니다.재입력해주세요");
				model.addAttribute("url","member/memJoin");
			}
			else if(msgFlag.equals("memInputOk")) {
				model.addAttribute("msg","회원가입 완료");
				model.addAttribute("url","member/memLogin");
			}
			else if(msgFlag.equals("memInputNo")) {
				model.addAttribute("msg","회원가입 실패");
				model.addAttribute("url","member/memJoin");
			}
			else if(msgFlag.equals("fileUploadOk")) {
				model.addAttribute("msg","파일이 업로드 되었습니다.");
				model.addAttribute("url","member/memJoin");
			}
			else if(msgFlag.equals("fileUploadNo")) {
				model.addAttribute("msg","파일이 업로드 실패");
				model.addAttribute("url","member/memJoin");
			}
			else if(msgFlag.equals("memLoginOk")) {
				model.addAttribute("msg", mid+"님 로그인 성공");
				model.addAttribute("url","member/memMain");
			}
			else if(msgFlag.equals("memLoginNo")) {
				model.addAttribute("msg","로그인 실패");
				model.addAttribute("url","member/memLogin");
			}
			else if(msgFlag.equals("memLogout")) {
				model.addAttribute("msg", mid+"님 로그아웃 되셨습니다.");
				model.addAttribute("url","member/memLogin");
			}
			
		}
		
		return "include/message";
	}
}
