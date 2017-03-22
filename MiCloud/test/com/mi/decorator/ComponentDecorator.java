package com.mi.decorator;

public class ComponentDecorator extends Component {

	private Component component;

	public ComponentDecorator(Component component) {
		this.component = component;
	}

	@Override
	public void display() {
		this.component.display();
	}

}
