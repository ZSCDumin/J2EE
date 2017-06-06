package com.pro.biz;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;

import com.pro.dao.UserDao;
import com.pro.dao.UserDaoImpl;
import com.pro.entity.Users;
import com.pro.utils.DBUtils;

public class UserBizImpl implements UserBiz {
	private UserDao userdao = new UserDaoImpl();

	// 用户登录
	@Override
	public Users UserLogin(Users users) throws Exception {
		Users u = userdao.UserLogin(users);
		if (u == null) {
			return null;
		} else if (u.getPassword().equals(users.getPassword())) {
			return u;
		}
		return null;
	}

	// 注册用户
	@Override
	public int addUser(Users user) throws Exception {
		Users u = userdao.UserLogin(user);
		if (u == null) {
			return userdao.addUser(user);

		}
		return 0;
	}

	// 找回用户
	@Override
	public Users findPwd(String email) throws Exception {
		return userdao.findPwd(email);
	}

	// 模糊查询所有用户
	@Override
	public List<Users> finByNameUsers(String username) throws Exception {
		// TODO Auto-generated method stub
		return userdao.finByNameUsers(username);
	}

	@Override
	public int deleteByIdUsers(int id) throws Exception {

		return userdao.deleteByIdUsers(id);
	}

	@Override
	public List<Users> findAllUser(int page, int number) throws Exception {
		// TODO Auto-generated method stub
		return userdao.findAllUser(page, number);
	}

	@Override
	public int UserPages(int number) throws Exception {
		// TODO Auto-generated method stub
		return userdao.UserPages(number);
	}

	@Override
	public Users finByNameUser(String username) throws Exception {
		// TODO Auto-generated method stub
		return userdao.finByNameUser(username);
	}

	@Override
	public List<String> findFunticon(int rowid) throws Exception {
		return userdao.findFunticon(rowid);
	}

	@Override
	public boolean updateUser(Users users) throws Exception {
		return userdao.updateUser(users);
	}

	@Override
	public Users findByIdUser(int id) {
		return userdao.findByIdUser(id);
	}

}
