package com.pro.dao;

import java.util.List;

import javax.jws.soap.SOAPBinding.Use;

import com.pro.entity.Users;

public interface UserDao {
//用户登录
public Users UserLogin(Users users)throws Exception;
//用户注册
public int addUser(Users user) throws Exception;
//用户找回
public Users findPwd(String email)throws Exception;
 //模糊查询用户
public List<Users> finByNameUsers(String username)throws Exception;
//根据id删除用户
public int  deleteByIdUsers(int id)throws Exception;
//查找第一页的数据
public List<Users> findAllUser(int page, int number) throws Exception;
//查询所有用户的页数
public int UserPages(int number) throws Exception;
//精准查询用户
public Users finByNameUser(String username)throws Exception;
//查询一个角色的所有的功能
public List<String> findFunticon(int rowid)throws Exception;
//修改用户
public boolean updateUser(Users users) throws Exception;
//通过id找到用户
 public Users findByIdUser(int id);
}
