package com.spring.javagreenS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS.vo.ShopVO;

public interface ShopDAO {

	public ArrayList<ShopVO> getHead();

	public ArrayList<ShopVO> getProduct2(@Param("product1") String product1);

	public ArrayList<ShopVO> getProduct3(@Param("product1") String product1,@Param("product2") String product2);

	public ShopVO productCheck(@Param("product") String product);

	public void setProduct(@Param("vo") ShopVO vo);

	public ShopVO searchPrd1(@Param("product1") String product1);

	public ShopVO searchPrd2(@Param("product1") String product1,@Param("product2") String product2);

	public ShopVO searchPrd3(@Param("product1") String product1,@Param("product2") String product2,@Param("product3") String product3);

	public void inputProduct1(@Param("vo") ShopVO vo);

	public void inputProduct2(@Param("vo") ShopVO vo);

	public void inputProduct3(@Param("vo") ShopVO vo);
	
}
