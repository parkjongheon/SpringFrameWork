package com.spring.javagreenS.service;

import com.spring.javagreenS.vo.AdminVO;

public interface AdminService {

	public String getKey(int setKey);

	public void setAdminInput(AdminVO vo, String strPwd, int setKey);

	public AdminVO getAdminKey(String mid);

}
