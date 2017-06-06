package com.pro.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.dbutils.DbUtils;
import org.omg.CORBA.PUBLIC_MEMBER;

import com.pro.entity.Users;
import com.pro.utils.DBUtils;

public class UserDaoImpl implements UserDao {

	@Override
	public Users UserLogin(Users users) throws Exception {
		Connection conn = DBUtils.getConnection();
		String sql = "select * from user where status=0 and username=?";
		PreparedStatement pt = conn.prepareStatement(sql);
		pt.setString(1, users.getUsername());
		ResultSet rs = pt.executeQuery();
		if (rs.next()) {
			Users users2 = new Users();
			users2.setId(rs.getInt("id"));
			users2.setStatus(rs.getInt("status"));
			users2.setRowid(rs.getInt("rowid"));
			users2.setPassword(rs.getString("password"));
			users2.setUsername(rs.getString("username"));
			users2.setUsername(rs.getString("email"));
			return users2;
		}
		return null;
	}

	@Override
	public int addUser(Users user) throws Exception {
		// 获得数据库连接
		Connection con = DBUtils.getConnection();
		// 定义sql语句
		String insertsql = "insert into user(username,password,email,rowid)values('" + user.getUsername() + "','"
				+ user.getPassword() + "','" + user.getEmail() + "','" + user.getRowid() + "')";

		Statement stm = con.prepareStatement(insertsql);
		stm.execute(insertsql);
		DBUtils.closeConnection();
		return 1;

	}

	@Override
	public Users findPwd(String email) throws Exception {
		// 获取连接
		Connection con = DBUtils.getConnection();
		String selsql = "select password from user where email=? and status=0";
		Users user = null;

		PreparedStatement pstm = con.prepareStatement(selsql);
		pstm.setString(1, email);

		ResultSet rs = pstm.executeQuery();
		if (rs.next()) {
			user = new Users();

			user.setPassword(rs.getString("password"));

		}
		return user;

	}

	@Override
	public List<Users> finByNameUsers(String username) throws Exception {
		List<Users> list = new ArrayList<Users>();
		Connection con = DBUtils.getConnection();
		String selsql = "select * from user where username like '%" + username + "%' and status=0";
		Statement stm = con.createStatement();
		ResultSet rs = stm.executeQuery(selsql);
		while (rs.next()) {
			Users users2 = new Users();
			users2.setId(rs.getInt("id"));
			users2.setStatus(rs.getInt("status"));
			users2.setRowid(rs.getInt("rowid"));
			users2.setPassword(rs.getString("password"));
			users2.setUsername(rs.getString("username"));
			users2.setEmail(rs.getString("email"));
			list.add(users2);
		}
		return list;
	}

	public static void main(String[] args) {
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		try {
			List<String> list = userDaoImpl.findFunticon(1);
			System.out.println(list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 查找所有用户
	@Override
	public List<Users> findAllUser(int page, int number) throws Exception {
		// 获取连接
		Connection conn = DBUtils.getConnection();
		String sql = "select *from user where status=0 limit ?,?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, (page - 1) * number);
		ps.setInt(2, number);
		List<Users> list = new ArrayList<Users>();
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Users user3 = new Users();
			user3.setId(rs.getInt("id"));
			user3.setUsername(rs.getString("username"));
			user3.setPassword(rs.getString("password"));
			user3.setPassword(rs.getString("password"));
			user3.setEmail(rs.getString("email"));
			user3.setRowid(rs.getInt("rowid"));

			list.add(user3);
		}
		return list;
	}

	/***
	 * 查询页数
	 */
	@Override
	public int UserPages(int number) throws Exception {
		Connection conn = DBUtils.getConnection();
		String sql = "select count(*) from user";
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

	// 根据id删除用户
	@Override
	public int deleteByIdUsers(int id) throws Exception {
		Connection conn = DBUtils.getConnection();
		String sql = " update user set status=1 where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setLong(1, id);
		return ps.executeUpdate();
	}

	@Override
	public Users finByNameUser(String username) throws Exception {
		Connection con = DBUtils.getConnection();
		String selsql = "select * from user where username ='" + username + "' and status=0";
		Statement stm = con.createStatement();
		ResultSet rs = stm.executeQuery(selsql);
		Users users2 = new Users();
		while (rs.next()) {
			users2.setId(rs.getInt("id"));
			users2.setStatus(rs.getInt("status"));
			users2.setRowid(rs.getInt("rowid"));
			users2.setPassword(rs.getString("password"));
			users2.setUsername(rs.getString("username"));
			users2.setEmail(rs.getString("email"));
			return users2;

		}
		return null;
	}

	// 修改用户
	@Override
	public boolean updateUser(Users users) throws Exception {
		Connection conn = DBUtils.getConnection();

		String sql = "update user set username=?,password=?,email=?,rowid=? where id=?";
		PreparedStatement pstat = conn.prepareStatement(sql);
		pstat.setString(1, users.getUsername());

		pstat.setString(2, users.getPassword());
		pstat.setString(3, users.getEmail());
		pstat.setInt(4, users.getRowid());
		pstat.setInt(5, users.getId());
		if (pstat.executeUpdate() > 0) {
			System.out.println("修改成功");
			return pstat.executeUpdate() > 0;

		} else {
			System.out.println("修改失败");
			return false;
		}
	}

	// 根据id获取对象
	@Override
	public Users findByIdUser(int id) {
		String sql = "select * from user  where id=? and status=0";
		Users user = null;
		try {
			Connection con = DBUtils.getConnection();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1, id);
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				user = new Users();
				user.setId(rs.getInt("id"));
				user.setPassword(rs.getString("password"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setRowid(rs.getInt("rowid"));
			}
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public List<String> findFunticon(int rowid) throws Exception {
		Connection conn = DBUtils.getConnection();
		String sql = "select * from function,row where rowid=row.id and row.id=?";
		List<String> list = new ArrayList<String>();
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, rowid);
		ResultSet rSet = ps.executeQuery();
		while (rSet.next()) {
			String s = rSet.getString("functionname");
			list.add(s);
		}

		return list;
	}

}
