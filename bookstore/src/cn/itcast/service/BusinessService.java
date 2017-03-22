package cn.itcast.service;

import java.util.List;

import cn.itcast.domain.Book;
import cn.itcast.domain.Cart;
import cn.itcast.domain.Category;
import cn.itcast.domain.Order;
import cn.itcast.domain.PageBean;
import cn.itcast.domain.QueryInfo;
import cn.itcast.domain.User;

public interface BusinessService {

	/****************************************
	 * 
	 * 分类相关的服务
	 * 
	 **************************************/
	void addCategory(Category c);

	Category findCategory(String id);

	List getAllCategory();

	/****************************************
	 * 
	 * 图书相关的服务
	 * 
	 **************************************/
	void addBook(Book book);

	Book findBook(String id);

	PageBean bookPageQuery(QueryInfo info);
	public List getAllBook();

	/****************************************
	 * 
	 * 用户相关的服务
	 * 
	 **************************************/
	void addUser(User user);

	User findUser(String username, String password);

	User findUser(String id);

	/****************************************
	 * 
	 * 订单相关的服务
	 * 
	 **************************************/

	void saveOrder(Cart cart, User user);

	Order findOrder(String id);

	List getOrderByState(boolean state);
	
	public void updateOrder(String id,boolean state);

}