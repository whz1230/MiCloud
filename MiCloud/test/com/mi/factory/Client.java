package com.mi.factory;

public class Client {

	public static void main(String[] args) {
		String type = XMLUtil.getChartType();
		Chart chart = ChartFactory.getChart(type);
		chart.display();
	}
}
