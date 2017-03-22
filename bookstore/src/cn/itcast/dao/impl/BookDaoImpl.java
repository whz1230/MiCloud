package cn.itcast.dao.impl;

import java.sql.Connection;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.dao.BookDao;
import cn.itcast.domain.Book;
import cn.itcast.domain.QueryResult;
import cn.itcast.utils.JdbcUtils;

public class BookDaoImpl implements BookDao {

	public void add(Book b){
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "insert into book(id,name,price,author,image,description,category_id) values(?,?,?,?,?,?,?)";
			Object params[] = {b.getId(),b.getName(),b.getPrice(),b.getAuthor(),b.getImage(),b.getDescription(),b.getCategory().getId()};
			runner.update(conn, sql, params);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}
	
	public Book find(String id){
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "select * from book where id=?";
			return (Book) runner.query(conn,sql, id, new  BeanHandler(Book.class));
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	//String where =  "where category_id=?"
	/*
	 * �û���where������������÷������ط�������ķ�ҳ��
	 * ���û��where�������򷵻�������ķ�ҳ����
	 * 
	 * where�����ĸ�ʽ��String where =  "where category_id=?"
	 * 
	 */
	
	private List<Book> getPageDate(int startindex,int pagesize,String where,Object param){
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			if(where==null || where.trim().equals("")){
				//�򷵻�������ķ�ҳ����
				String sql = "select * from book limit ?,?";
				Object params[] = {startindex,pagesize};
				return (List<Book>) runner.query(conn, sql, params, new BeanListHandler(Book.class));
			}else{
				String sql = "select * from book "+ where + " limit ?,?";
				Object params[] = {param,startindex,pagesize};
				return (List<Book>) runner.query(conn, sql, params, new BeanListHandler(Book.class));
			}
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	private int getPageTotalRecord(String where,Object param){
		
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			if(where==null || where.trim().equals("")){
				String sql = "select count(*) from book";
				return ((Long)runner.query(conn, sql, new ScalarHandler())).intValue();
			}else{
				String sql = "select count(*) from book " + where;
				return ((Long)runner.query(conn, sql, param,new ScalarHandler())).intValue();
			}
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public QueryResult pageQuery(int startindex,int pagesize,String where,Object param){
		List list = getPageDate(startindex, pagesize, where, param);
		int totalrecord = getPageTotalRecord(where, param);
		QueryResult result = new QueryResult();
		result.setList(list);
		result.setTotalrecord(totalrecord);
		return result;
	}
	
	public List getAll(){
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "select * from book";
			return (List) runner.query(conn,sql,new  BeanListHandler(Book.class));
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
}
