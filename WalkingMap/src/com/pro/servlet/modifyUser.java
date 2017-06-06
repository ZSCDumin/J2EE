package com.pro.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.biz.UserBiz;
import com.pro.biz.UserBizImpl;
import com.pro.entity.Users;
@WebServlet("/modifyUser")
public class modifyUser  extends  HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String userid=req.getParameter("userid");
		// 调用业务层获取该userid的user对象，并显示给客户端进行修改
		System.out.println("modify获取到的userid是"+userid);
		UserBiz userbiz=new UserBizImpl();
		Users users = userbiz.findByIdUser(Integer.valueOf(userid));
		req.setAttribute("user", users);
		req.getRequestDispatcher("changeuser.jsp").forward(req, resp);
		System.out.println("页面跳转了");
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		try {
			String id=req.getParameter("id");
			Integer usId=Integer.parseInt(id);
			String username=req.getParameter("username");
			String password=req.getParameter("password");
			String email=req.getParameter("email");
			String rowid=req.getParameter("rowid");
			Users users=new Users();
			users.setUsername(username);
			users.setPassword(password);
			users.setEmail(email);
			users.setRowid(Integer.valueOf(rowid));
			users.setId(usId);
			UserBiz userbiz = new UserBizImpl();
			userbiz.updateUser(users);
			resp.sendRedirect("findAllUser");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }	
	
}
