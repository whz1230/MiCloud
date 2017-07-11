package com.mi.test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Demo3 {

	public static void main(String[] args) {
		Copy("C:\\Users\\Administrator\\Desktop\\UtilTransform.java", "C:\\Users\\Administrator\\Desktop\\UtilTransformNew.java");
		// test();
	}

	private static void test() {
		String path = "F:\\lib\\src\\ridolplatform-frame.src\\com\\ritoinfo\\ridolplatform\\base";
		String pathNew = "E:\\lib\\src\\ridolplatform-frame.src\\com\\ritoinfo\\ridolplatform\\base";

		File file = new File(path);
		List<File> list = showAllFiles(file);
		for (File f : list) {
			String fileName = f.getName();
			String filePath = f.getAbsolutePath();
			if (f.isFile()) {
				System.out.println(fileName);
				System.out.println(filePath);
			} else {

			}
		}
	}

	public static void Copy(String oldPath, String newPath) {
		BufferedReader reader = null;
		BufferedWriter writer = null;
		try {
			reader = new BufferedReader(new FileReader(new File(oldPath)));
			writer = new BufferedWriter(new FileWriter(new File(newPath)));
			String buff = null;
			while ((buff = reader.readLine()) != null) {
				int index = buff.lastIndexOf("*/");
				if (index > 0) {
					String value = buff.substring(index + 2);
					System.out.println(value);
					writer.write(value + "\r");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				reader.close();
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public final static List<File> showAllFiles(File file) {
		List<File> list = new ArrayList<File>();

		File[] fs = file.listFiles();
		list.addAll(Arrays.asList(fs));
		for (int i = 0; i < fs.length; i++) {
			if (fs[i].isDirectory()) {
				try {
					list.addAll(showAllFiles(fs[i]));
				} catch (Exception e) {
				}
			}
		}

		return list;
	}
}
