package com.$2012.service.product;

import com.$2012.dao.Dao;
import com.$2012.entity.product.ProductStyle;

public interface ProductStyleService extends Dao<ProductStyle> {
	/*������ʽ�Ƿ�ɼ�*/
	void setVisible(Integer[] styleIds, Boolean status);
	/*�����Ʋ�����ʽ*/
	ProductStyle findByName(String name);
}
