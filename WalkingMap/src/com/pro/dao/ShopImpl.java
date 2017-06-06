package com.pro.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pro.entity.Goods;
import com.pro.entity.Shop;
import com.pro.entity.Users;
import com.pro.utils.DBUtils;

public class ShopImpl  implements ShopDao{

	@Override
	public int addShop(Shop shop) throws Exception {
		Connection conn = DBUtils.getConnection();
		String sql = "insert into Shop(userid,date) value(?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, shop.getUser().getId());
        ps.setString(2, shop.getDate());
		return ps.executeUpdate();
	 }

	@Override
	public int findShopID(Shop shop) throws Exception {
		Connection conn = DBUtils.getConnection();
		String sql = "select id from shop where userid=?";
		PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, shop.getUser().getId());
        ResultSet rs=ps.executeQuery();
        if(rs.next()){
           return rs.getInt("id");		
  
        }
		return 0;
	}



}
