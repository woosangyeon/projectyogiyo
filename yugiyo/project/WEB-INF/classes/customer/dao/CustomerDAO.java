package customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import customer.model.Customer;
import util.DBConnection;

public class CustomerDAO {
	
	private static CustomerDAO customerDao = new CustomerDAO();

	private CustomerDAO() {}

	public static CustomerDAO getInstance() {
		return customerDao;
	}
	public Connection connect() {
		Connection conn = null;
		conn = DBConnection.getConnection();
		return conn;
	}
	
	Connection conn = DBConnection.getConnection();
	
	public void CustomerInsert(Customer customer) {
		
		 try {
		   PreparedStatement pstmt = conn.prepareStatement("insert into customer(CustomerId,password,name,tel) values(?,?,?,?)");
		   
		   	pstmt.setString(1, customer.getCustomerId());
			pstmt.setString(2, customer.getPassword());
			pstmt.setString(3, customer.getName());
			pstmt.setString(4, customer.getTel());

			pstmt.executeUpdate();
		 }catch (Exception e){
			 e.printStackTrace();
		 	}
		}
		 
		 public void CustomerDelete(String id) {
			 
			 try {
				 PreparedStatement pstmt = conn.prepareStatement("Delete from customer where CustomerId=?");
				 
				 pstmt.setString(1, id);
				 
				 pstmt.executeUpdate();
			 }catch (Exception e) {
				 e.printStackTrace();
			 }
		 }
		 
		 public void CustomerUpdate(Customer customer)
			{
				Connection con = this.connect();
				
				try {
					PreparedStatement pstmt = con.prepareStatement("update customer set password=?, name=?, tel=?, address=? where CustomerId=?");

					pstmt.setString(5, customer.getCustomerId());
					pstmt.setString(1, customer.getPassword());
					pstmt.setString(2, customer.getName());
					pstmt.setString(3, customer.getTel());
					pstmt.setString(4, customer.getAddress());

					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		 
		 public void onPurchse(String CustomerId)
			{
				Connection con = this.connect();
				
				try {
					
					PreparedStatement pstmt = con.prepareStatement("update customer set order_num =order_num+1,point=point+100 where CustomerId=?");

					pstmt.setString(1, CustomerId);

					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		 
		 
		//로그인
		public int CustomerLogin(String id,String passwd) throws SQLException {
			Connection con = this.connect();
			PreparedStatement pstmt = con.prepareStatement("SELECT password FROM customer WHERE CustomerId = ?  ");
			ResultSet rs = null;

			try {
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					if (rs.getString(1).equals(passwd)) {
						return 1;
					} else 
						return 0;
				}
				return -1;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -2;

		}//CustomerLogin
		
		//리뷰 삭제
		public void deleteReview(int ReviewId) {
			String sql ="DELETE from review WHERE ReviewId=?";
			try {
				Connection con = this.connect();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = null;

				pstmt.setInt(1, ReviewId);
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}
			DBConnection.close();


		}//deleteReview
	
	
}
