package com.$2012.service.order;

import com.$2012.dao.Dao;
import com.$2012.entity.order.GeneratedOrderId;

public interface GeneratedOrderIdService extends Dao<GeneratedOrderId>  {
	/*��ʼ��*/
	void init();
	/*���ɶ�����ˮ��*/
	int buildOrderId();
}
