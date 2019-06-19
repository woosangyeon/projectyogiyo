package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.model.Customer;
import customer.service.CustomerService;
import util.HttpUtil;




public class CustomerUpdateController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String CustomerId =req.getParameter("CustomerId");
		String password =req.getParameter("password");
		String name =req.getParameter("name");
		String tel =req.getParameter("tel");
		String address =req.getParameter("address");
		
		Customer customer = new Customer();
		customer.setCustomerId(CustomerId);
		customer.setPassword(password);
		customer.setName(name);
		customer.setTel(tel);
		customer.setAddress(address);
		
		CustomerService service = CustomerService.getInstance();
				service.CustomerUpdate(customer);
				
				HttpUtil.forward(req, resp, "logoutProc.jsp");
	}


}
