package com.pro.biz;

import com.pro.dao.DingdanDao;
import com.pro.dao.DingdanImpl;
import com.pro.dao.ShopDao;
import com.pro.dao.ShopImpl;
import com.pro.entity.Dingdan;
import com.pro.entity.Shop;
import com.pro.servlet.deleteUser;

public class ShopBizImpl implements ShopBiz {
	private ShopDao shopDao = new ShopImpl();

	@Override
	public int addShop(Shop shop) throws Exception {
		// TODO Auto-generated method stub
		return shopDao.addShop(shop);
	}

	@Override
	public int findShopID(Shop shop) throws Exception {
		// TODO Auto-generated method stub
		return shopDao.findShopID(shop);
	}

}
