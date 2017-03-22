package com.mi.abstractfactory;

public class SummerFactory implements SkinFactory {

	@Override
	public Button createButton() {
		return new SummerButton();
	}

	@Override
	public ComboBox createComboBox() {
		return new SummerCombobox();
	}

	@Override
	public TextField createTextField() {
		return new SummerTextField();
	}
}
