package com.mi.decorator;

public class BlackBorderDecorator extends ComponentDecorator {

	public BlackBorderDecorator(Component component) {
		super(component);
	}

	@Override
	public void display() {
		this.setBlackBorder();
		super.display();
	}

	public void setBlackBorder() {
		System.out.println("Ϊ�������Ӻ�ɫ�߿�");
	}
}
