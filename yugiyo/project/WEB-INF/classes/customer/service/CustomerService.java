package customer.service;

import java.sql.SQLException;

import customer.dao.CustomerDAO;
import customer.model.Customer;

public class CustomerService {
	private static CustomerService service = new CustomerService();
	public CustomerDAO dao = CustomerDAO.getInstance();
	private CustomerService() {}
	
	public static CustomerService getInstance() {
		return service;
	}
	
	public void CustomerInsert(Customer customer) {
		dao.CustomerInsert(customer);
	}
	public void CustomerDelete(String id) {
		dao.CustomerDelete(id);
	}
	
	public int CustomerLogin(String id,String passwd) throws SQLException {
		return dao.CustomerLogin(id, passwd);
	}
	
	public void CustomerUpdate(Customer customer) {
		dao.CustomerUpdate(customer);
	}
	
	public void onPurchse(String CustomerId) {
		dao.onPurchse(CustomerId);
	}
	
	public void deleteReview(int ReviewId) {
		dao.deleteReview(ReviewId);
	}
	
}
