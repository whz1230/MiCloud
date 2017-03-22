package com.mi.decorator;

public class Client {

	public static void main(String[] args) {
		Component component = new Window();
		Component component2 = new ScrollBarDecorator(component);
		component2.display();
	}
}
