package com.pro.dao;

import java.security.interfaces.RSAKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.pro.entity.Goods;
import com.pro.entity.Users;
import com.pro.utils.DBUtils;

public class GoodsImpl implements GoodsDao {

	@Override
	public int addGood(Goods good) throws Exception {
		Connection conn = DBUtils.getConnection();
		String sql = "insert into goods(goodsname,image,price,count,date,comment,userid) value(?,?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, good.getGoodsname());
		ps.setString(2, good.getImage());
		ps.setDouble(3, good.getPrice());
		ps.setInt(4, good.getCount());
		ps.setString(5, good.getDate());
		ps.setString(6, good.getComment());
		ps.setInt(7, good.getUsers().getId());
		
		return ps.executeUpdate();
	}

	@Override
	public List<Goods> findGoodsByUseidAndGoodsname(Goods goods)
			throws Exception {
		Connection conn = DBUtils.getConnection();
		String sql = "select * from user,goods where user.id =goods.userid  and  goods.goodsname  like '%"
				+ goods.getGoodsname()
				+ "%' and goods.status=0  and goods.userid=?";
		PreparedStatement pt = conn.prepareStatement(sql);
		// pt.setString(1,goods.getGoodsname());
		pt.setInt(1, goods.getUsers().getId());
		ResultSet rs = pt.executeQuery();
		List<Goods> list = new ArrayList<Goods>();
		while (rs.next()) {
			Goods goods2 = new Goods();
			goods2.setGoodsname(rs.getString("goodsname"));
			goods2.setPrice(rs.getDouble("price"));
			goods2.setCount(rs.getInt("count"));
			goods2.setComment(rs.getString("comment"));
			goods2.setImage(rs.getString("image"));
			goods2.setDate(rs.getString("date"));
			goods2.setId(rs.getInt("id"));
			Users user = new Users();
			user.setUsername(rs.getString("username"));
			user.setId(rs.getInt("id"));
			user.setEmail(rs.getString("email"));
			goods2.setUsers(user);
			list.add(goods2);
		}

		return list;
	}

	// public static void main(String[] args) {
	// Users users=new Users();
	// users.setId(1);
	// GoodsImpl impl=new GoodsImpl();
	// Goods good=new Goods("白兰地", "a.png", 34.5, 20,new
	// Date().toLocaleString(), 0, users,"很好吃的东西");
	// try {
	// if(impl.addGood(good)>0){
	// System.out.println("添加成功");
	// }
	// } catch (Exception e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// }

	@Override
	public List<Goods> findAllGoods(int userid, int page, int number)
			throws Exception {
		Connection conn = DBUtils.getConnection();
		String sql = "select * from user,goods where user.id =goods.userid  and  goods.status=0  and user.id=? limit ?,?";
		PreparedStatement pt = conn.prepareStatement(sql);
		pt.setInt(1, userid);
		pt.setInt(2, (page - 1) * number);
		pt.setInt(3, number);
		ResultSet rs = pt.executeQuery();
		List<Goods> list = new ArrayList<Goods>();
		while (rs.next()) {
			Goods goods2 = new Goods();
			goods2.setGoodsname(rs.getString("goodsname"));
			goods2.setPrice(rs.getDouble("price"));
			goods2.setCount(rs.getInt("count"));
			goods2.setComment(rs.getString("comment"));
			goods2.setImage(rs.getString("image"));
			goods2.setDate(rs.getString("date"));
			goods2.setId(rs.getInt("goods.id"));
			Users user = new Users();
			user.setUsername(rs.getString("username"));
			user.setId(rs.getInt("user.id"));
			user.setEmail(rs.getString("email"));
			goods2.setUsers(user);
			list.add(goods2);
		}
		return list;
	}

	// 查询商品的页数
	@Override
	public int GoodsPages(int number) throws Exception {
		Connection conn = DBUtils.getConnection();
		String sql = "select count(*) from Goods where status=0";
		PreparedStatement pt = conn.prepareStatement(sql);
		ResultSet rs = pt.executeQuery();
		if (rs.next()) {
			if (rs.getInt(1) % number == 0) {
				return rs.getInt(1) / number;
			} else {
				return rs.getInt(1) / number + 1;
			}
		}
		return 0;

	}

	@Override
	public Goods findByIdGoods(int id) throws Exception {
		Connection conn = DBUtils.getConnection();
		String sql = "select * from user,goods where user.id =goods.userid and goods.id=? and goods.status=0";
		PreparedStatement pt = conn.prepareStatement(sql);
		pt.setInt(1, id);
		ResultSet rs = pt.executeQuery();
		Goods goods = new Goods();
		if (rs.next()) {
        goods.setComment(rs.getString("comment"));
	    goods.setCount(rs.getInt("count"));
		goods.setDate(rs.getString("date"));
	    goods.setGoodsname(rs.getString("goodsname"));
	    goods.setId(rs.getInt("goods.id"));
	    goods.setImage(rs.getString("image"));
	    goods.setPrice(rs.getDouble("price"));
	    goods.setStatus(rs.getInt("status"));
	    Users user = new Users();
		user.setUsername(rs.getString("username"));
		user.setId(rs.getInt("user.id"));
		user.setEmail(rs.getString("email"));
		goods.setUsers(user);
		}
		return goods;
	}
	@Override
	public int modifyGood(Goods good) throws Exception {
		Connection conn = DBUtils.getConnection();
		String sql = "update goods set  goodsname=?,image=?,price=?,count=?,date=?,comment=? where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, good.getGoodsname());
		ps.setString(2, good.getImage());
		ps.setDouble(3, good.getPrice());
		ps.setInt(4, good.getCount());
		ps.setString(5, good.getDate());
		ps.setString(6, good.getComment());
		ps.setInt(7, good.getId());
		return ps.executeUpdate();
			}
	
	public static void main(String[] args) {
		GoodsImpl goodsImpl=new GoodsImpl();
		Users users=new Users();
		users.setId(4);
		Goods good=new Goods("123456", "www.jpg", 88.8, 20, new Date().toLocaleString(), 0, users, "test");
		good.setId(7);
		try {
			System.out.println(goodsImpl.modifyGood(good));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	//撤销商品
		@Override
		public int deleteGood(int id) throws Exception {
			Connection conn = DBUtils.getConnection();
			String sql = " update goods set status=1 where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			return ps.executeUpdate();
		}
		
		
		@Override
		//前台显示所有商品
		public List<Goods> findAllGoods(int page, int number)
				throws Exception {
			Connection conn = DBUtils.getConnection();
			String sql = "select * from user,goods where user.id =goods.userid  and  goods.status=0 limit ?,?";
			PreparedStatement pt = conn.prepareStatement(sql);
			pt.setInt(1, (page - 1) * number);
			pt.setInt(2, number);
			ResultSet rs = pt.executeQuery();
			List<Goods> list = new ArrayList<Goods>();
			while (rs.next()) {
				Goods goods2 = new Goods();
				goods2.setGoodsname(rs.getString("goodsname"));
				goods2.setPrice(rs.getDouble("price"));
				goods2.setCount(rs.getInt("count"));
				goods2.setComment(rs.getString("comment"));
				goods2.setImage(rs.getString("image"));
				goods2.setDate(rs.getString("date"));
				goods2.setId(rs.getInt("goods.id"));
				Users user = new Users();
				user.setUsername(rs.getString("username"));
				user.setId(rs.getInt("user.id"));
				user.setEmail(rs.getString("email"));
				goods2.setUsers(user);
				list.add(goods2);
			}
			return list;
		}

		@Override
		public int deleteByIdGoods(int id) throws Exception {
			Connection conn = DBUtils.getConnection();
			String sql = " update goods set status=1 where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(1, id);
			return ps.executeUpdate();
		}

		@Override
		public int downByGoods(int id,int count) throws Exception {
			Connection conn = DBUtils.getConnection();
			String sql = " update goods set count=count-?  where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(1, count);
			ps.setInt(2, id);
			return ps.executeUpdate();
		}
      
}
