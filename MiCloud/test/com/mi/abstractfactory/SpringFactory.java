package com.mi.abstractfactory;

public class SpringFactory implements SkinFactory {

	@Override
	public Button createButton() {
		return new SpringButton();
	}

	@Override
	public ComboBox createComboBox() {
		return new SpringCombobox();
	}

	@Override
	public TextField createTextField() {
		return new SpringTextField();
	}

}
