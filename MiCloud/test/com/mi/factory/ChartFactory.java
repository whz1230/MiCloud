package com.mi.factory;

/**
 * @Description ͼ�����ࣺ������
 * @author whz
 * @date 2017-2-22 ����4:12:56
 */
public class ChartFactory {
	// ��̬��������
	public static Chart getChart(String type) {
		Chart chart = null;
		if (type.equalsIgnoreCase("histogram")) {
			chart = new HistogramChart();
			System.out.println("��ʼ��������״ͼ��");
		} else if (type.equalsIgnoreCase("pie")) {
			chart = new PieChart();
			System.out.println("��ʼ�����ñ�״ͼ��");
		} else if (type.equalsIgnoreCase("line")) {
			chart = new LineChart();
			System.out.println("��ʼ����������ͼ��");
		}
		return chart;
	}

}
