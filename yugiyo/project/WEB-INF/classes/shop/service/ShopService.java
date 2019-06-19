package shop.service;

import java.sql.Date;
import java.sql.ResultSet;

import shop.dao.ShopDAO;
import shop.model.Shop;

public class ShopService {
	
	private static ShopService service = new ShopService();
	public ShopDAO dao = ShopDAO.getInstance();
	private ShopService() {}
	
	public static ShopService getInstance() {
		return service;
	}
	
	public ResultSet selectByType(String type) {
		return dao.selectByType(type);
	}
	
	public ResultSet selectByName(String name) {
		return dao.selectByName(name);
	}
	public void writeReview(String detail,int rank, String reviewBoardId,String CustomerId) {
		dao.writeReview(detail, rank, reviewBoardId, CustomerId);
	}
	public void ShopInsert(Shop shop) {
		 dao.ShopInsert(shop);
	}
	
	public ResultSet getMenu(String ShopId) {
		return dao.getMenu(ShopId);
	}
	
	public ResultSet getReview(String ShopId) {
		return dao.getReview(ShopId);
	}
	
}
