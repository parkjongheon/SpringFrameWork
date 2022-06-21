package com.spring.javagreenS.service;

import java.util.ArrayList;

import com.spring.javagreenS.vo.ShopVO;

public interface ShopService {

	public ArrayList<ShopVO> getHead();

	public ArrayList<ShopVO> getProduct2(String product1);


	public ArrayList<ShopVO> getProduct3(String product1,String product2);

	public ShopVO productCheck(String product);

	public void setProduct(ShopVO vo);

	public ShopVO searchPrd1(String product1);

	public ShopVO searchPrd2(String product1, String product2);

	public ShopVO searchPrd3(String product1, String product2, String product3);

	public void inputProduct1(ShopVO vo);

	public void inputProduct2(ShopVO vo);

	public void inputProduct3(ShopVO vo);
	
}
