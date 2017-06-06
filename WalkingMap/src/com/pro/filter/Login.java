package com.pro.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.pro.entity.Users;
public class Login implements Filter {
	@Override
	public void destroy() {
		System.out.println("过滤器销毁");
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		HttpSession session = request.getSession();
         Users users=(Users)session.getAttribute("user");
 		String url = request.getRequestURI(); 
 		System.out.print(url);
 		if(url.equals("/Shoping/UserLogin/Shoping/assets/css/bootstrap.min.css/Shoping/assets/css/font-awesome.min.css/Shoping/assets/css/ace.min.css/Shoping/assets/css/ace-rtl.min.css/Shoping/assets/js/jquery-2.0.3.min.js")){
 			arg2.doFilter(request,response);
 			System.out.println(11);
 			
 		}else {
			if(users==null){
				request.getRequestDispatcher("login.jsp").forward(request,response);
			}else{
	 			arg2.doFilter(request,response);
			}
		}
         
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("过滤器开始");
	}

}
