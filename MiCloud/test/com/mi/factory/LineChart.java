package com.mi.factory;

/**
 * @Description 折线图类：具体产品类
 * @author whz
 * @date 2017-2-22 下午4:12:22
 */
public class LineChart implements Chart {
	public LineChart() {
		System.out.println("创建折线图！");
	}

	@Override
	public void display() {
		System.out.println("显示折线图！");
	}
}
