package com.mi.singleton;

/**
 * @Description 懒汉单例模式
 * @author whz
 * @date 2017-2-22 下午3:28:19
 */
public class LazySingleton {
	private static LazySingleton instance = null;

	private LazySingleton() {
	}

	/*第一种
	synchronized public static LazySingleton getInstance() {
		if (instance == null) {
			instance = new LazySingleton();
		}
		return instance;
	}*/
	
	/*第二种
	public static LazySingleton getInstance() {
		if (instance == null) {
			synchronized (LazySingleton.class) {
				instance = new LazySingleton();
			}
		}
		return instance;
	}*/
	
	public static LazySingleton getInstance() {
		//第一重判断
		if (instance == null) {
			//锁定代码块
			synchronized (LazySingleton.class) {
				//第二重判断
				if (instance == null) {
					instance = new LazySingleton();//创建实例
				}
			}
		}
		return instance;
	}
	
	public static void main(String[] args) {
		LazySingleton l1 = LazySingleton.getInstance();
		LazySingleton l2 = LazySingleton.getInstance();
		System.out.println(l1.equals(l2));
		System.out.println(l1 == l2);
		
		String s1 = new String("字符串");
		String s2 = new String("字符串");
		System.out.println(s2.equals(s2));
		System.out.println(s1 == s2);
	}
}
