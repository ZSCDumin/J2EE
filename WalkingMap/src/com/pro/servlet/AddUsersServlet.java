package com.pro.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;







import com.pro.biz.UserBiz;
import com.pro.biz.UserBizImpl;
import com.pro.entity.Users;
import com.pro.utils.DBUtils;

@WebServlet("/AddUsersServlet")
public class AddUsersServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String name=req.getParameter("username");
		String pwd=req.getParameter("password");
		String email=req.getParameter("email");
		String rowid=req.getParameter("roletype");
		
		Users user = new Users();
		user.setUsername(name);
		user.setPassword(pwd);
		user.setEmail(email);
		user.setRowid(Integer.parseInt(rowid));
		
		UserBiz userbiz = new UserBizImpl();
		

		int r;
		try {
			r = userbiz.addUser(user);
			if (r > 0) {
				System.out.println("注册成功");
			
				req.setAttribute("ok", "注册成功，请登录");
				//如果注册成功就跳转页面
				resp.sendRedirect(req.getContextPath() + "/login.jsp");
			} else {
				System.out.println("注册失败");
			
				req.setAttribute("ok", "注册失败，请不要重复名字");
				
				resp.sendRedirect(req.getContextPath() + "/login.jsp");
			
			
			
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtils.closeConnection();
		}
		
		
		
	} 

	
}
