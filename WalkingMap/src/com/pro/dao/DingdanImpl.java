package com.pro.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pro.entity.Dingdan;
import com.pro.entity.Shop;
import com.pro.entity.Users;
import com.pro.utils.DBUtils;

public class DingdanImpl implements DingdanDao {

	@Override
	public int addDingdan(Dingdan dingdan) throws Exception {
		Connection conn = DBUtils.getConnection();
		String sql = "insert into dingdan(goodsname,goodsprice,count,shopid,goodsid) value(?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, dingdan.getGoodsname());
		ps.setDouble(2, dingdan.getGoodsprice());
		ps.setInt(3, dingdan.getCount());
		System.out.println(dingdan.getShop().getId());
		ps.setInt(4, dingdan.getShop().getId());
		ps.setInt(5, dingdan.getGoodsid());
		return ps.executeUpdate();
	}

	public static void main(String[] args) {
		DingdanImpl dingdanImpl = new DingdanImpl();
		Shop shop = new Shop();
		shop.setId(6);
		Dingdan dingdan = new Dingdan(3, "asd", 33.3, 20, shop);
		try {
			dingdanImpl.addDingdan(dingdan);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 查找客户订在自己店铺订的商品和客户的姓名和数量
	@Override
	public List<Dingdan> findDingdan(Users users) throws Exception {
		Connection conn = DBUtils.getConnection();
		String sql = " SELECT  dingdan.dingdanstatus,dingdan.goodsname,goodsid,dingdan.count,goodsprice,shop.userid FROM dingdan,shop,goods "
				+ "WHERE shop.id=dingdan.shopid and dingdan.goodsid=goods.id "
				+ "and dingdanstatus=0 and goods.userid=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, users.getId());
		ResultSet rs = ps.executeQuery();
		List<Dingdan> list = new ArrayList<Dingdan>();
		while (rs.next()) {
			Dingdan dingdan = new Dingdan();
			dingdan.setCount(rs.getInt("dingdan.count"));
			dingdan.setGoodsid(rs.getInt("goodsid"));
			dingdan.setGoodsname(rs.getString("dingdan.goodsname"));
			dingdan.setGoodsprice(rs.getDouble("goodsprice"));
			dingdan.setId(rs.getInt("shop.userid"));
			dingdan.setDingdanstatus(rs.getInt("dingdan.dingdanstatus"));
			list.add(dingdan);
		}

		return list;
	}

}
