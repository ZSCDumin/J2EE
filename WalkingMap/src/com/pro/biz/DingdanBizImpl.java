package com.pro.biz;

import java.util.List;

import com.pro.dao.DingdanDao;
import com.pro.dao.DingdanImpl;
import com.pro.entity.Dingdan;
import com.pro.entity.Users;
import com.pro.servlet.deleteUser;

public class DingdanBizImpl implements DingdanBiz {
    private DingdanDao DingdanDao=new DingdanImpl();
	@Override
	public int addDingdan(Dingdan dingdan) throws Exception {
		// TODO Auto-generated method stub
		return DingdanDao.addDingdan(dingdan);
	}
	@Override
	public List<Dingdan> findDingdan(Users users) throws Exception {
		return DingdanDao.findDingdan(users);
	}

}
