package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.service.CustomerService;
import shop.dao.OrderListDAO;

public class DeleteReviewController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String strReviewId = req.getParameter("ReviewId");
		int ReviewId = Integer.parseInt(strReviewId);
		
		// service 객체
		CustomerService service = CustomerService.getInstance();
		service.deleteReview(ReviewId);
		
		RequestDispatcher rd= req.getRequestDispatcher("myinfor.jsp");
		rd.forward(req,resp);

	}

}
