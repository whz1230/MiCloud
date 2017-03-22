package com.mi.factory.logger;

/**
 * @Description 文件日志记录器工厂类
 * @author whz
 * @date 2017-2-23 上午9:48:47
 */
public class FileLoggerFactory implements LoggerFactory {

	@Override
	public Logger createLogger() {
		Logger logger = new FileLogger();
		return logger;
	}
}
