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

@WebServlet("/FindPwdServlet")
public class FindPwdServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String email = req.getParameter("email");
		UserBiz userbiz = new UserBizImpl();
		Users user;
		try {
			
			user = userbiz.findPwd(email);
			
			if(user!=null){
				req.setAttribute("password", user.getPassword());
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}else{
				req.setAttribute("password", "没有该用户");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtils.closeConnection();
		}

		

	}
}
