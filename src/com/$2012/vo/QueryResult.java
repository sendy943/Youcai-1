package com.$2012.vo;

import java.util.List;

/*
 * ��ѯ���         <��ʵ�������а�װ����õ�������˷�����������࣬��vo����>
 */
public class QueryResult<T> {
	/*�����*/
	private List<T> resultList;
	/*������ܼ�¼��*/
	private long totalRecords;
	public QueryResult() {}
	public QueryResult(List<T> resultList) {
		this.resultList = resultList;
	}
	public List<T> getResultList() {
		return resultList;
	}
	public void setResultList(List<T> resultList) {
		this.resultList = resultList;
	}
	public long getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(long totalRecords) {
		this.totalRecords = totalRecords;
	}
}
