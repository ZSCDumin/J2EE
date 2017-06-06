package com.pro.biz;

import java.util.List;

import com.pro.dao.GoodsDao;
import com.pro.dao.GoodsImpl;
import com.pro.entity.Goods;

public class GoodsBizImpl implements GoodsBiz {
	private GoodsDao goodsdao = new GoodsImpl();

	@Override
	public int addGood(Goods good) throws Exception {
		// TODO Auto-generated method stub
		return goodsdao.addGood(good);
	}

	@Override
	public List<Goods> findGoodsByUseidAndGoodsname(Goods goods) throws Exception {
		return goodsdao.findGoodsByUseidAndGoodsname(goods);
	}

	@Override
	public List<Goods> findAllGoods(int userid, int page, int number) throws Exception {
		// TODO Auto-generated method stub
		return goodsdao.findAllGoods(userid, page, number);
	}

	@Override
	public int GoodsPages(int number) throws Exception {
		return goodsdao.GoodsPages(number);
	}

	@Override
	public Goods findByIdGoods(int id) throws Exception {

		return goodsdao.findByIdGoods(id);
	}

	@Override
	public int modifyGood(Goods good) throws Exception {
		// TODO Auto-generated method stub
		return goodsdao.modifyGood(good);
	}

	@Override
	public int deleteGood(int id) throws Exception {
		// TODO Auto-generated method stub
		return goodsdao.deleteGood(id);
	}

	@Override
	public List<Goods> findAllGoods(int page, int number) throws Exception {
		// TODO Auto-generated method stub
		return goodsdao.findAllGoods(page, number);
	}

	@Override
	public int deleteByIdGoods(int id) throws Exception {
		return goodsdao.deleteByIdGoods(id);
	}

	@Override
	public int downByGoods(int id, int count) throws Exception {
		// TODO Auto-generated method stub
		return goodsdao.downByGoods(id, count);
	}

}
