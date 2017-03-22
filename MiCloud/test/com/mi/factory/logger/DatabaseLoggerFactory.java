package com.mi.factory.logger;

/**
 * @Description ���ݿ���־��¼��������
 * @author whz
 * @date 2017-2-23 ����9:46:44
 */
public class DatabaseLoggerFactory implements LoggerFactory {

	@Override
	public Logger createLogger() {
		Logger logger = new DatabaseLogger();
		return logger;
	}
}
