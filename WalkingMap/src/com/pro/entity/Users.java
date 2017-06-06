package com.pro.entity;

public class Users {
private int	id;
private String	username;
private String	password;
private String	email;
private int	rowid;
private  int status;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public int getRowid() {
	return rowid;
}
public void setRowid(int rowid) {
	this.rowid = rowid;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public Users(int id, String username, String password, String email, int rowid,
		int status) {
	super();
	this.id = id;
	this.username = username;
	this.password = password;
	this.email = email;
	this.rowid = rowid;
	this.status = status;
}
public Users() {
	super();
}



}
