package com.mi.test;

import java.util.Random;

public class Poker {
	private static String[] suites = { "����", "����", "�ݻ�", "����" };
	private static int[] faces = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 };

	private Card[] cards;

	public Poker() {
		cards = new Card[suites.length * faces.length];
		for (int i = 0; i < suites.length; i++) {
			for (int j = 0; j < faces.length; j++) {
				cards[i * 13 + j] = new Card(suites[i], faces[j]);
			}
		}
		System.out.println(cards.toString());
	}

	public void shuffle() {
		for (int i = 0; i < cards.length; i++) {
			int index = (int) (Math.random() * cards.length);
			Card temp = cards[index];
			cards[index] = cards[i];
			cards[i] = temp;

		}
	}

	public Card deal(int index) {
		return cards[index];
	}

	public class Card {
		private String suite; // ��ɫ
		private int face; // ����

		public Card(String suite, int face) {
			this.suite = suite;
			this.face = face;
		}

		@Override
		public String toString() {
			String value = "";
			switch (face) {
			case 1:
				value = "A";
				break;
			case 11:
				value = "J";
				break;
			case 12:
				value = "Q";
				break;
			case 13:
				value = "K";
				break;
			default:
				value = String.valueOf(face);
				break;
			}
			return suite + value;
		}
	}

	public static void main(String[] args) {
		Poker poker = new Poker();
		poker.shuffle(); // ϴ��
		Poker.Card c1 = poker.deal(0); // ����һ����
		// ���ڷǾ�̬�ڲ���Card
		// ֻ��ͨ�����ⲿ��Poker������ܴ���Card����
		Poker.Card c2 = poker.new Card("����", 1); // �Լ�����һ����

		System.out.println(c1); // ϴ�ƺ�ĵ�һ��
		System.out.println(c2); // ��ӡ: ����A
	}
}
