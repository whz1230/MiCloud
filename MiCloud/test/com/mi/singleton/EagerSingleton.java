package com.mi.singleton;

/**
 * @Description 恶汉式单例模式
 * @author whz
 * @date 2017-2-22 下午3:25:50
 */
public class EagerSingleton {
	private static final EagerSingleton instance = new EagerSingleton();

	private EagerSingleton() {
	}

	public static EagerSingleton getInstance() {
		return instance;
	}
}
