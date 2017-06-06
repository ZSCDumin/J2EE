package com.pro.entity;

import java.util.List;

public class Shop {
private int	id;
private Users user;
private Dingdan dingdan;
private String	date;
private int shopstatus;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public Users getUser() {
	return user;
}
public void setUser(Users user) {
	this.user = user;
}

public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public int getShopstatus() {
	return shopstatus;
}
public void setShopstatus(int shopstatus) {
	this.shopstatus = shopstatus;
}

public Dingdan getDingdan() {
	return dingdan;
}
public void setDingdan(Dingdan dingdan) {
	this.dingdan = dingdan;
}
public Shop(Users user,  String date, int shopstatus) {
	super();
	this.user = user;
	this.date = date;
	this.shopstatus = shopstatus;
}
public Shop() {
	super();
	// TODO Auto-generated constructor stub
}




}
