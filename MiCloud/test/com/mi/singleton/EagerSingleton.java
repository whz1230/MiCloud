package com.mi.singleton;

/**
 * @Description 恶汉式单例模式
 * @author wuhz
 * @date 2017-6-13 上午9:58:56
 */
public class EagerSingleton {
	private static final EagerSingleton instance = new EagerSingleton();

	private EagerSingleton() {
	}

	public static EagerSingleton getInstance() {
		return instance;
	}
}
