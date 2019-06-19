package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customer.service.CustomerService;
import util.HttpUtil;


public class CustomerLoginController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		HttpSession session = req.getSession();

		String id= req.getParameter("CustomerId");
		String password= req.getParameter("password");

		System.out.println(id);

		System.out.println(password);
		CustomerService service = CustomerService.getInstance();
		int result = 0;
		if (id.equals("admin") && password.equals("1234")) {
			session.setAttribute("id", id);
			HttpUtil.forward(req, resp, "loginadmin.jsp");
		} else {



			try {
				result = service.CustomerLogin(id, password);
			} catch (SQLException e) {

				e.printStackTrace();
			}
			if(result ==1){

				session.setAttribute("id", id);

				RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
				rd.forward(req, resp);
			}else{
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out = resp.getWriter();
			
				out.println("<script>alert('회원 정보가 없습니다.')</script>");
				
				
				
				
				out.close();
				RequestDispatcher rd= req.getRequestDispatcher("loginform.jsp");
				rd.forward(req,resp);
				
				
				
				
			}
		}
	}

}
