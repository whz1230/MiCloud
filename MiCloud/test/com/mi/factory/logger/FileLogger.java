package com.mi.factory.logger;

/**
 * @Description 文件日志记录器
 * @author whz
 * @date 2017-2-23 上午9:44:46
 */
public class FileLogger implements Logger {

	@Override
	public void writeLog() {
		System.out.println("文件日志记录。");
	}

}
