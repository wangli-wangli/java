package com.jaovo.msg.dao;
import com.jaovo.msg.Util.DBUtil;
import com.jaovo.msg.Util.*;
import com.jaovo.msg.model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.jaovo.msg.Util.UserException;
public class UserDaoImpl  implements IUserDao{
	@Override
	public User load(String name) {
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from user1 where user ='"+name+"'";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			
			resultSet = preparedStatement.executeQuery();
	    	if(resultSet.next()) {
				user = new User();
				user.setPassword(resultSet.getString("password"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	}finally {
		//关闭资源
		DBUtil.close(resultSet);
		DBUtil.close(preparedStatement);
		DBUtil.close(connection);
	}
	return  user;
	}

        @Override
		public List<User> load() {
			Connection connection = DBUtil.getConnection();
			//准备sql语句
			String sql = "select * from user1 ";
			//创建语句传输对象
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			//集合中只能放入user对象
			List<User> users = new ArrayList<User>();
			User user = null;
			
			try {
				preparedStatement = connection.prepareStatement(sql);
				resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					user = new User();
					user.setId(resultSet.getString("id"));
					user.setName(resultSet.getString("user"));
					user.setPassword(resultSet.getString("password"));
					users.add(user);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			
		}finally {
			//关闭资源
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		
         return  users;
		}
    	@Override
		public void add(User user) {
    		
			Connection connection=DBUtil.getConnection();
			String  sql="select count(*) from user1 where id=?";
			PreparedStatement preparedStatement=null;
			ResultSet resultSet=null;
			try {
				preparedStatement=connection.prepareStatement(sql);
				preparedStatement.setString(1, user.getId());
				resultSet=preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					if(resultSet.getInt(1)>0) {
						
						throw new UserException("用户已存在");
					}
				}
				
				sql="insert into user1(id,user,password) value (?,?,?)";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, user.getId());
				preparedStatement.setString(2, user.getName());
				preparedStatement.setString(3, user.getPassword());
				
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(resultSet);
				DBUtil.close(preparedStatement);
				DBUtil.close(connection);
			}
			
			
			
		}

        @Override
		public void delete(String username) {
			 System.out.println("name2="+username);
			Connection connection=DBUtil.getConnection();
			String sql="delete from user1 where user=?";
			PreparedStatement preparedStatement=null;
			try {
				preparedStatement=connection.prepareStatement(sql);
				preparedStatement.setString(1,username);
				preparedStatement.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				DBUtil.close(preparedStatement);
				DBUtil.close(connection);
			}
		}
       
        @Override
		public void update(User user) {
      
		Connection connection=DBUtil.getConnection();
		String sql="update user1 set password=? where user=?";
		PreparedStatement preparedStatement=null;
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getPassword());
			preparedStatement.setString(2, user.getName());
			preparedStatement.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		
		}

		@Override
		public User load2(String id) {
			Connection connection = DBUtil.getConnection();
			//准备sql语句
			String sql = "select * from user1 where id ='"+id+"'";
			//创建语句传输对象
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			//集合中只能放入user对象
			User user = null;
			try {
				preparedStatement = connection.prepareStatement(sql);
				resultSet = preparedStatement.executeQuery();
		    	if(resultSet.next()) {
					user = new User();
					user.setId(id);
					user.setPassword(resultSet.getString("password"));
					user.setName(resultSet.getString("user"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}finally {
			//关闭资源
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user;
		}
		
		public String isLogin(String id1,String password1){
			Connection connection = DBUtil.getConnection();
			//准备sql语句
			
			String sql = "select * from user1 where id ='"+id1+"'";
			//创建语句传输对象
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			//集合中只能放入user对象
			User user2 = null;
			try {
				preparedStatement = connection.prepareStatement(sql);
				resultSet = preparedStatement.executeQuery();
		    	if(resultSet.next()) {
					user2 = new User();
					user2.setId(id1);
					user2.setPassword(resultSet.getString("password"));
					user2.setName(resultSet.getString("user"));
				}
		    	if(user2==null) {
		    		return "学号不存在";
		    		
		    	}
		    	else if(password1.equals(user2.getPassword()))
		    	{
		    		return "登录成功";
		    	}
		    	else
		    	{
		    		return "密码不正确";
		    	}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}finally {
			//关闭资源
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
			return null;
		
		}
		
	

	

}
