package com.pro.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.biz.UserBiz;
import com.pro.biz.UserBizImpl;
@WebServlet("/CheckUser")
public class CheckUser  extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		  resp.setContentType("utf-8");
	      String username=req.getParameter("username");
	      System.out.println(username);
	      UserBiz userBiz=new UserBizImpl();
	      try {
			if(userBiz.finByNameUser(username)!=null){
			   System.out.println("该用户 不可");		
			   resp.getWriter().print(false);
			}else{
				System.out.println("用户名可以使用");
				resp.getWriter().print(true);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
}
