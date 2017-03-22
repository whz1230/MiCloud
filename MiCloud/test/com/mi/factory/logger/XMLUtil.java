package com.mi.factory.logger;

import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class XMLUtil {

	@SuppressWarnings("rawtypes")
	public static Object getBean() {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		try {
			// ����DOM�ĵ�����
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document document = builder.parse("junitTest/com/mi/factory/logger/conf.xml");
			// ��ȡ�����������ı��ڵ�
			NodeList list = document.getElementsByTagName("className");
			String className = list.item(0).getFirstChild().getNodeValue();
			// ͨ����������ʵ�����󲢽��䷵��
			Class clazz = Class.forName(className);
			Object object = clazz.newInstance();

			return object;
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return null;
	}
}
