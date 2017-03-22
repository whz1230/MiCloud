package cn.itcast.dao.impl;

import java.sql.Connection;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.itcast.dao.CategoryDao;
import cn.itcast.domain.Category;
import cn.itcast.utils.JdbcUtils;

public class CategoryDaoImpl implements CategoryDao {

	public void add(Category c){
	
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "insert into category(id,name,description) values(?,?,?)";
			Object params[] = {c.getId(),c.getName(),c.getDescription()};
			runner.update(conn, sql, params);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public Category find(String id){
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "select * from category where id=?";
			return (Category) runner.query(conn, sql, id, new BeanHandler(Category.class));
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	
	public List getAll(){
		try{
			Connection conn = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "select * from category";
			return (List) runner.query(conn, sql, new BeanListHandler(Category.class));
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}	
