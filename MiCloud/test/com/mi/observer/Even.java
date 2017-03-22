package com.mi.observer;

/**
 * @Description 事件对象(封装事件)
 * @author whz
 * @date 2017-2-27 上午11:39:54
 */
public class Even {

	private Person person;

	public Even() {
	}

	public Even(Person person) {
		super();
		this.person = person;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

}
