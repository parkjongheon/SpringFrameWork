package com.spring.javagreenS.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javagreenS.common.ProjectSupport;
import com.spring.javagreenS.dao.MemberDAO;
import com.spring.javagreenS.vo.MemberVO;

@Service
public class MemerServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDAO;

	@Override
	public MemberVO getMemIdCheck(String mid) {
		
		return memberDAO.getMemIdCheck(mid);
	}

	@Override
	public MemberVO getNickNameCheck(String nickName) {
		return memberDAO.getNickNameCheck(nickName);
	}

	@Override
	public int setMemInput(MultipartFile fName, MemberVO vo) {
		int res = 0;
		try {
			String oFileName = fName.getOriginalFilename();
			if(oFileName.equals("")) {
				vo.setPhoto("noimage.jsp");
			}
			else {
				UUID uid = UUID.randomUUID();
				String saveFileName = uid+"_"+oFileName;
				
				ProjectSupport ps = new ProjectSupport();
				ps.writeFile(fName , saveFileName ,"member");		
				vo.setPhoto(saveFileName);
			}
			memberDAO.setMemInput(vo);
			res = 1;
		} catch (IOException e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public void setMemberVisitProcess(MemberVO vo) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(today);
		
		// 세션에 저장된 최종 방문일 편집
		
		String lastDate = vo.getLastDate().substring(0,10);
		// 최종방문일과 오늘날짜가 다르다면, todayCnt를 0으로 셋팅
		// 방문 포인트는 1일 5회까지만 증가
		int todayCnt = vo.getTodayCnt();
		int point = 0;
		System.out.println(todayCnt);
		if(strToday.equals(lastDate)) {
			if(todayCnt >= 5) point = 0;
			else point = 10;
			todayCnt++;
		}
		else {
			todayCnt = 1;
			point = 10;
		}
		
		memberDAO.setMemberVisitProcess(vo.getMid(),todayCnt,point);
		
	}
}
