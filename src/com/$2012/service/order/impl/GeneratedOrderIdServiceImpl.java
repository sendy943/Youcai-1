package com.$2012.service.order.impl;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.$2012.dao.DaoSupport;
import com.$2012.entity.order.GeneratedOrderId;
import com.$2012.service.order.GeneratedOrderIdService;

@Component("generatedOrderIdService")
@Transactional
public class GeneratedOrderIdServiceImpl extends DaoSupport<GeneratedOrderId> implements GeneratedOrderIdService {
	public void init() {
		if (this.getCount() == 0) {
			GeneratedOrderId orderId = new GeneratedOrderId();
			orderId.setId("order");
			this.save(orderId);
		}
	}
	
	public int buildOrderId() {
		//update,find����һ�������У�����δ����ʱ��update����������������������ֻ����ǰһ���û�ִ�иò���
		this.hibernateTemplate.bulkUpdate("update GeneratedOrderId o set o.orderId=o.orderId+1 where o.id=?", "order");
		//�����ύǰ��������Χ�ڵĸ���sql���ᱻ���뵽���������(JDBC-Batch)�У������ύʱһ���Է���
		this.hibernateTemplate.flush();//��sql������̷��͵����ݿ���ִ��
		return super.find("order").getOrderId();//find
	}
}
