package auth.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import menu.model.Menu;
import util.DBConnection;

public class MenuDAO {
	
	private static MenuDAO menuDao = new MenuDAO();

	private MenuDAO() {}

	public static MenuDAO getInstance() {
		return menuDao;
	}
	public Connection connect() {
		Connection conn = null;
		conn = DBConnection.getConnection();
		return conn;
	}
	
	Connection conn = DBConnection.getConnection();
	ResultSet rs = null;
	
	public int MenuInsert(Menu menu) {
		
		 try {
			 PreparedStatement pstmt = conn.prepareStatement("insert into menu(MenuID,MBoardID,name,price) values(?,?,?,?)");
			  
		   
			pstmt.setString(1, menu.getMenuID());
			pstmt.setString(2, menu.getMBoardID());
			pstmt.setString(3, menu.getName());
			pstmt.setInt(4, menu.getPrice());

			int rs = pstmt.executeUpdate();
			
			System.out.println(rs+"");
		   
		   if(rs == 1) {
			   return 1;
		   }
		   
		 }catch (SQLException se) {
			 return 0;
		 }
		 catch (Exception e){
			 e.printStackTrace();
		 	} return 2;
		}
	/*public Menu menuSearch(String id)
	{
		Menu menu = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement("select * from menu where MenuID = ?");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				menu = new Menu();
				menu.setMenuID(rs.getString(1));
				menu.setMBoardID(rs.getString(2));
				menu.setName(rs.getString(3));
				menu.setPrice(rs.getInt(4));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return menu;
	}*/

}
