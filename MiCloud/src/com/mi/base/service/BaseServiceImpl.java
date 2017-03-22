package com.mi.base.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.LockMode;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.mi.base.dao.Mediator;
import com.mi.base.exception.ServiceException;

public class BaseServiceImpl implements BaseService {

	@Resource
	private Mediator defautMediator;

	@Override
	public List<?> queryHiber(Class<?> clazz) {
		List<?> list = null;
		try {
			list = this.defautMediator.findAll_Hibernate_Object(clazz);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return list;
	}

	@Override
	public List<?> queryHiber(String hql, Object[] params) {
		if (StringUtils.isNotEmpty(hql)) {
			try {
				this.defautMediator.queryHiber(hql, params);
			} catch (Exception e) {
				
			}
		}
		return null;
	}

	@Override
	public Object queryOneHiber(String hql, Object[] params) {
		List<?> list = queryHiber(hql, params);
		return (list != null && list.size() > 0) ? list.get(0) : null;
	}

	@Override
	public Object queryOneHiber(Class<?> clazz, Serializable id) {
		if (StringUtils.isNotEmpty((String) id)) {
			try {
				this.defautMediator.getHiber(clazz, id);
			} catch (Exception e) {
				
			}
		}
		return null;
	}

	@Override
	public Object queryOneHiber(Class<?> clazz, Serializable id, LockMode paramLockMode) {
		return null;
	}

	@Override
	public void saveOrUpdate(Object param) {
		// TODO Auto-generated method stub

	}

	@Override
	public int insertHiber(Object param) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Serializable[] insertHiberBatch(List<?> list) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHiber(Object param) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateHiberBatch(List<?> list) {
		// TODO Auto-generated method stub

	}

	@Override
	public int updateHiber(String hql, Object[] params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteHiber(Object param) {
		// TODO Auto-generated method stub

	}

	@Override
	public int deleteHiberByID(Class<?> clazz, Serializable id) throws ServiceException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteHiberBatch(List<?> list) {
		// TODO Auto-generated method stub

	}

	@Override
	public void saveOrUpdateBatch(List<?> list) {
		// TODO Auto-generated method stub

	}

	@Override
	public void executeUpdateHiber(Object param) {
		// TODO Auto-generated method stub

	}

	@Override
	public void executeInsertHiber(Object param) {
		// TODO Auto-generated method stub

	}

	@Override
	public void evictObject(Object param) {
		// TODO Auto-generated method stub

	}

	@Override
	public int updateByHql(String hql) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateJDBC(String sql, Object[] params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Object loadHiber(Class<?> clazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<?, ?>> queryJDBC(String sql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void mergeObject(Object param) {
		// TODO Auto-generated method stub

	}

	@Override
	public void clearHibernate() {
		// TODO Auto-generated method stub

	}

	@Override
	public void flushHibernate() {
		// TODO Auto-generated method stub

	}

	@Override
	public Object getBean(String beanId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HibernateTemplate getHibernateTemplate() throws ServiceException {
		// TODO Auto-generated method stub
		return null;
	}

}
