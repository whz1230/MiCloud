package com.mi.observer;


public class Client {

	public static void main(String[] args) {
		Person person = new Person();
		person.registListener(new MyPersonListener());
		person.eat();
		person.run();
	}

}
