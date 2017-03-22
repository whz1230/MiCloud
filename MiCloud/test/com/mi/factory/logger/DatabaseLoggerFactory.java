package com.mi.factory.logger;

/**
 * @Description 数据库日志记录器工厂类
 * @author whz
 * @date 2017-2-23 上午9:46:44
 */
public class DatabaseLoggerFactory implements LoggerFactory {

	@Override
	public Logger createLogger() {
		Logger logger = new DatabaseLogger();
		return logger;
	}
}
