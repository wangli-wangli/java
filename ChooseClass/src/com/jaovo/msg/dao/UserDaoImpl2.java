/*UserDapImpl2.java*/
package com.jaovo.msg.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jaovo.msg.Util.DBUtil;

import com.jaovo.msg.model.Class2;


public class UserDaoImpl2 implements IUserDao2{
	@Override
	public void add(Class2 class2) {
		//获得链接对象
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			String sql = "insert into t_class(classname,teacher,address) value (?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, class2.getClassname());
			preparedStatement.setString(2,class2.getTeacher());
			preparedStatement.setString(3,class2.getAddress());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭资源
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		
	}

	
}
