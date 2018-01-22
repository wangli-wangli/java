package com.jaovo.msg.Util;
import java.sql.*;

public class DBUtil {
	public static Connection getConnection() {
		//加载驱动
		String dbDrive="com.mysql.jdbc.Driver";
		try {
			try {
				Class.forName(dbDrive).newInstance();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//连接数据库
		Connection connection=null; 
		String url="jdbc:mysql://localhost:3307/l_user";
		try {
			connection=DriverManager.getConnection(url,"root","root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	public static void close(Connection connection ) {
		try {
			if (connection != null) {
				connection.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(PreparedStatement preparedStatement ) {
		try {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(ResultSet resultSet ) {
		try {
			if (resultSet != null) {
				resultSet.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}



