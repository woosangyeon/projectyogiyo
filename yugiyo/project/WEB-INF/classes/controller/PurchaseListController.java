package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customer.service.CustomerService;
import shop.dao.OrderListDAO;
import shop.service.OrderListService;
import util.HttpUtil;

public class PurchaseListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		HttpSession session = req.getSession();
		
		String CustomerId= (String) session.getAttribute("id");
		 
		OrderListDAO dao = OrderListDAO.getInstance();
		OrderListService service = OrderListService.getInstance();

		CustomerService Cservice = CustomerService.getInstance();
		
		service.purchase(CustomerId);
		Cservice.onPurchse(CustomerId);
		HttpUtil.forward(req, resp, "../orderList.jsp");
		
		/*
		if (totalMoney<money) {
			resp.setContentType("text/html; charset=utf-8");
			
			HttpUtil.forward(req, resp, "shoppingbag.jsp");
			session.setAttribute("str", "잔액이 부족합니다!!");
		} else {
			service.minusMoney(id, money);
			dao.purchase(id);
			
			HttpUtil.forward(req, resp, "shoppingbag.jsp");
			session.setAttribute("str", "결제되었습니다!!");
		}
		*/

	}

}
