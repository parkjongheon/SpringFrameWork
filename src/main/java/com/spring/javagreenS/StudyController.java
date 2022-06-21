package com.spring.javagreenS;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javagreenS.common.ARIAUtil;
import com.spring.javagreenS.service.StudyService;
import com.spring.javagreenS.vo.MailVO;
import com.spring.javagreenS.vo.OperatorVO;

@Controller
@RequestMapping("/study")
public class StudyController {
	
	
	
	@Autowired
	StudyService studyService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	JavaMailSender mailSender;
	
	@RequestMapping(value="/password/passCheck1",method = RequestMethod.GET)
	public String passCheck1Get() {
		
		return "study/password/passCheck1";
	}
	
	@RequestMapping(value="/password/passCheck1",method = RequestMethod.POST)
	public String passCheck1Post(@RequestParam(name = "pwd",defaultValue = "",required = false) long pwd,
			Model model) {
		// 암호화를 위한 키 : 0x1234ABCD
		long encPwd, decPwd;
		long key = 0x1234ABCD;
		
		encPwd = pwd ^ key; // 암호화 : db에 저장시켜준다.
		
		decPwd = encPwd ^ key; // 복호화 
		
		model.addAttribute("encPwd",encPwd);
		model.addAttribute("decPwd",decPwd);
		model.addAttribute("pwd",pwd);
		
		return "study/password/passCheck1";
	}
	@RequestMapping(value="/password/passCheck2",method = RequestMethod.POST)
	public String passCheck2Post(@RequestParam(name = "pwd",defaultValue = "",required = false) String pwd,
			Model model) {
		// 입력문자가 영문 소문자일 경우는 대문자로 변경처리(연산시 자리수때문에)
		pwd = pwd.toUpperCase();
		// 입력된 비밀번호를 아스키코드로 변환하여 누적처리 
		long intPwd;
		String strPwd = "";
		for(int i=0; i<pwd.length(); i++) {
			intPwd = (long) pwd.charAt(i);
			strPwd += intPwd;
		}
		//문자로 결합된 숫자를, 연산하기위해 다시 숫자로 변환한다.
		intPwd = Long.parseLong(strPwd);
		
		// 암호화를 위한 키 : 0x1234ABCD
		long key = 0x1234ABCD;
		long encPwd, decPwd;
		
		// 암호화를 위한 EOR 연산하기
		encPwd = intPwd ^ key;
		// 암호화 : db에 저장시켜준다.
		strPwd = String.valueOf(encPwd);
		
		intPwd = Long.parseLong(strPwd);
		// 복호화 작업처리
		decPwd = intPwd ^ key; 
		strPwd = String.valueOf(decPwd);
		model.addAttribute("encPwd",strPwd);
		// 복호화된 문자형식의 아스키코드값은 2개씩분류하여 실제문자로 변환해준다.
		String result = "";
		char ch;
		
		for(int i = 0; i<strPwd.length(); i+=2) {
			ch = (char) Integer.parseInt(strPwd.substring(i,i+2));
			result += ch;
		}
		model.addAttribute("decPwd",result);
		model.addAttribute("pwd",pwd);
		
		return "study/password/passCheck1";
	}
	@RequestMapping(value="/password2/operatorMenu", method = RequestMethod.GET)
	public String operatorMenuGet() {
		return "study/password2/operatorMenu";
	}
	@RequestMapping(value="/password2/operatorList", method = RequestMethod.GET)
	public String operatorListGet(Model model,OperatorVO vo) {
		ArrayList<OperatorVO> vos =  studyService.getOperatorList();
		
		model.addAttribute("vos",vos);
		
		return "study/password2/operatorList";
	}
	
	
	@RequestMapping(value = "/password2/operatorInputOk", method = RequestMethod.POST)
	public String operatorInputOkPost(OperatorVO vo) {
		// 아이디 중복체크
		OperatorVO opvo = studyService.getOperator(vo.getOid());
		if(opvo != null) return "redirect:/msg/operatorCheckNo";
		
		// 아이디가 중복되지 않았으면 비밀번호를 암호화 하여 저장시켜준다. service객체에서 처리
		studyService.setOperatorInputOk(vo);
		return "redirect:/msg/operatorInputOk";
	}
	
	@ResponseBody
	@RequestMapping(value = "/password2/operatorDelete", method = RequestMethod.POST)
	public String operatorDeleteOkPost(String oid) {
		studyService.setOperatorDelete(oid);
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value = "/password2/operatorSearch", method = RequestMethod.POST)
	public String operatorSearchPost(OperatorVO vo) {
		String res =  studyService.setOperatorSearch(vo);
		
		return res;
	}
	
	@RequestMapping(value = "/ajax/ajaxMenu" ,method = RequestMethod.GET)
	public String ajaxMenuGet() {
		return "study/ajax/ajaxMenu";
	}
	
	@RequestMapping(value = "/ajax/ajaxTest1" ,method = RequestMethod.GET)
	public String ajaxTest1Get() {
		return "study/ajax/ajaxTest1";
	}
	@RequestMapping(value = "/ajax/ajaxTest2" ,method = RequestMethod.GET)
	public String ajaxTest2Get() {
		return "study/ajax/ajaxTest2";
	}
	@RequestMapping(value = "/ajax/ajaxTest3" ,method = RequestMethod.GET)
	public String ajaxTest3Get() {
		return "study/ajax/ajaxTest3";
	}
	@RequestMapping(value = "/ajax/ajaxTest4" ,method = RequestMethod.GET)
	public String ajaxTest4Get() {
		return "study/ajax/ajaxTest4";
	}
	
	//배열을 이용한 값의 전달
	@ResponseBody
	@RequestMapping(value = "/ajax/ajaxTest1" ,method = RequestMethod.POST)
	public String[] ajaxTest1Post(String dodo) {
		
//		String[] strArr = new String[100];
//		strArr = studyService.getCityStringArr(dodo);
		
		return studyService.getCityStringArr(dodo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajax/ajaxTest2" ,method = RequestMethod.POST)
	public ArrayList<String> ajaxTest2Post(String dodo) {
		ArrayList<String> vos = new ArrayList<String>();
		
		vos = studyService.getCityArrayListStr(dodo);
		return vos;
	}
	// HashMap 을 이용한 값의 전달(배열, ArrayList에 담아온값을 다시 map에 담아서 넘길수 있다.)
	@ResponseBody
	@RequestMapping(value = "/ajax/ajaxTest3" ,method = RequestMethod.POST)
	public HashMap<Object, Object> ajaxTest3Post(String dodo) {
		ArrayList<String> vos = new ArrayList<String>();
		vos = studyService.getCityArrayListStr(dodo);
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("city", vos);
		
		return map;
	}
	// vo객체를 이용한 값의 전달(배열, ArrayList에 담아온값을 다시 map에 담아서 넘길수 있다.)
	@ResponseBody
	@RequestMapping(value = "/ajax/ajaxTest4" ,method = RequestMethod.POST)
	public OperatorVO ajaxTest4Post(String oid) {
		
		return studyService.getOperator(oid);
	}
	
	// vo객체를 이용한 값의 전달(배열, ArrayList에 담아온값을 다시 map에 담아서 넘길수 있다.)
	@ResponseBody
	@RequestMapping(value = "/ajax/ajaxTest5" ,method = RequestMethod.POST)
	public ArrayList<OperatorVO> ajaxTest5Post(String oid) {
		
		return studyService.getOperatorVos(oid);
	}
	
	@RequestMapping(value="/password3/aria",method = RequestMethod.GET)
	public String ariaGet() {
		
		return "study/password3/aria";
	}
	@RequestMapping(value="/password3/securityCheck",method = RequestMethod.GET)
	public String securityCheckGet() {
		
		return "study/password3/security";
	}
	
	@ResponseBody
	@RequestMapping(value="/password3/aria",method = RequestMethod.POST)
	public String ariaPost(String pwd) {
		String encPwd = "";
		String decPwd = "";
		
		try {
			encPwd = ARIAUtil.ariaEncrypt(pwd);
			decPwd = ARIAUtil.ariaDecrypt(encPwd);
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		pwd = "encoding : "+encPwd + "/ decoding:" +decPwd;
		return pwd;
	}
	@ResponseBody
	@RequestMapping(value="/password3/securityCheck",method = RequestMethod.POST)
	public String securityCheckPost(String pwd) {
		String encPwd = "";
		encPwd = passwordEncoder.encode(pwd);
		
		
		pwd = "encoding : "+encPwd + "/ Source Password:" +pwd;
		return pwd;
	}
	
	//메일폼 호출
	@RequestMapping(value = "/mail/mailForm", method = RequestMethod.GET)
	public String mailFormGet() {
		
		return "study/mail/mailForm";
	}
	//메일 전송
	@RequestMapping(value = "/mail/mailForm", method = RequestMethod.POST)
	public String mailFormPost(MailVO vo) {
		try {
			String toMail = vo.getToMail();
			String title = vo.getTitle();
			String content = vo.getContent();
			
			// 메세지를 변환시켜서 보관함에 저장하여 준비한다.
			MimeMessage message =  mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true , "UTF-8");
			
			// 메일보관함에 회원이 보내오는 베세지를 모두저장시켜둥다
			messageHelper.setTo(toMail);
			
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			//메세지 보관함의 내용을 편집해서 다시 보관함에 담아둔다.
			content = content.replace("\n", "<br>");
			
			content += "<br><hr><h3>박종헌이보냅니다.</h3></hr/><br>";
			
			content += "<p><img src=\"cid:m12.jpg\"></p><br/>";
			
			content += "<p>방문하기 : <a href='http://';></a></p>";
			content += "<hr/>";
			
			FileSystemResource file = new FileSystemResource("C:\\JavaGreen\\SpringFrameWork\\works\\javagreenS\\src\\main\\webapp\\resources\\images\\m12.jpg");
			messageHelper.setText(content, true);
			messageHelper.addInline("m12.jpg", file);
			
			//본문에 기재된 그림파일의 경로를 따로 표시시켜준다.
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/msg/mailSendOk";
	}
	
	
	@RequestMapping(value = "/uuid/uuidForm" ,method = RequestMethod.GET)
	public String uuidFormGet() {
		return "study/uuid/uuidForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/uuid/uuidProcess" ,method = RequestMethod.POST)
	public String uuidProcessPost() {
		UUID uid = UUID.randomUUID();
		
		return uid.toString();
	}
	
	@RequestMapping(value = "/fileUpload/fileUpload" ,method = RequestMethod.GET)
	public String fileUploadGet() {
		return "study/fileUpload/fileUpload";
	}
	@RequestMapping(value = "/fileUpload/fileUpload" ,method = RequestMethod.POST)
	public String fileUploadPost(MultipartFile fName) {
		int res = studyService.fileUpload(fName);
		if(res == 1) {
			return "redirect:/msg/fileUploadOk";
		}
		else {
			return "redirect:/msg/fileUploadNo";			
		}
	}
	
	
}
