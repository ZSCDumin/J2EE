package com.pro.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.ssi.SSICommand;

import com.pro.entity.Goods;

@WebServlet("/CarItem")
public class CarItem extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String price = req.getParameter("price");
		String count = req.getParameter("count");
		String goodsname = req.getParameter("goodsname");
		String image = req.getParameter("image");
		System.out.println(image);
		System.out.println(goodsname);
		
		
		Goods goods = new Goods();
		goods.setId(Integer.valueOf(id));
		goods.setPrice(Double.valueOf(price));
		goods.setCount(Integer.valueOf(count));
	    goods.setGoodsname(goodsname);
	    goods.setImage(image);
		HttpSession session = req.getSession();
		Map<Integer, Goods> carMap;
		// 1.购物车是否存在
		if (session.getAttribute("car") == null) {
			carMap = new HashMap<Integer, Goods>();
		} else {
			carMap = (Map<Integer, Goods>) session.getAttribute("car");
		}
		// 2.购物车有我要插入的对象 数量相加
		if (carMap.containsKey(goods.getId())) {
			System.out.println("进入");
	        System.out.println(carMap.get(goods.getId()).getCount());   
            System.out.println(goods.getCount());	 
          System.out.println(goods.getCount() + carMap.get(goods.getId()).getCount());  
            carMap.get(goods.getId()).setCount(
            		goods.getCount() + carMap.get(goods.getId()).getCount()
					);
		} else {
			carMap.put(goods.getId(), goods);
		}
		// 3.保存在session中
		session.setAttribute("car", carMap);
		resp.sendRedirect("buycar.jsp");
	}
}
