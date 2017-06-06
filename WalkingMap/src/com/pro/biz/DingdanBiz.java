package com.pro.biz;

import java.util.List;

import com.pro.entity.Dingdan;
import com.pro.entity.Shop;
import com.pro.entity.Users;

public interface DingdanBiz {
	// 订单添加
	public int addDingdan(Dingdan dingdan) throws Exception;

	// 商家查询自己的货物订单
	public List<Dingdan> findDingdan(Users users) throws Exception;
}
