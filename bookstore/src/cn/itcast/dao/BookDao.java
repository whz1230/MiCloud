package cn.itcast.dao;

import java.util.List;

import cn.itcast.domain.Book;
import cn.itcast.domain.QueryResult;

public interface BookDao {

	void add(Book b);

	Book find(String id);

	QueryResult pageQuery(int startindex, int pagesize, String where,
			Object param);
	public List getAll();

}