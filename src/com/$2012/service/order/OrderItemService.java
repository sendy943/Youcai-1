package com.$2012.service.order;

import com.$2012.dao.Dao;
import com.$2012.entity.order.OrderItem;

public interface OrderItemService extends Dao<OrderItem>  {
	/*�޸�ָ���������Ʒ����*/
	void updateProductAmount(Integer oitemId, int amount);
}
