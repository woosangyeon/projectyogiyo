package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//싱글톤( singleTon )
public class DBConnection {
	/*
	사용법
	Connection conn = conn = DBConnection.getConnection();
	PreparedStatement pstmt = conn.prepareStatement();
	*/
	private static Connection connection = null;
	private DBConnection() {}
	public static Connection getConnection() {
		if ( connection == null ) {
			String url = "jdbc:mysql://localhost/yugiyo?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false ";
			String userid = "root";
			String password = "cs1234" ;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(url, userid, password);
				//System.out.println( connection );			
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}  catch (SQLException e) {
				e.printStackTrace();
			}
		} // if 
		return connection;
	
	} // getConnection
	public static Connection getConnection(String url, String userid, String password) {
		if ( connection == null ) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(url, userid, password);
				System.out.println( connection );			
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}  catch (SQLException e) {
				e.printStackTrace();
			}
		} // if 
		return connection;
		
	}
	public static void close() {
			if (connection != null) {
				try {
					if (!connection.isClosed()) {
						connection.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				connection = null;
			}		
	}
	/*
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		conn = DBConnection.getConnection();
	 */	

} // class
