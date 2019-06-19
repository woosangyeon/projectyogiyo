package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {
	
	
	HashMap<String, Controller> list = null;
	public void init(ServletConfig config) throws ServletException{
		list = new HashMap<String,Controller>();
		list.put("/customerInsert.do", new CustomerInsertController());
		list.put("/customerDelete.do", new CustomerDeleteController());
		list.put("/customerLogin.do", new CustomerLoginController());
		list.put("/shops/orderListAdd.do", new OrderListAddController());
		list.put("/shops/deleteOrder.do", new DeleteOrderController());
		list.put("/shops/purchaseList.do", new PurchaseListController());
		list.put("/shops/writeReview.do", new WriteReviewController());
		list.put("/customerUpdate.do", new CustomerUpdateController());
		list.put("/shopInsert.do", new shopInsertController());
		list.put("/menuInsert.do", new menuInsertController());
		list.put("/mboardInsert.do", new mboardInsertController());
		list.put("/shops/addAddress.do", new addAddressController());
		list.put("/deleteReview.do", new DeleteReviewController());
		/*list.put("/memberInsert.do", new MemberInsertController());*/
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		resp.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String url = req.getRequestURI();
		String cp = req.getContextPath();
		String path = url.substring(cp.length());
		
		Controller sc = list.get(path);
		PrintWriter out = resp.getWriter();
		out.print(path);
		sc.execute(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		resp.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String url = req.getRequestURI();
		String cp = req.getContextPath();
		String path = url.substring(cp.length());
		
		Controller sc = list.get(path);
		PrintWriter out = resp.getWriter();
		out.print(path);
		sc.execute(req, resp);

	}


	
	
	
	
	
}
