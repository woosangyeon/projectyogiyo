package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.service.OrderListService;
import util.HttpUtil;

public class addAddressController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String CustomerId =(String)session.getAttribute("id");
		String address = req.getParameter("address");
		
		/*		
		String id = req.getParameter("CustomerId");
		String pwd = req.getParameter("password");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		*/
		
		OrderListService service = OrderListService.getInstance();
		service.addAddress(CustomerId, address);
		
		//output
		HttpUtil.forward(req, resp, "../orderList.jsp");

	}

}
