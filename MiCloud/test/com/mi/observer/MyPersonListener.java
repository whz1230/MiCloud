package com.mi.observer;

public class MyPersonListener implements PersonListener {

	@Override
	public void doEat() {
		System.out.println("开始吃饭...");
	}

	@Override
	public void doRun() {
		System.out.println("开始跑步...");
	}

}
