package com.spring.javagreenS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS.dao.AdminDAO;
import com.spring.javagreenS.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDAO admindao;
	
	@Override
	public String getKey(int setKey) {
		return admindao.getKey(setKey);
	}

	@Override
	public void setAdminInput(AdminVO vo, String strPwd, int setKey) {
		admindao.setAdminInput(vo,strPwd,setKey);
		
	}

	@Override
	public AdminVO getAdminKey(String mid) {
		return admindao.getAdminKey(mid);
	}

}
