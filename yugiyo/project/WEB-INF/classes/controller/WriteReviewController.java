package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.service.OrderListService;
import shop.service.ShopService;
import util.HttpUtil;

public class WriteReviewController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HH-mm");
		
		HttpSession session = req.getSession();
		
		String CustomerId =(String)session.getAttribute("id");
		String detail = req.getParameter("detail");
		int rank = Integer.parseInt( req.getParameter("rank"));
		String reviewBoardId = req.getParameter("RBoardID");
		
		
		/*		
		String id = req.getParameter("CustomerId");
		String pwd = req.getParameter("password");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		*/
		
		ShopService service = ShopService.getInstance();
		service.writeReview(detail, rank, reviewBoardId, CustomerId);
		
		
		//output
		HttpUtil.forward(req, resp, "../myinfor.jsp");

	}

}
