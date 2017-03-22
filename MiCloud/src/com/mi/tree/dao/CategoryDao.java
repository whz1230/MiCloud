package com.mi.tree.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mi.base.dao.Mediator;

public interface CategoryDao extends Mediator {

	public List queryAll() throws DataAccessException;
}
