package com.$2012.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.$2012.utils.GenericsUtils;
import com.$2012.vo.QueryResult;

/*
 * ����Ŀ���ǵ�ֻ��һ������Դ�����ݿ⣩���ʽ�DAO��Service�ںϣ���Service
 * �ֿ��ǵ���ģ���кܶ����Ƶ�DAO�������ʽ�DAO���������Ϊ���࣬Service extends DAO����ʱ�������DAO�㼴��
 * ��DAO��Ͻ�Service�ʺ��ڶ�����Դ�������ݿ⣬XML���ļ�������ʱ����Tx����Service��
 *   Service Tx
 *     dbDAO
 *     xmlDAO
 *     fileDAO
 */
@SuppressWarnings("unchecked")
@Transactional
public abstract class DaoSupport<T> implements Dao<T> {
	protected Class<T> entityClass = GenericsUtils.getSuperClassGenricType(this.getClass());

	protected HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public void clear() {
		this.hibernateTemplate.clear();
	}
	
	public void delete(T entity) {
		this.hibernateTemplate.delete(entity);
	}

	/*
	 * Object...��ʾ�ɱ�������൱��new Object[]{}��������google��������
	 * Ϊʲô��Serializable���ɲο�hibernate���session.get(XX.Class, Serializable)
	 */
	public void delete(Serializable... entityIds) {
		for (Serializable id : entityIds) {
			T t = this.find(id);
			if (t == null) throw new RuntimeException(
					this.entityClass.getName() + "����û�ж�Ӧ��id-" + id);
			this.hibernateTemplate.delete(t);//deleteAll(Collection)
		}
	}

	public void save(T entity) {
		this.hibernateTemplate.save(entity);
	}

	public void update(T entity) {
		this.hibernateTemplate.update(entity);
	}

	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public T find(Serializable entityId) {
		if (entityId == null)
			throw new RuntimeException(this.entityClass.getName()
					+ ":�����ʵ��id����Ϊ��");
		return (T) this.hibernateTemplate.get(this.entityClass, entityId);
	}

	public long getCount() {
		return (Long) this.hibernateTemplate.iterate("select count(o) from "+ getEntityName(this.entityClass)+ " o").next();
	}
	
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<T> getScrollData() {
		return this.getScrollData(-1, -1);
	}
	
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<T> getScrollData(int firstIndex, int maxResult) {
		return this.getScrollData(firstIndex, maxResult, null, null, null);
	}
	
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<T> getScrollData(int firstIndex, int maxResult,
			LinkedHashMap<String, String> orderby) {
		return this.getScrollData(firstIndex, maxResult, null, null, orderby);
	}
	
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<T> getScrollData(int firstIndex, int maxResult,
			String whereql, List<Object> queryParams) {
		return this.getScrollData(firstIndex, maxResult, whereql, queryParams, null);
	}
	
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<T> getScrollData(final int firstIndex, final int maxResult,
			final String whereql, final List<Object> queryParams,
			final LinkedHashMap<String, String> orderby) {
		final QueryResult qr = new QueryResult<T>();
		final Class<T> entityClazz = this.entityClass;
		final String entityName = getEntityName(entityClazz);
		this.hibernateTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery("select o from "+
						entityName+ " o "+(whereql==null || 
						"".equals(whereql.trim())? "" : "where "+ 
						whereql)+ buildOrderby(orderby));
				setQueryParams(query, queryParams);
				
				if(firstIndex!=-1 && maxResult!=-1) 
					query.setFirstResult(firstIndex).setMaxResults(maxResult);
				List<T> resultList = query.list();
				qr.setResultList(resultList);
				
				query = session.createQuery("select count(o) from "+ entityName+ " o "+(whereql==null || 
						"".equals(whereql.trim())? "": "where "+ whereql));
				setQueryParams(query, queryParams);
				qr.setTotalRecords((Long) query.uniqueResult());
				return resultList;
			}
		});
		return qr;
	}

	/*
	 * ͨ������
	 */
	protected static void setQueryParams(Query query, List<Object> queryParams) {
		if (queryParams != null && queryParams.size() > 0) {
			for (int i = 0; i < queryParams.size(); i++) {
				query.setParameter(i, queryParams.get(i));
			}
		}
	}

	/*
	 * �����������
	 * Map<�����ֶ�, asc/desc>
	 * Return String    order by xx asc,yy desc
	 */
	protected static String buildOrderby(LinkedHashMap<String, String> orderby) {
		StringBuilder orderbyql = new StringBuilder("");
		if (orderby != null && orderby.size() > 0) {
			orderbyql.append(" order by ");
			for (String key : orderby.keySet()) {
				orderbyql.append("o.").append(key).append(" ").append(
						orderby.get(key)).append(",");
			}
			orderbyql.deleteCharAt(orderbyql.length() - 1);
		}
		return orderbyql.toString();
	}

	/*
	 * ��ȡʵ�������
	 */
	protected static <E> String getEntityName(Class<E> clazz) {
		String entityName = clazz.getSimpleName();
		/*Entity entity = clazz.getAnnotation(Entity.class);
		if (entity.name() != null && !"".equals(entity.name())) {
			entityName = entity.name();
		}*/
		return entityName;
	}
	
}
