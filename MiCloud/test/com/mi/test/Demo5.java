package com.mi.test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class Demo5 {

	public static void main(String[] args) {

		List<String> list = new ArrayList<String>();
		list.add("aa");
		list.add("bb");
		String[] array = new String[list.size()];
		array = list.toArray(array);
		Arrays.asList(array);

		Map<String, String> map = new HashMap<String, String>();
		map.put("aa", "a1");
		map.put("bb", "b1");
		map.put("cc", "c1");

		Set<Entry<String, String>> set = map.entrySet();
		for (Entry<String, String> entry : set) {
			System.out.println(entry.getKey());
			System.out.println(entry.getValue());
		}
		
		String temp = "a,b,c,,";
		String[] ary = temp.split(",");
		System.out.println(ary.length);
		
	}

}
