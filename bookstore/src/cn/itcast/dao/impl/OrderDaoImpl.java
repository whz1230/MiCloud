package cn.itcast.dao.impl;

import java.sql.Connection;
import java.util.List;
import java.util.Set;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.itcast.dao.OrderDao;
import cn.itcast.domain.Book;
import cn.itcast.domain.Order;
import cn.itcast.domain.OrderItem;
import cn.itcast.domain.User;
import cn.itcast.utils.JdbcUtils;

public class OrderDaoImpl implements OrderDao {
	
	public void add(Order o){
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "insert into orders(id,ordertime,state,price,user_id) values(?,?,?,?,?)";
			Object params[] = {o.getId(),o.getOrdertime(),o.isState(),o.getPrice(),o.getUser().getId()};
			runner.update(conn,sql, params);
			
			Set<OrderItem> set = o.getOrderitems();
			for(OrderItem item : set){
				sql = "insert into orderitem(id,quantity,price,book_id,order_id) values(?,?,?,?,?)";
				params = new Object[]{item.getId(),item.getQuantity(),item.getPrice(),item.getBook().getId(),o.getId()};
				runner.update(conn,sql, params);
			}
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public Order find(String id){
		
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			
			//�ҳ���������Ϣ
			String sql = "select * from orders where id=?";
			Order order = (Order) runner.query(conn,sql, id, new BeanHandler(Order.class));
			
			//�ҳ�order�е�ÿһ��������
			sql = "select * from orderitem where order_id=?";
			List<OrderItem> list = (List<OrderItem>) runner.query(conn,sql, id, new BeanListHandler(OrderItem.class));
			
			//�ҳ�ÿһ��������������
			for(OrderItem item : list){
				sql = "select b.* from orderitem oi,book b where oi.id=? and b.id=oi.book_id";
				Book book = (Book) runner.query(conn,sql, item.getId(), new BeanHandler(Book.class));
				item.setBook(book);
			}
			order.getOrderitems().addAll(list);
			
			//�ҳ��¶�������
			sql= "select u.* from orders o,user u where o.id=? and u.id=o.user_id";
			User user = (User) runner.query(conn,sql, id, new BeanHandler(User.class));
			
			order.setUser(user);
			
			return order;
			
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * state:true:�ѷ���
	 * state:false;δ����
	 */
	public List<Order> getAll(boolean state){
		
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "select * from orders where state=?";
			List<Order> list = (List<Order>) runner.query(conn,sql, state, new BeanListHandler(Order.class));
			
			for(Order o : list){
				sql= "select u.* from orders o,user u where o.id=? and u.id=o.user_id";
				User user = (User) runner.query(conn,sql, o.getId(), new BeanHandler(User.class));
				o.setUser(user);
			}
			
			return list;
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public void update(String id,boolean state){
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "update orders set state=? where id=?";
			Object params[] = {state,id};
			runner.update(conn,sql,params);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}
}
