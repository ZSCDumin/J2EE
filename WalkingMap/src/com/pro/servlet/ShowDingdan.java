package com.pro.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.biz.DingdanBiz;
import com.pro.biz.DingdanBizImpl;
import com.pro.biz.UserBiz;
import com.pro.biz.UserBizImpl;
import com.pro.entity.Dingdan;
import com.pro.entity.Users;

@WebServlet("/ShowDingdan")
public class ShowDingdan extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		DingdanBiz dingdanBiz = new DingdanBizImpl();
		UserBiz userBiz = new UserBizImpl();
		Users users = (Users) session.getAttribute("user");
		System.out.println(users.getId());
		List<Dingdan> list;
		try {
			if ((list = dingdanBiz.findDingdan(users)) != null) {
				req.setAttribute("list", list);
				req.getRequestDispatcher("dingdan.jsp").forward(req, resp);
			} else {
				resp.setCharacterEncoding("utf-8");
				resp.getWriter().print("抱歉没有人买你的商品,暂无生成订单");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
