package com.mi.base.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.LockMode;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

public interface Mediator {

	public HibernateTemplate getHibernateTemplate() throws DataAccessException;

	public JdbcTemplate getJdbcTemplate() throws DataAccessException;

	public int insertHiber(Object param) throws DataAccessException;

	public int updateJDBC(String hql, Object[] params) throws DataAccessException;

	public int updateHiber(String hql, Object[] params) throws DataAccessException;

	public int updateHiberComposedQuery(String hql, Object[] params) throws DataAccessException;

	public int deleteHiber(Object param) throws DataAccessException;

	public int deleteHiber(Class<?> clazz, Serializable id) throws DataAccessException;

	public int updateHiber(Object param) throws DataAccessException;

	public int merge_Hibernate_Object(Object param) throws DataAccessException;

	public void evictObject(Object param) throws DataAccessException;

	public int updateHiberNamedQuery(String hql, Object[] params) throws DataAccessException;

	public Object loadHiber(Class<?> clazz, Serializable id) throws DataAccessException;

	public Object getHiber(Class<?> clazz, Serializable id) throws DataAccessException;

	public Object getHiber(Class<?> clazz, Serializable id, LockMode lockMode) throws DataAccessException;

	public Object queryHiberComposedHQL(String hql, Serializable id) throws DataAccessException;

	public List<?> findAll_Hibernate_Object(Class<?> clazz) throws DataAccessException;

	public List<Map<?, ?>> queryJDBC(String hql) throws DataAccessException;

	public List<?> findAll_Hibernate_ComposedHQL(String hql) throws DataAccessException;

	public List<?> findAll_Hibernate_NamedQuery(String hql) throws DataAccessException;

	public Object[] queryHiber(String hql1, String[] param1, String[] param2, Object[] params, int paramInt1, int paramInt2, boolean paramBoolean, String hql2, String hql3,
			String hql4) throws DataAccessException;

	public List<?> queryHiber(String hql, Object[] params) throws DataAccessException;

	public void saveOrUpdate(Object param) throws DataAccessException;

	public Serializable insertHiber2(Object param) throws DataAccessException;

	public int updateByHql(String hql) throws DataAccessException;

	public void clearHibernate() throws DataAccessException;

	public void flushHibernate() throws DataAccessException;

	public Session getHibernateSession() throws DataAccessException;

	public Serializable[] insertHiberBatch(List<?> list) throws DataAccessException;

	public void updateHiberBatch(List<?> list) throws DataAccessException;

	public void deleteHiberBatch(List<?> list) throws DataAccessException;

	public void saveOrUpdateBatch(List<?> list) throws DataAccessException;
}
