package com.mi.factory.logger;

public class Client {

	public static void main(String[] args) {
		LoggerFactory factory = (LoggerFactory) XMLUtil.getBean();
		Logger logger = factory.createLogger();
		logger.writeLog();
	}

}
