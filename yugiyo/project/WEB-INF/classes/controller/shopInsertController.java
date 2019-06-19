package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.model.Shop;
import shop.service.ShopService;
import util.HttpUtil;

public class shopInsertController implements Controller{

	public void execute(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException {
		
		String ShopId = req.getParameter("ShopId");
		String type = req.getParameter("type");
		String name = req.getParameter("name");
		int reqprice = Integer.parseInt(req.getParameter("reqprice"));
		String payment = req.getParameter("payment");
		String info = req.getParameter("info");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String availTime = req.getParameter("availTime");
		int reputation =Integer.parseInt(req.getParameter("reputation"));
		
		Shop shop = new Shop();
		shop.setShopId(ShopId);
		shop.setType(type);
		shop.setName(name);
		shop.setReqprice(reqprice);
		shop.setPayment(payment);
		shop.setInfo(info);
		shop.setTel(tel);
		shop.setAddress(address);
		shop.setAvailTime(availTime);
		shop.setReputation(reputation);
		
		ShopService service = ShopService.getInstance();
		service.ShopInsert(shop);
		
		req.setAttribute("ShopId", ShopId);
		
		HttpUtil.forward(req, resp, "addmboard.jsp");
		
	}
	
}
