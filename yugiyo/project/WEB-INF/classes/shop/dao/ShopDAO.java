package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import shop.model.Shop;
import util.DBConnection;

public class ShopDAO {

	private static ShopDAO shopDao = new ShopDAO();

	private ShopDAO() {}

	public static ShopDAO getInstance() {
		return shopDao;
	}
	public Connection connect() {
		Connection conn = null;
		conn = DBConnection.getConnection();
		return conn;
	}



	//타입으로 찾기
	public ResultSet selectByType(String type) {
		String sql ="SELECT name,availTime,payment FROM shop WHERE type = ?";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;

			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
		return null;

	}//selectByType

	//이름으로 검색
	public ResultSet selectByName(String name) {
		String sql ="SELECT * FROM shop WHERE name = ?";
		try {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;

			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
		return null;

	}//selectByName


	//리뷰글쓰기
	public void writeReview(String detail,int rank, String reviewBoardId,String CustomerId) {
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
		try {
			
			
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement("INSERT into review (RBoardID,CustomerId,detail,date,reputation) values(?,?,?,?,?)");
			pstmt.setString(1, reviewBoardId);
			pstmt.setString(2, CustomerId);
			pstmt.setString(3, detail);
			pstmt.setDate(4, sqlDate );
			pstmt.setInt(5, rank);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.close();
	}//orderListAdd
	
	//음식점 추가
	public void ShopInsert(Shop shop) {
		
		 try {
			 Connection conn = this.connect();
		   PreparedStatement pstmt = conn.prepareStatement("insert into shop(ShopId,type,name,reqprice,payment,info,tel,address,availTime,reputation) values(?,?,?,?,?,?,?,?,?,?)");
		   
		   	pstmt.setString(1, shop.getShopId());
			pstmt.setString(2, shop.getType());
			pstmt.setString(3, shop.getName());
			pstmt.setInt(4, shop.getReqprice());
			pstmt.setString(5, shop.getPayment());
			pstmt.setString(6, shop.getInfo());
			pstmt.setString(7, shop.getTel());
			pstmt.setString(8, shop.getAddress());
			pstmt.setString(9, shop.getAvailTime());
			pstmt.setInt(10, shop.getReputation());

			pstmt.executeUpdate();
		 }catch (Exception e){
			 e.printStackTrace();
		 	}
		}//ShopInsert
	
	
	//메뉴판 가져오기
	public ResultSet getMenu(String ShopId) {
		
		 try {
			Connection conn = this.connect();
		   
		   String sql2 ="SELECT MBoardId FROM menuBoard WHERE ShopId= ? ";

		   String sql ="SELECT DISTINCT menu.name, menu.price,menu.MenuID FROM menu,menuBoard,shop WHERE menuBoard.MBoardID = menu.MBoardID and menu.MBoardID=? and menuBoard.ShopId=?"; 
		   String menuBoardId =null;

		   PreparedStatement pstmt = conn.prepareStatement(sql2);
		   pstmt.setString(1, ShopId);
		   ResultSet rs2 = pstmt.executeQuery();
		   	 
		   while(rs2.next()){
		   	menuBoardId = rs2.getString(1);
		   	}
		   
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setString(1, menuBoardId);
		   pstmt.setString(2, ShopId );
		   return rs2 = pstmt.executeQuery();
		 
		 }catch (Exception e){
			 e.printStackTrace();
		 	}
		return null;
		}//getMenu	

	//리뷰창 가져오기
	public ResultSet getReview(String ShopId) {
		
		 try {
			Connection conn = this.connect();
		   
			String sql2 ="SELECT RBoardId FROM reviewBoard WHERE ShopId= ? ";

			String sql ="SELECT DISTINCT review.ReviewId, review.CustomerId,review.detail,review.date,review.reputation FROM review,reviewBoard,shop WHERE reviewBoard.RBoardID = review.RBoardID and reviewBoard.RBoardID=? and reviewBoard.ShopId=?;"; 
		  
		   String reviewBoardId =null;
		   
		   PreparedStatement pstmt = conn.prepareStatement(sql2);
		   pstmt.setString(1, ShopId);
		   ResultSet rs2 = pstmt.executeQuery();
		   	 
		   while(rs2.next()){
			   reviewBoardId = rs2.getString(1);
		   	}
		   
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setString(1, reviewBoardId);
		   pstmt.setString(2, ShopId );
		   return rs2 = pstmt.executeQuery();
		 
		 }catch (Exception e){
			 e.printStackTrace();
		 	}
		return null;
		}//getReview	


}
