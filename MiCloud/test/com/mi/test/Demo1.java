package com.mi.test;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;



public class Demo1 {

	public static void main(String[] args) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("a", "aa");
		map.put("c", "cc");
		map.put("b", "bb");
		map.put(null, "dd");
		
		System.out.println(map.values());
		System.out.println(map.keySet());
		System.out.println(map.entrySet());
		
		Set<Entry<String, String>>  set = map.entrySet();
		for (Entry<String, String> entry : set) {
			String key = entry.getKey();
			String value = entry.getValue();
			
			System.out.println(key + " = " + value);
		}
		
		Set<String> set2 = map.keySet();
		for (String key : set2) {
			System.out.println(map.get(key));
		}
	
	}
	
	
}
