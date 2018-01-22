package com.jaovo.msg.model;

public class User {
	private String name;
	private String password;
	private String id;//学号
	public String getName() {
		return name;
	}
	public String getPassword() {
		return password;
	}
	public void setName(String name) {
		this.name=name;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	public  String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

}
