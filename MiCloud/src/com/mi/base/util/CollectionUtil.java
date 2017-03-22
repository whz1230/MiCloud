package com.mi.base.util;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class CollectionUtil {
	public static String listToString(Collection<String> list) {
		if ((list == null) || (list.size() == 0)) {
			return "";
		}
		Iterator<String> i = list.iterator();
		boolean hasNext = i.hasNext();
		StringBuilder sb = new StringBuilder();
		while (hasNext) {
			String o = (String) i.next();
			sb.append(o);
			hasNext = i.hasNext();
			if (hasNext) {
				sb.append(",");
			}
		}
		return sb.toString();
	}

	public static boolean isListEmpty(List list) {
		return ((list != null) && (list.size()) > 0) ? true : false;
	}

	public static boolean isMapEmpty(Map map) {
		return ((map != null) && (!map.isEmpty())) ? true : false;
	}
}