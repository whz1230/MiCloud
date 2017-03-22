package com.mi.factory;

import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class XMLUtil {
	// 该方法用于从XML配置文件中提取图表类型，并返回类型名
	public static String getChartType() {
		String chartType = "";
		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder = factory.newDocumentBuilder();
			Document document = documentBuilder.parse("junitTest/com/mi/factory/conf.xml");

			NodeList list = document.getElementsByTagName("chartType");
			Node node = list.item(0).getFirstChild();
			chartType = node.getNodeValue();

		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return chartType;
	}
}
