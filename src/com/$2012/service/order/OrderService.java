package com.$2012.service.order;

import com.$2012.dao.Dao;
import com.$2012.entity.order.DeliverWay;
import com.$2012.entity.order.Order;
import com.$2012.entity.order.PaymentWay;
import com.$2012.vo.Cart;

public interface OrderService extends Dao<Order>  {
	/*���ɶ���*/
	Order createOrder(Cart cart, String username);
	/*�޸�֧����ʽ*/
	void updatePaymentWay(String orderId, PaymentWay paymentWay);
	/*�޸����ͷ�ʽ*/
	void updateDeliverWay(String orderId, DeliverWay deliverWay);
	/*�޸����ͷ�*/
	void updateDeliverFee(String orderId, float deliverFee);
	/*ת����״̬Ϊ����ȡ����*/
	void cancelOrder(String orderId);
	/*ת����״̬Ϊ��ͨ����ˡ�*/
	void confirmOrder(String orderId);
	/*ת����״̬Ϊ����֧����*/
	void confirmPayment(String orderId);
	/*ת����״̬Ϊ���ȴ�������*/
	void turnWaitDeliver(String orderId);
	/*ת����״̬Ϊ���ѷ�����*/
	void turnDelivered(String orderId);
	/*ת����״̬Ϊ�����ջ���*/
	void turnReceived(String orderId);
	/*Ϊ��������*/
	Order addLock(String orderId, String username);
	/*Ϊ��������*/
	void unlockOrder(String... orderIds);
}
