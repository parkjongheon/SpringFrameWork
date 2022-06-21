package com.spring.javagreenS.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS.vo.AdminVO;

public interface AdminDAO {

	public String getKey(@Param("setKey") int setKey);

	public void setAdminInput(@Param("vo")AdminVO vo,@Param("strPwd") String strPwd,@Param("setKey") int setKey);

	public AdminVO getAdminKey(@Param("mid") String mid);

}
