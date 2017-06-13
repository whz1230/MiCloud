package com.mi.singleton;

/**
 * @Description 懒汉单例模式
 * @author wuhz
 * @date 2017-6-13 上午9:59:09
 */
public class LazySingleton {
	private static LazySingleton instance = null;

	private LazySingleton() {
	}

	/*��һ��
	synchronized public static LazySingleton getInstance() {
		if (instance == null) {
			instance = new LazySingleton();
		}
		return instance;
	}*/
	
	/*�ڶ���
	public static LazySingleton getInstance() {
		if (instance == null) {
			synchronized (LazySingleton.class) {
				instance = new LazySingleton();
			}
		}
		return instance;
	}*/
	
	public static LazySingleton getInstance() {
		//��һ���ж�
		if (instance == null) {
			//������
			synchronized (LazySingleton.class) {
				//�ڶ����ж�
				if (instance == null) {
					instance = new LazySingleton();//����ʵ��
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
		
		String s1 = new String("�ַ�");
		String s2 = new String("�ַ�");
		System.out.println(s2.equals(s2));
		System.out.println(s1 == s2);
	}
}
