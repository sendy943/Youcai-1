package com.$2012.service.product;

import java.util.List;

import com.$2012.dao.Dao;
import com.$2012.entity.product.ProductType;

public interface ProductTypeService extends Dao<ProductType> {
	/*��ȡ���typeIds�µ�����������𣬽����id����allIds*/
	List<Integer> getAllSubTypeIds(List<Integer> allIds, Integer[] typeIds);
}
