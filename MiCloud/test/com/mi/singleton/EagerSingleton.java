package com.mi.singleton;

/**
 * @Description ��ʽ����ģʽ
 * @author whz
 * @date 2017-2-22 ����3:25:50
 */
public class EagerSingleton {
	private static final EagerSingleton instance = new EagerSingleton();

	private EagerSingleton() {
	}

	public static EagerSingleton getInstance() {
		return instance;
	}
}
