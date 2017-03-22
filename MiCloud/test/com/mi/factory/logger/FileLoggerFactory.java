package com.mi.factory.logger;

/**
 * @Description �ļ���־��¼��������
 * @author whz
 * @date 2017-2-23 ����9:48:47
 */
public class FileLoggerFactory implements LoggerFactory {

	@Override
	public Logger createLogger() {
		Logger logger = new FileLogger();
		return logger;
	}
}
