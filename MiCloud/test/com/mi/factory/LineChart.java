package com.mi.factory;

/**
 * @Description ����ͼ�ࣺ�����Ʒ��
 * @author whz
 * @date 2017-2-22 ����4:12:22
 */
public class LineChart implements Chart {
	public LineChart() {
		System.out.println("��������ͼ��");
	}

	@Override
	public void display() {
		System.out.println("��ʾ����ͼ��");
	}
}
