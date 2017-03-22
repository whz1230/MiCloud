package com.mi.factory;

/**
 * @Description 柱状图类：具体产品类
 * @author whz
 * @date 2017-2-22 下午4:08:23
 */
public class HistogramChart implements Chart {
	public HistogramChart() {
		System.out.println("创建柱状图!");
	}

	@Override
	public void display() {
		System.out.println("显示柱状图!");
	}
}
