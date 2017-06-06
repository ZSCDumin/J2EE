package com.pro.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.biz.UserBiz;
import com.pro.biz.UserBizImpl;
import com.pro.entity.Users;
@WebServlet("/FindUser")
public class FindUser extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
                String  username=request.getParameter("username");
		        UserBiz userBiz=new UserBizImpl();
                 try {
					
                	 Users user=userBiz.finByNameUser(username);
                	 System.out.println(user.getId());
				      if(user!=null){
				    	  request.setAttribute("user", user);
				    	  request.getRequestDispatcher("locateUser.jsp").forward(request, response);
				      }else{
				    	  request.setAttribute("user", user);
				    	  request.setAttribute("findError", "查无此人");
				    	  request.getRequestDispatcher("locateUser.jsp").forward(request, response);
				      }
                 } catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		 
	}

}
