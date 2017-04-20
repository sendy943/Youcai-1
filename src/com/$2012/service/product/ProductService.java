package com.$2012.service.product;

import java.util.List;

import com.$2012.dao.Dao;
import com.$2012.entity.product.Brand;
import com.$2012.entity.product.Product;
import com.$2012.vo.QueryResult;

public interface ProductService extends Dao<Product> {
	/*��̨--�ϼ����¼�(status-true|false)*/
	void setVisibleStatus(Integer[] productIds, boolean status);
	/*��̨--�Ƽ��벻�Ƽ�(status-true|false)*/
	void setCommendStatus(Integer[] productIds, boolean status);
	/*ǰ̨--��ó�����Ʒ maxResults ָ��������Ʒ����*/
	List<Product> getTopSale(Integer typeId, Integer maxResults);
	/*ǰ̨--��������ʷ maxResults ָ�������ʷ�Ĳ�Ʒ����*/
	List<Product> findScanHistory(Integer[] productIds, Integer maxResults);
	/*��������ָ��*/
	void updateClickCount(Integer productId);
	/*����ָ����0*/
	void clearClickCount(Integer[] productIds);
	/*���ؼ���������Ʒ������ҳ*/
	QueryResult<Product> search(String keyword, int firstResult, int maxResults);
	/*����ĳ�����������Ʒ��Ʒ��*/
	List<Brand> findBrandsByTypeId(Integer[] typeIds);
}
