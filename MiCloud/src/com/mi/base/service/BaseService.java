package com.mi.base.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.LockMode;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;

import com.mi.base.exception.ServiceException;

@Service("baseService")
public interface BaseService {

	public static final String BEAN_ID = "baseService";

	public List<?> queryHiber(Class<?> clazz) throws ServiceException;

	public List<?> queryHiber(String hql, Object[] params);

	public Object queryOneHiber(String hql, Object[] params);

	public Object queryOneHiber(Class<?> clazz, Serializable id);

	public Object queryOneHiber(Class<?> clazz, Serializable id, LockMode paramLockMode);

	public void saveOrUpdate(Object param);

	public int insertHiber(Object param);

	public Serializable[] insertHiberBatch(List<?> list);

	public int updateHiber(Object param);

	public void updateHiberBatch(List<?> list);

	public int updateHiber(String hql, Object[] params);

	public void deleteHiber(Object param);

	public int deleteHiberByID(Class<?> clazz, Serializable id) throws ServiceException;

	public void deleteHiberBatch(List<?> list);

	public void saveOrUpdateBatch(List<?> list);

	public void executeUpdateHiber(Object param);

	public void executeInsertHiber(Object param);

	public void evictObject(Object param);

	public int updateByHql(String hql);

	public int updateJDBC(String sql, Object[] params);

	public Object loadHiber(Class<?> clazz, Serializable id);

	public List<Map<?, ?>> queryJDBC(String sql);

	public void mergeObject(Object param);

	public void clearHibernate();

	public void flushHibernate();

	public Object getBean(String beanId);

	public HibernateTemplate getHibernateTemplate() throws ServiceException;
}
