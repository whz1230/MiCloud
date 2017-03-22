package com.mi.test;

import com.mi.base.service.BaseService;
import com.mi.base.service.BaseServiceImpl;


public class Demo7 {
	BaseService baseService = new BaseServiceImpl();
	
	public void testname() throws Exception {
		baseService.queryOneHiber(Demo7.class, "11");
		
	}
	
}
