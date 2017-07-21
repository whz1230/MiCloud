package com.mi.util;

import java.io.IOException;
import java.util.Properties;

public class PropertieUtils {
	private static Properties prop = new Properties();

	static {
		try {
			prop.load(PropertieUtils.class.getClassLoader().getResourceAsStream("sys.properties"));
		} catch (IOException e) {
			throw new ExceptionInInitializerError(e);
		}
	}

	public static String getProp(String key) {
		return prop.getProperty(key);
	}

}
