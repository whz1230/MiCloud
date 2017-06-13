package com.mi.test;

import org.junit.Test;

public class SortTest {
	private static int[] data = { 9, 2, 7, 19, 100, 97, 63, 208, 55, 78 };

	public static void printf() {
		for (int i : data) {
			System.out.print(i + " ");
		}
	}

	/**
	 * 插入排序
	 */
	@Test
	public void insertSort() {
		printf();
		int tmp, j = 0;
		for (int k = 0; k < data.length; k++) {// -----1-----
			tmp = data[k];
			j = k - 1;
			while (j >= 0 && tmp < data[j]) {// -----2-----
				data[j + 1] = data[j];
				j--;
			}
			data[j + 1] = tmp;// ------3-------
		}
		System.out.println("\n");
		printf();
	}

	/**
	 * ѡ������
	 */
	@Test
	public void selectSort() {
		printf();
		int i, j, k, tmp = 0;
		for (i = 0; i < data.length - 1; i++) {
			k = i;
			for (j = i + 1; j < data.length; j++)
				if (data[j] < data[k])
					k = j;
			if (k != i) {
				tmp = data[i];
				data[i] = data[k];
				data[k] = tmp;
			}
		}
		System.out.println("\n");
		printf();
	}

	/**
	 * ð������
	 */
	@Test
	public void bubbleSort() {
		printf();
		int i, j, tmp = 0;
		for (i = 0; i < data.length - 1; i++) {
			for (j = data.length - 1; j > i; j--) {
				if (data[j] < data[j - 1]) {
					tmp = data[j];
					data[j] = data[j - 1];
					data[j - 1] = tmp;
				}
			}
		}
		System.out.println("\n");
		printf();
	}

}
