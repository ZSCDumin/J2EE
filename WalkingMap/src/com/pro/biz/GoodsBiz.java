package com.pro.biz;

import java.util.List;

import com.pro.entity.Goods;
import com.pro.entity.Users;

public interface GoodsBiz {
	// 商品添加
	public int addGood(Goods good) throws Exception;

	// 通过名字查询自己的商品是否存在 模糊查询
	public List<Goods> findGoodsByUseidAndGoodsname(Goods goods) throws Exception;

	// 查询自己的第一页商品
	public List<Goods> findAllGoods(int userid, int page, int number) throws Exception;

	// 查询自己的页数
	public int GoodsPages(int number) throws Exception;

	// 通过id查询商品信息
	public Goods findByIdGoods(int id) throws Exception;

	// 修改商品信息
	public int modifyGood(Goods good) throws Exception;

	// 删除商品信息
	public int deleteGood(int id) throws Exception;

	// 前台显示所有商品
	public List<Goods> findAllGoods(int page, int number) throws Exception;

	// 关闭商品,设置状态 码
	public int deleteByIdGoods(int id) throws Exception;

	// 减少
	public int downByGoods(int id, int count) throws Exception;

}
