package com.mi.observer;

public class MyPersonListener implements PersonListener {

	@Override
	public void doEat() {
		System.out.println("��ʼ�Է�...");
	}

	@Override
	public void doRun() {
		System.out.println("��ʼ�ܲ�...");
	}

}
