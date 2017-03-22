package com.mi.singleton;

public class Singleton {

	private Singleton() {
	}

	public static Singleton getInstance() {
		return SingletonHolder.instance;
	}

	private static class SingletonHolder {
		private final static Singleton instance = new Singleton();
	}
}
