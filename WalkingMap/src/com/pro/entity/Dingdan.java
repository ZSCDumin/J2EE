package com.pro.entity;

public class Dingdan {
private int	id; 
private String 	goodsname;
private double	goodsprice;
private int	count;
private Shop shop;
private  int goodsid;
private  int dingdanstatus;
public int getDingdanstatus() {
	return dingdanstatus;
}
public void setDingdanstatus(int dingdanstatus) {
	this.dingdanstatus = dingdanstatus;
}
public int getGoodsid() {
	return goodsid;
}
public void setGoodsid(int goodsid) {
	this.goodsid = goodsid;
}
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
public double getGoodsprice() {
	return goodsprice;
}
public void setGoodsprice(double goodsprice) {
	this.goodsprice = goodsprice;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public Dingdan() {
	super();
	// TODO Auto-generated constructor stub
}
public Shop getShop() {
	return shop;
}
public void setShop(Shop shop) {
	this.shop = shop;
}
public Dingdan(int id, String goodsname, double goodsprice, int count, Shop shop) {
	super();
	this.id = id;
	this.goodsname = goodsname;
	this.goodsprice = goodsprice;
	this.count = count;
	this.shop = shop;
}


}
