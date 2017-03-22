package com.mi.factory;

/**
 * @Description 饼状图类：具体产品类
 * @author whz
 * @date 2017-2-22 下午4:10:22
 */
public class PieChart implements Chart {
	public PieChart() {
		System.out.println("创建饼状图！");
	}

	@Override
	public void display() {
		System.out.println("显示饼状图！");
	}
}
