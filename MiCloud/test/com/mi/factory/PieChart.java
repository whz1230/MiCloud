package com.mi.factory;

/**
 * @Description ��״ͼ�ࣺ�����Ʒ��
 * @author whz
 * @date 2017-2-22 ����4:10:22
 */
public class PieChart implements Chart {
	public PieChart() {
		System.out.println("������״ͼ��");
	}

	@Override
	public void display() {
		System.out.println("��ʾ��״ͼ��");
	}
}
