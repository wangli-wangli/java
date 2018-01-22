package com.jaovo.msg.dao;

import java.util.List;

import com.jaovo.msg.model.*;

public interface IUserDao {
	
	public List<User> load();
	public User load(String name);
	public void add(User user);
	public void delete(String username);
	public void update(User user);
	public User load2(String id);
	

	
}
