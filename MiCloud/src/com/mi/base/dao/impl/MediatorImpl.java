package com.mi.base.dao.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.FlushMode;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.mi.base.dao.Mediator;
import com.mi.base.util.CollectionUtil;

@Repository("mediator")
public class MediatorImpl implements Mediator {
	protected final Log logger = LogFactory.getLog(getClass());
	@Resource
	private SessionFactory sessionFactory;
	@Resource
	private DataSource dataSource;
	private HibernateTemplate hibernateTemplate;
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() throws DataAccessException {
		if (this.jdbcTemplate == null) {
			this.jdbcTemplate = new JdbcTemplate(this.dataSource);
		}
		return this.jdbcTemplate;
	}

	public HibernateTemplate getHibernateTemplate() throws DataAccessException {
		if (this.hibernateTemplate == null) {
			this.hibernateTemplate = new HibernateTemplate(this.sessionFactory);
		}
		return this.hibernateTemplate;
	}

	public int deleteHiber(Object vo) throws DataAccessException {
		getHibernateTemplate().delete(vo);
		return 0;
	}

	public int deleteHiber(Class<?> clazz, Serializable id) throws DataAccessException {
		int rs = 0;
		getHibernateTemplate().delete(getHiber(clazz, id));
		rs = 1;
		return rs;
	}

	public Object[] queryHiber(final String hql, final String[] propertyNames, final String[] operators, final Object[] values, final int offset, final int size,
			final boolean isTotalSize, final String orderBy, final String groupBy, final String otherCause) throws DataAccessException {
		long l1 = System.currentTimeMillis();
		Map map = (Map) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(org.hibernate.Session session) throws HibernateException, SQLException {
				Integer count = Integer.valueOf(0);
				Map map = new HashMap();
				String where = "";
				Query query;
				if ((propertyNames != null) && (propertyNames.length > 0) && (values != null) && (values.length > 0)) {
					for (int i = 0; i <= propertyNames.length - 1; i++) {
						if ("".equals(where)) {
							where = " where ";
						} else {
							where = where + "and ";
						}
						if ((operators != null) && (operators[i].equalsIgnoreCase("isnull"))) {
							where = where + propertyNames[i] + " is null ";
						} else if ((operators != null) && (operators[i].equalsIgnoreCase("isnotnull"))) {
							where = where + propertyNames[i] + " is not null ";
						} else if ((operators != null) && (operators[i].equalsIgnoreCase("isempty"))) {
							where = where + propertyNames[i] + " = '' ";
						} else if ((operators != null) && (operators[i].equalsIgnoreCase("isnotempty"))) {
							where = where + propertyNames[i] + " <> '' ";
						} else if ((operators != null) && (operators[i].equalsIgnoreCase("in"))) {
							where = where + propertyNames[i] + " in " + values[i] + " ";
						} else if ((operators != null) && (operators[i].equalsIgnoreCase("notin"))) {
							where = where + propertyNames[i] + " not in " + values[i] + " ";
						} else {
							where = where + propertyNames[i] + ((operators == null) || (operators[i] == null) ? "=" : new StringBuilder(" ").append(operators[i]).toString())
									+ " ? ";
						}
					}
					String fullSql = hql + where;
					fullSql = fullSql + ((groupBy == null) || (groupBy.trim().equals("")) ? "" : new StringBuilder(" group by ").append(groupBy).toString());
					fullSql = fullSql + ((orderBy == null) || (orderBy.trim().equals("")) ? "" : new StringBuilder(" order by ").append(orderBy).toString());
					fullSql = fullSql + ((otherCause == null) || (otherCause.trim().equals("")) ? "" : new StringBuilder(" ").append(otherCause).toString());
					query = session.createQuery(fullSql);
					for (int i = 0; i <= values.length - 1; i++) {
						if ((operators == null) || (!operators[i].equalsIgnoreCase("isnull"))) {
							if ((operators == null) || (!operators[i].equalsIgnoreCase("isnotnull"))) {
								if ((operators == null) || (!operators[i].equalsIgnoreCase("isempty"))) {
									if ((operators == null) || (!operators[i].equalsIgnoreCase("isnotempty"))) {
										if ((operators == null) || (!operators[i].equalsIgnoreCase("in"))) {
											if ((operators == null) || (!operators[i].equalsIgnoreCase("notin"))) {
												query.setParameter(i, values[i]);
											}
										}
									}
								}
							}
						}
					}
				} else {
					String fullSql = hql + where;
					fullSql = fullSql + ((groupBy == null) || (groupBy.trim().equals("")) ? "" : new StringBuilder(" group by ").append(groupBy).toString());
					fullSql = fullSql + ((orderBy == null) || (orderBy.trim().equals("")) ? "" : new StringBuilder(" order by ").append(orderBy).toString());
					fullSql = fullSql + ((otherCause == null) || (otherCause.trim().equals("")) ? "" : new StringBuilder(" ").append(otherCause).toString());
					query = session.createQuery(fullSql);
				}
				if (isTotalSize) {
					String countSql = hql + where;
					countSql = countSql + ((groupBy == null) || (groupBy.trim().equals("")) ? "" : new StringBuilder(" group by ").append(groupBy).toString());
					countSql = countSql + ((otherCause == null) || (otherCause.trim().equals("")) ? "" : new StringBuilder(" ").append(otherCause).toString());
					countSql = "select count(*) from " + countSql.substring(countSql.toLowerCase().indexOf("from") + 5);
					int idx = 0;
					idx = countSql.toLowerCase().indexOf("order");
					if (idx != -1) {
						countSql = countSql.substring(0, idx);
					}
					Query query2 = session.createQuery(countSql);
					if (values != null) {
						for (int i = 0; i <= values.length - 1; i++) {
							if ((operators == null) || (!operators[i].equalsIgnoreCase("isnull"))) {
								if ((operators == null) || (!operators[i].equalsIgnoreCase("isnotnull"))) {
									if ((operators == null) || (!operators[i].equalsIgnoreCase("isempty"))) {
										if ((operators == null) || (!operators[i].equalsIgnoreCase("isnotempty"))) {
											if ((operators == null) || (!operators[i].equalsIgnoreCase("in"))) {
												if ((operators == null) || (!operators[i].equalsIgnoreCase("notin"))) {
													query2.setParameter(i, values[i]);
												}
											}
										}
									}
								}
							}
						}
					}
					MediatorImpl.this.logger.debug("countSql=" + query2.getQueryString());
					if ((query2.list() != null) && (!query2.list().isEmpty())) {
						count = Integer.valueOf(String.valueOf(query2.list().get(0)));
					}
				}
				if ((offset >= 0) && (size > 0)) {
					query.setFirstResult(offset);
					query.setMaxResults(size);
				}
				MediatorImpl.this.logger.debug("fullSql=" + query.getQueryString());
				map.put("list", query.list());
				map.put("count", count);
				return map;
			}
		});
		long l2 = System.currentTimeMillis();
		this.logger.debug("Execute query time:" + (l2 - l1) + "ms");
		return new Object[] { map.get("list"), map.get("count") };
	}

	public List<?> queryHiber(String hql, Object[] values) throws DataAccessException {
		return getHibernateTemplate().find(hql, values);
	}

	public List findAll_Hibernate_ComposedHQL(String composedHQL) throws DataAccessException {
		return getHibernateTemplate().find(composedHQL);
	}

	public List findAll_Hibernate_NamedQuery(String queryID) throws DataAccessException {
		List list = getHibernateTemplate().findByNamedQuery(queryID);
		return list;
	}

	public List<?> findAll_Hibernate_Object(Class<?> clazz) throws DataAccessException {
		return getHibernateTemplate().loadAll(clazz);
	}

	public List<Map<?, ?>> queryJDBC(String sql) throws DataAccessException {
		return getJdbcTemplate().queryForList(sql);
	}

	public Object queryHiberComposedHQL(String composedHQL, Serializable id) throws DataAccessException {
		List list = getHibernateTemplate().find(composedHQL, id);
		Iterator it = list.iterator();
		Object vo = null;
		if (it.hasNext()) {
			vo = it.next();
		}
		if (vo != null) {
			getHibernateTemplate().getSessionFactory().getCurrentSession().refresh(vo);
		}
		return vo;
	}

	public Object getHiber(Class<?> clazz, Serializable id) throws DataAccessException {
		Object vo = getHibernateTemplate().get(clazz, id);
		if (vo != null) {
			getHibernateTemplate().getSessionFactory().getCurrentSession().refresh(vo);
		}
		return vo;
	}

	public Object loadHiber(Class<?> clazz, Serializable id) throws DataAccessException {
		Object vo = null;
		vo = getHibernateTemplate().load(clazz, id);
		if (vo != null) {
			getHibernateTemplate().getSessionFactory().getCurrentSession().refresh(vo);
		}
		return vo;
	}

	public List<?> queryHiberNamedQuery(String queryID, Object[] values) throws DataAccessException {
		List list = getHibernateTemplate().findByNamedQuery(queryID, values);
		return list;
	}

	public int updateHiberComposedQuery(final String composedSQL, final Object[] params) throws DataAccessException {
		int rs = 0;
		rs = ((Integer) getHibernateTemplate().executeWithNativeSession(new HibernateCallback() {
			public Object doInHibernate(org.hibernate.Session session) throws HibernateException {
				SQLQuery sqlq = session.createSQLQuery(composedSQL);
				if (params != null) {
					int length = params.length;
					for (int i = 0; i < length; i++) {
						sqlq.setParameter(i, params[i]);
					}
				}
				int rtn = sqlq.executeUpdate();
				return Integer.valueOf(rtn);
			}
		})).intValue();
		return rs;
	}

	public int insertHiber(Object vo) throws DataAccessException {
		int rs = 0;
		getHibernateTemplate().save(vo);
		rs = 1;
		return rs;
	}

	public int updateJDBC(String sql, Object[] params) throws DataAccessException {
		int rs = 0;
		getJdbcTemplate().execute(sql);
		rs = 1;
		return rs;
	}

	public int updateHiber(String hql, Object[] params) throws DataAccessException {
		return getHibernateTemplate().bulkUpdate(hql, params);
	}

	public int updateHiberNamedQuery(final String queryID, final Object[] params) throws DataAccessException {
		int rs = 0;
		rs = ((Integer) getHibernateTemplate().executeWithNativeSession(new HibernateCallback() {
			public Object doInHibernate(org.hibernate.Session session) throws HibernateException {
				Query queryCMd = session.getNamedQuery(queryID);
				String queryString = queryCMd.getQueryString();
				Query sqlq = session.createQuery(queryString);
				if (params != null) {
					int length = params.length;
					for (int i = 0; i < length; i++) {
						sqlq.setParameter(i, params[i]);
					}
				}
				int rtn = sqlq.executeUpdate();
				return Integer.valueOf(rtn);
			}
		})).intValue();
		return rs;
	}

	public int updateHiber(Object vo) throws DataAccessException {
		int rs = 0;
		getHibernateTemplate().update(vo);
		rs = 1;
		return rs;
	}

	public int merge_Hibernate_Object(Object vo) throws DataAccessException {
		int rs = 0;
		vo = getHibernateTemplate().merge(vo);
		getHibernateTemplate().update(vo);
		rs = 1;
		return rs;
	}

	public Object getHiber(Class<?> clazz, Serializable id, LockMode mode) throws DataAccessException {
		if (mode == null) {
			return getHiber(clazz, id);
		}
		Object vo = getHibernateTemplate().get(clazz, id, mode);
		if (vo != null) {
			getHibernateTemplate().getSessionFactory().getCurrentSession().refresh(vo);
		}
		return vo;
	}

	public void saveOrUpdate(Object obj) throws DataAccessException {
		getHibernateTemplate().saveOrUpdate(obj);
	}

	public Serializable insertHiber2(Object vo) throws DataAccessException {
		return getHibernateTemplate().save(vo);
	}

	public void evictObject(Object obj) throws DataAccessException {
		getHibernateTemplate().evict(obj);
	}

	public int updateByHql(String hql) throws DataAccessException {
		int result = 0;
		org.hibernate.Session session = getHibernateTemplate().getSessionFactory().openSession();
		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			result = session.createQuery(hql).executeUpdate();
			trans.commit();
			trans = null;
		} catch (HibernateException e) {
			if (trans != null) {
				trans.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	public void clearHibernate() throws DataAccessException {
		getHibernateTemplate().clear();
	}

	public void flushHibernate() throws DataAccessException {
		getHibernateTemplate().flush();
	}

	public org.hibernate.Session getHibernateSession() throws DataAccessException {
		return getHibernateTemplate().getSessionFactory().openSession();
	}

	public Serializable[] insertHiberBatch(List<?> list) throws DataAccessException {
		if (!CollectionUtil.isListEmpty(list)) {
			Serializable[] array = new Serializable[list.size()];
			org.hibernate.Session session = null;
			try {
				session = getHibernateSession();
				session.setFlushMode(FlushMode.AUTO);
				int batchRecordNum = 50;
				int count = 0;
				for (int i = 0; i < list.size(); i++) {
					Serializable seri = session.save(list.get(i));
					array[i] = seri;
					if ((i % batchRecordNum == 0) && (i != 0)) {
						count = i;
						session.flush();
						session.clear();
					}
				}
				if (count <= list.size()) {
					session.flush();
					session.clear();
				}
				return array;
			} catch (Exception e) {
				throw new RuntimeException(e);
			} finally {
				if (session != null) {
					session.close();
				}
			}
		}
		return null;
	}

	public void updateHiberBatch(List<?> list) throws DataAccessException {
		if (!CollectionUtil.isListEmpty(list)) {
			org.hibernate.Session session = null;
			try {
				session = getHibernateSession();
				session.setFlushMode(FlushMode.AUTO);
				int batchRecordNum = 50;
				int count = 0;
				for (int i = 0; i < list.size(); i++) {
					session.update(list.get(i));
					if ((i % batchRecordNum == 0) && (i != 0)) {
						count = i;
						session.flush();
						session.clear();
					}
				}
				if (count <= list.size()) {
					session.flush();
					session.clear();
				}
			} catch (Exception e) {
				throw new RuntimeException(e);
			} finally {
				if (session != null) {
					session.close();
				}
			}
		}
	}

	public void deleteHiberBatch(List<?> list) throws DataAccessException {
		if (!CollectionUtil.isListEmpty(list)) {
			org.hibernate.Session session = null;
			try {
				session = getHibernateSession();
				session.setFlushMode(FlushMode.AUTO);
				int batchRecordNum = 50;
				int count = 0;
				for (int i = 0; i < list.size(); i++) {
					session.delete(list.get(i));
					if ((i % batchRecordNum == 0) && (i != 0)) {
						count = i;
						session.flush();
						session.clear();
					}
				}
				if (count <= list.size()) {
					session.flush();
					session.clear();
				}
			} catch (Exception e) {
				throw new RuntimeException(e);
			} finally {
				if (session != null) {
					session.close();
				}
			}
		}
	}

	public void saveOrUpdateBatch(List<?> list) throws DataAccessException {
		if (!CollectionUtil.isListEmpty(list)) {
			org.hibernate.Session session = null;
			try {
				session = getHibernateSession();
				session.setFlushMode(FlushMode.AUTO);
				int batchRecordNum = 50;
				int count = 0;
				for (int i = 0; i < list.size(); i++) {
					session.saveOrUpdate(list.get(i));
					if ((i % batchRecordNum == 0) && (i != 0)) {
						count = i;
						session.flush();
						session.clear();
					}
				}
				if (count <= list.size()) {
					session.flush();
					session.clear();
				}
			} catch (Exception e) {
				throw new RuntimeException(e);
			} finally {
				if (session != null) {
					session.close();
				}
			}
		}
	}

}