package com.mi.factory.logger;

/**
 * @Description 数据库日志记录器
 * @author whz
 * @date 2017-2-23 上午9:43:45
 */
public class DatabaseLogger implements Logger {

	@Override
	public void writeLog() {
		System.out.println("数据库日志记录。");
	}

}
