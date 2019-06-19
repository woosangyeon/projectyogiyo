package controller;

import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customer.service.CustomerService;
import shop.service.OrderListService;
import util.HttpUtil;

public class OrderListAddController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HH-mm");
		
		HttpSession session = req.getSession();
		
		String MenuID = req.getParameter("MenuID");
		String CustomerId =(String)session.getAttribute("id");
		int quantity = Integer.parseInt( req.getParameter("quantity"));
		
		/*		
		String id = req.getParameter("CustomerId");
		String pwd = req.getParameter("password");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		*/
		
		OrderListService service = OrderListService.getInstance();
		service.orderListAdd(MenuID, CustomerId,quantity);
		
		//output
		HttpUtil.forward(req, resp, "../orderList.jsp");
	}

}
