package com.mi.tree.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.stereotype.Repository;

import com.mi.base.dao.impl.MediatorImpl;
import com.mi.tree.dao.CategoryDao;
import com.mi.tree.vo.Category;

@Repository("categoryDao")
public class CategoryDaoImpl extends MediatorImpl implements CategoryDao {

	@Override
	public List queryAll() throws DataAccessException {
		final String sql = "select child.id, child.name,count(child.name) depth from category parent,category child where child.lft >= parent.lft and child.rgt <= parent.rgt group by child.id, child.name";
		return getJdbcTemplate().query(sql, new ParameterizedRowMapper<Category>() {
			@Override
			public Category mapRow(ResultSet rs, int rowNum) throws SQLException {
				Category vo = new Category();
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setDepth(rs.getInt("depth"));
				return vo;
			}
		});
	}

}
