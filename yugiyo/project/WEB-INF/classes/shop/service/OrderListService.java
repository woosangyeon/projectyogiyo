package shop.service;

import java.sql.Date;

import shop.dao.OrderListDAO;

public class OrderListService {
	
	private static OrderListService service = new OrderListService();
	public OrderListDAO dao = OrderListDAO.getInstance();
	private OrderListService() {}

	public static OrderListService getInstance() {
		return service;
	}
	
	public void orderListAdd(String MenuID,String CustomerId ,int quantity) {
		dao.orderListAdd(MenuID, CustomerId,  quantity);
	}
	
	public void deleteOrder(int OrderID) {
		dao.deleteOrder(OrderID);
	}
	
	public void purchase(String CustomerId) {
		dao.purchase(CustomerId);
	}
	
	public void addAddress(String CustomerId,String address) {
		dao.addAddress(CustomerId, address);
	}
}
