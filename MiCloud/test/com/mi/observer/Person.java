package com.mi.observer;

/**
 * @Description 事件源
 * @author whz
 * @date 2017-2-27 上午11:37:22
 */
public class Person {
	private PersonListener listener;

	public void registListener(PersonListener listener) {
		this.listener = listener;
	}

	public void run() {
		if (null != listener) {
			Even even = new Even(this);
			this.listener.doRun();
		}
		System.out.println("Person.run()");
	}

	public void eat() {
		if (null != listener) {
			Even even = new Even(this);
			this.listener.doEat();
		}
		System.out.println("Person.eat()");
	}

}
