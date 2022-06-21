package com.spring.javagreenS.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS.dao.ShopDAO;
import com.spring.javagreenS.vo.ShopVO;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Autowired
	ShopDAO Shopdao;

	@Override
	public ArrayList<ShopVO> getHead() {
		
		return Shopdao.getHead();
	}

	@Override
	public ArrayList<ShopVO> getProduct2(String product1) {
		
		return Shopdao.getProduct2(product1);
	}

	@Override
	public ArrayList<ShopVO> getProduct3(String product1,String product2) {
		return Shopdao.getProduct3(product1,product2);
	}

	@Override
	public ShopVO productCheck(String product) {
		return Shopdao.productCheck(product);
	}

	@Override
	public void setProduct(ShopVO vo) {
		Shopdao.setProduct(vo);
		
	}

	@Override
	public ShopVO searchPrd1(String product1) {
		return Shopdao.searchPrd1(product1);
	}

	@Override
	public ShopVO searchPrd2(String product1, String product2) {
		return Shopdao.searchPrd2(product1,product2);
	}

	@Override
	public ShopVO searchPrd3(String product1, String product2, String product3) {
		return Shopdao.searchPrd3(product1,product2,product3);
	}

	@Override
	public void inputProduct1(ShopVO vo) {
		Shopdao.inputProduct1(vo);
	}

	@Override
	public void inputProduct2(ShopVO vo) {
		Shopdao.inputProduct2(vo);
	}

	@Override
	public void inputProduct3(ShopVO vo) {
		Shopdao.inputProduct3(vo);
	}
}
