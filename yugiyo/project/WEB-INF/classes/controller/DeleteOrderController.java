package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.dao.OrderListDAO;

public class DeleteOrderController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		

		String strOrderID = req.getParameter("OrderID");
		int OrderID = Integer.parseInt(strOrderID);
		
		// service 객체
		OrderListDAO service = OrderListDAO.getInstance();
		service.deleteOrder(OrderID);
		
		RequestDispatcher rd= req.getRequestDispatcher("../orderList.jsp");
		rd.forward(req,resp);

	}

}
