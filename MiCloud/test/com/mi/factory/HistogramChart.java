package com.mi.factory;

/**
 * @Description ��״ͼ�ࣺ�����Ʒ��
 * @author whz
 * @date 2017-2-22 ����4:08:23
 */
public class HistogramChart implements Chart {
	public HistogramChart() {
		System.out.println("������״ͼ!");
	}

	@Override
	public void display() {
		System.out.println("��ʾ��״ͼ!");
	}
}
