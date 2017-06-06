package com.pro.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.biz.GoodsBiz;
import com.pro.biz.GoodsBizImpl;
import com.pro.entity.Goods;
import com.pro.entity.Users;

@WebServlet("/FindGoodByName")
public class FindGoodByName  extends HttpServlet{

	  @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		 req.setCharacterEncoding("utf-8");
		  HttpSession session=req.getSession();
		  Users user=(Users)session.getAttribute("user");
		    String goodsname=req.getParameter("goodsname");
		  GoodsBiz goodsBiz=new GoodsBizImpl();
		   Goods goods=new Goods();
		   goods.setGoodsname(goodsname);
		   goods.setUsers(user);
		   List<Goods> list;
		   try {
			if((list=goodsBiz.findGoodsByUseidAndGoodsname(goods))!=null){
				req.setAttribute("list", list);
				req.getRequestDispatcher("LocateGoods.jsp").forward(req, resp);
			}else{
				resp.getWriter().print("为空");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
