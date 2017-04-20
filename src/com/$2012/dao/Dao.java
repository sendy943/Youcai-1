package com.$2012.dao;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;

import com.$2012.vo.QueryResult;
/*
 * ���÷��ͺͷ����װ�������ݿ����
 * ps:����ʱSpring����Dao������DAO
 */
public interface Dao<T> {
	/*��*/
	void save(T entity);
	/*ɾ*/
	void delete(T entity);
	void delete(Serializable... entityIds);
	/*��*/
	void update(T entity);
	/*�� entityId������*/
	T find(Serializable entityId);
	/*��ȡ��¼����*/
	long getCount();
	/*���һ�����棨session���棩-���������й�״̬��Ϊ����״̬*/
	//�й�״̬��session.clear()..->Detached
	//����״̬��hibernate.clear()
	void clear();
	
	/*��ҳ��ѯ*/
	public QueryResult<T> getScrollData(int firstIndex, int maxResult, String whereql, List<Object> queryParams, LinkedHashMap<String, String> orderby);
	
	public QueryResult<T> getScrollData(int firstIndex, int maxResult, String whereql, List<Object> queryParams);
	
	public QueryResult<T> getScrollData(int firstIndex, int maxResult, LinkedHashMap<String, String> orderby);
	
	public QueryResult<T> getScrollData(int firstIndex, int maxResult);
	
	public QueryResult<T> getScrollData();
	
}
