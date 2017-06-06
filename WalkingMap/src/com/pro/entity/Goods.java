package com.pro.entity;

import java.sql.Date;

public class Goods {
	private int id;
private String goodsname;
private	 String image;
private   double price;
private    int count;
private  String	date;
private int	status;
private Users users;
private   String comment;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getGoodsname() {
	return goodsname;
}
public void setGoodsname(String goodsname) {
	this.goodsname = goodsname;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}

public String getComment() {
	return comment;
}
public void setComment(String comment) {
	this.comment = comment;
}
public Goods() {
	super();
	// TODO Auto-generated constructor stub
}
public Users getUsers() {
	return users;
}
public void setUsers(Users users) {
	this.users = users;
}
public Goods(String goodsname, String image, double price, int count,
		String date, int status, Users users, String comment) {
	super();
	this.goodsname = goodsname;
	this.image = image;
	this.price = price;
	this.count = count;
	this.date = date;
	this.status = status;
	this.users = users;
	this.comment = comment;
}
@Override
public String toString() {
	return "Goods [id=" + id + ", goodsname=" + goodsname + ", image=" + image
			+ ", price=" + price + ", count=" + count + ", date=" + date
			+ ", status=" + status + ", users=" + users + ", comment="
			+ comment + "]";
}




}
