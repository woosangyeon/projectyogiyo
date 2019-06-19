package shop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBConnection;

public class OrderListDAO {

	private static OrderListDAO orderListDAO = new OrderListDAO();

	private OrderListDAO() {}

	public static OrderListDAO getInstance() {
		return orderListDAO;
	}
	public Connection connect() {
		Connection conn = null;
		conn = DBConnection.getConnection();
		return conn;
	}

	//장바구니 추가
	public void orderListAdd(String MenuID,String CustomerId , int quantity) {

		try {
			java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());

			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement("INSERT into orderList (MenuID,CustomerId,orderdate,quantity) values(?,?,?,?)");
			pstmt.setString(1, MenuID);
			pstmt.setString(2, CustomerId);
			pstmt.setDate(3, sqlDate );
			pstmt.setInt(4, quantity);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
	}//orderListAdd

	
	//주소
		public void addAddress(String CustomerId,String address) {

			try {

				Connection con = this.connect();
				PreparedStatement pstmt = con.prepareStatement("update orderList set address=? where CustomerId=?");
				pstmt.setString(1, address);
				pstmt.setString(2, CustomerId);

				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			DBConnection.close();
		}//addAddress
	
	//장바구니 삭제
	public void deleteOrder(int OrderID) {
		String sql ="DELETE from orderList WHERE OrderID=?";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;

			pstmt.setInt(1, OrderID);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();


	}//deleteOrder
	
	//구매처리
		public void purchase(String CustomerId) {
			try {
				Connection con = this.connect();
				PreparedStatement pstmt = con.prepareStatement("DELETE from orderList WHERE CustomerId =? ");

				pstmt.setString(1, CustomerId);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}//purchase

}
