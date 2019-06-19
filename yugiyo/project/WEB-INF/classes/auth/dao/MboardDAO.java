package auth.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import mBoard.model.MBoard;
import util.DBConnection;

public class MboardDAO {
	
	private static MboardDAO mboardDao = new MboardDAO();

	private MboardDAO() {}

	public static MboardDAO getInstance() {
		return mboardDao;
	}
	public Connection connect() {
		Connection conn = null;
		conn = DBConnection.getConnection();
		return conn;
	}
	
	Connection conn = DBConnection.getConnection();
	
	public void MboardInsert(MBoard mboard) {
		
		 try {
		   PreparedStatement pstmt = conn.prepareStatement("insert into menuboard(MBoardID,ShopId) values(?,?)");
		   
		   
		   	pstmt.setString(1, mboard.getMBoardID());
			pstmt.setString(2, mboard.getShopId());

			pstmt.executeUpdate();
		 }catch (Exception e){
			 e.printStackTrace();
		 	}
		}

}
