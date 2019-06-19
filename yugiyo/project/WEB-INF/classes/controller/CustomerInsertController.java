package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.service.CustomerService;
import util.HttpUtil;
import customer.model.*;

public class CustomerInsertController implements Controller{

	public void execute(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException,IOException{
		String id = req.getParameter("CustomerId");
		String pwd = req.getParameter("password");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		
		/*if(id.isEmpty() || pwd.isEmpty() || name.isEmpty() || tel.isEmpty()) {
			req.setAttribute("error", "Fill every part");
			HttpUtil.forward(req, resp, "/loginform.jsp");
		}*/
		Customer customer = new Customer();
		customer.setCustomerId(id);
		customer.setPassword(pwd);
		customer.setName(name);
		customer.setTel(tel);
		customer.setOrder_num(0);
		customer.setReview_num(0);
		customer.setPoint(0);
		
		//service ��ü ȣ��
		CustomerService service = CustomerService.getInstance();
		service.CustomerInsert(customer);
		
		//output
		req.setAttribute("id", id);
		HttpUtil.forward(req, resp, "/result/registerResult.jsp");
	}
}
