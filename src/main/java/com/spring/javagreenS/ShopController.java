package com.spring.javagreenS;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javagreenS.service.ShopService;
import com.spring.javagreenS.vo.ShopVO;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	ShopService shopService;
	
	@RequestMapping(value = "/input/productMenu",method = RequestMethod.GET)
	public String inputProduct1MenuGet(Model model) {
		ArrayList<ShopVO> vos = shopService.getHead();
		
		model.addAttribute("vos",vos);
		return "shop/input/productMenu";
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchProduct2",method = RequestMethod.POST)
	public ArrayList<ShopVO> inputProduct2MenuPost(Model model,String product1) {
		ArrayList<ShopVO> vos = shopService.getProduct2(product1);
		
		return vos;
	}
	@ResponseBody
	@RequestMapping(value = "/searchProduct3",method = RequestMethod.POST)
	public ArrayList<ShopVO> inputProduct3MenuPost(Model model,String product1,String product2) {
		
		ArrayList<ShopVO> vos = shopService.getProduct3(product1,product2);
		
		return vos;
	}
	

	@ResponseBody
	@RequestMapping(value = "/productCheck",method = RequestMethod.POST)
	public String productCheckPost(String product) {
		String data = "";
		System.out.println(product);
		ShopVO vo = shopService.productCheck(product);
		System.out.println(vo);
		if(vo == null) {
			data = "1";
		}
		else {
			data = "0";
		}
		System.out.println(data);
		return data;
		
	}
	
	@RequestMapping(value = "/input/productMenu",method = RequestMethod.POST)
	public String setProductPost(Model model,ShopVO vo) {
		shopService.setProduct(vo);
		
		return "redirect:/msg/setProductOk";
	}
	
	@RequestMapping(value = "/input/goodsMenu",method = RequestMethod.GET)
	public String goodsMenuGet(Model model) {
		ArrayList<ShopVO> vos = shopService.getHead();
		model.addAttribute("vos", vos);
		return "shop/input/goodsMenu";
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchPrd1",method = RequestMethod.POST)
	public String searchPrd1Post(String product1) {
		ShopVO vo =  shopService.searchPrd1(product1);
		System.out.println(vo);
		if(vo == null) {
			return "1";			
		}
		else {			
			return "0";			
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchPrd2",method = RequestMethod.POST)
	public String searchPrd2Post(String product1,String product2) {
		ShopVO vo =  shopService.searchPrd2(product1,product2);
		System.out.println(vo);
		if(vo == null) {
			return "1";			
		}
		else {			
			return "0";			
		}
		
	}
	@ResponseBody
	@RequestMapping(value = "/searchPrd3",method = RequestMethod.POST)
	public String searchPrd2Post(String product1,String product2, String product3) {
		ShopVO vo =  shopService.searchPrd3(product1,product2,product3);
		System.out.println(vo);
		if(vo == null) {
			return "1";			
		}
		else {			
			return "0";			
		}
		
	}
	
	@RequestMapping(value = "/product1Form",method = RequestMethod.POST)
	public String inputProduct1Post(ShopVO vo) {
		shopService.inputProduct1(vo);	
		return "redirect:/msg/inputProduct1Ok";	
	}
	@RequestMapping(value = "/product2Form",method = RequestMethod.POST)
	public String inputProduct2Post(ShopVO vo) {
		shopService.inputProduct2(vo);	
		return "redirect:/msg/inputProduct2Ok";	
	}
	@RequestMapping(value = "/product3Form",method = RequestMethod.POST)
	public String inputProduct3Post(ShopVO vo) {
		shopService.inputProduct3(vo);	
		return "redirect:/msg/inputProduct1Ok";	
	}
}
