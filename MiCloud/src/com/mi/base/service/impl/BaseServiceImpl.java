package com.mi.base.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.LockMode;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;

import com.mi.base.dao.Mediator;
import com.mi.base.exception.ServiceException;
import com.mi.base.service.BaseService;
import com.mi.base.util.CollectionUtil;

@Service("baseService")
public class BaseServiceImpl implements BaseService {

	@Resource
	private Mediator mediator;

	@Override
	public Object getBean(String beanId) {
		return null;
	}

	@Override
	public HibernateTemplate getHibernateTemplate() throws ServiceException {
		HibernateTemplate hibernateTemplate = null;
		try {
			hibernateTemplate = this.mediator.getHibernateTemplate();
		} catch (Exception me) {

		}
		return hibernateTemplate;
	}

	@Override
	public List<?> queryHiber(Class<?> clazz) {
		List<?> list = null;
		try {
			list = this.mediator.findAll_Hibernate_Object(clazz);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return list;
	}

	@Override
	public List<?> queryHiber(String hql, Object[] params) {
		if (StringUtils.isNotEmpty(hql)) {
			try {
				return this.mediator.queryHiber(hql, params);
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
				return this.mediator.getHiber(clazz, id);
			} catch (Exception e) {

			}
		}
		return null;
	}

	@Override
	public Object queryOneHiber(Class<?> clazz, Serializable id, LockMode mode) {
		if (StringUtils.isNotEmpty((String) id)) {
			try {
				return this.mediator.getHiber(clazz, id, mode);
			} catch (Exception e) {

			}
		}
		return null;
	}

	@Override
	public void saveOrUpdate(Object param) {
		if (param != null) {
			try {
				this.mediator.saveOrUpdate(param);
			} catch (Exception e) {

			}
		}
	}

	@Override
	public int insertHiber(Object param) {
		int result = 0;
		if (param != null) {
			try {
				result = this.mediator.insertHiber(param);
			} catch (Exception e) {

			}
		}
		return result;
	}

	@Override
	public Serializable[] insertHiberBatch(List<?> list) {
		if (!CollectionUtil.isListEmpty(list)) {
			try {
				this.mediator.insertHiberBatch(list);
			} catch (Exception e) {

			}
		}
		return null;
	}

	@Override
	public int updateHiber(Object param) {
		int result = 0;
		if (param != null) {
			try {
				result = this.mediator.updateHiber(param);
			} catch (Exception e) {

			}
		}
		return result;
	}

	@Override
	public void updateHiberBatch(List<?> list) {
		if (!CollectionUtil.isListEmpty(list)) {
			try {
				this.mediator.insertHiberBatch(list);
			} catch (Exception e) {

			}
		}
	}

	@Override
	public int updateHiber(String hql, Object[] params) {
		int result = 0;
		if (StringUtils.isNotEmpty(hql)) {
			try {
				return this.mediator.updateHiber(hql, params);
			} catch (Exception e) {

			}
		}
		return result;
	}

	@Override
	public void deleteHiber(Object param) {
		if (param != null) {
			try {
				this.mediator.deleteHiber(param);
			} catch (Exception e) {

			}
		}

	}

	@Override
	public int deleteHiberByID(Class<?> clazz, Serializable id) throws ServiceException {
		int result = 0;
		if (StringUtils.isNotEmpty((String) id)) {
			try {
				result = this.mediator.deleteHiber(clazz, id);
			} catch (Exception e) {

			}
		}
		return result;
	}

	@Override
	public void deleteHiberBatch(List<?> list) {
		if (!CollectionUtil.isListEmpty(list)) {
			try {
				this.mediator.deleteHiberBatch(list);
			} catch (Exception e) {

			}
		}

	}

	@Override
	public void saveOrUpdateBatch(List<?> list) {
		if (!CollectionUtil.isListEmpty(list)) {
			try {
				this.mediator.saveOrUpdateBatch(list);
			} catch (Exception e) {

			}
		}
	}

	@Override
	public void executeUpdateHiber(Object param) {
		if (param != null) {
			try {
				this.mediator.updateHiber(param);
			} catch (Exception e) {

			}
		}
	}

	@Override
	public void executeInsertHiber(Object param) {
		if (param != null) {
			try {
				this.mediator.insertHiber(param);
			} catch (Exception e) {

			}
		}
	}

	@Override
	public void evictObject(Object param) {
		if (param != null) {
			try {
				this.mediator.evictObject(param);
			} catch (Exception e) {

			}
		}

	}

	@Override
	public int updateByHql(String hql) {
		int result = 0;
		if (StringUtils.isNotEmpty(hql)) {
			try {
				result = this.mediator.updateByHql(hql);
			} catch (Exception e) {

			}
		}
		return result;
	}

	@Override
	public int updateJDBC(String sql, Object[] params) {
		int result = 0;
		if (StringUtils.isNotEmpty(sql)) {
			try {
				result = this.mediator.updateJDBC(sql, params);
			} catch (Exception e) {

			}
		}
		return result;
	}

	@Override
	public Object loadHiber(Class<?> clazz, Serializable id) {
		if (StringUtils.isNotEmpty((String) id)) {
			try {
				return this.mediator.loadHiber(clazz, id);
			} catch (Exception e) {

			}
		}
		return null;
	}

	@Override
	public List<Map<?, ?>> queryJDBC(String sql) {
		if (StringUtils.isNotEmpty(sql)) {
			try {
				this.mediator.queryJDBC(sql);
			} catch (Exception e) {

			}
		}
		return null;
	}

	@Override
	public void mergeObject(Object param) {
		try {
			this.mediator.merge_Hibernate_Object(param);
		} catch (Exception e) {

		}
	}

	@Override
	public void clearHibernate() {
		try {
			this.mediator.clearHibernate();
		} catch (Exception e) {

		}
	}

	@Override
	public void flushHibernate() {
		try {
			this.mediator.flushHibernate();
		} catch (Exception e) {

		}
	}
}
