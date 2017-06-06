package com.pro.servlet;

import java.awt.Image;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.swing.RepaintManager;
import javax.websocket.Session;

import com.pro.biz.GoodsBiz;
import com.pro.biz.GoodsBizImpl;
import com.pro.entity.Goods;
import com.pro.entity.Users;

@MultipartConfig
@WebServlet("/AddGoods")
public class AddGoods extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String goodsname = req.getParameter("goodsname");
		String price = req.getParameter("price");
		String count = req.getParameter("count");
		String userid = req.getParameter("userid");
		String comment = req.getParameter("comment");
		Part part = req.getPart("img");
		String filename = part.getHeader("content-disposition");// 获取包含文件名的信息
		String s[] = filename.split(";");
		String sa = "filename=\"";
		String name = s[s.length - 1].substring(sa.length() + 1,
				s[s.length - 1].length() - 1);
		InputStream inputStream = part.getInputStream();
		String impath = req.getServletContext().getRealPath("/upload/" + name);
		OutputStream outputStream = new FileOutputStream(impath);
		byte bar[] = new byte[1024];
		int l = 0;
		while ((l = inputStream.read(bar)) != -1) {
			outputStream.write(bar, 0, l);
			outputStream.flush();
		}
		outputStream.close();
		inputStream.close();
        HttpSession session=req.getSession();
		Users users=(Users)session.getAttribute("user");
        Goods goods=new Goods();
        goods.setComment(comment);
        goods.setCount(Integer.valueOf(count));
        goods.setDate(new Date().toLocaleString());
        goods.setImage(name);
        goods.setGoodsname(goodsname);
        goods.setUsers(users);
        goods.setPrice(Double.valueOf(price));
	    GoodsBiz goodsBiz=new GoodsBizImpl();
	    try {
			if(goodsBiz.addGood(goods)>0){
			   resp.sendRedirect("findAllGoods");	
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
