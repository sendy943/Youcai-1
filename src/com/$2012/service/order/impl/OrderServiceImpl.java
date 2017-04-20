package com.$2012.service.order.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.$2012.dao.DaoSupport;
import com.$2012.entity.order.Acceptor;
import com.$2012.entity.order.DeliverWay;
import com.$2012.entity.order.Order;
import com.$2012.entity.order.OrderItem;
import com.$2012.entity.order.OrderState;
import com.$2012.entity.order.PaymentWay;
import com.$2012.entity.product.Product;
import com.$2012.entity.product.ProductStyle;
import com.$2012.entity.user.ContactInfo;
import com.$2012.entity.user.User;
import com.$2012.service.order.GeneratedOrderIdService;
import com.$2012.service.order.OrderService;
import com.$2012.service.user.UserService;
import com.$2012.vo.BuyItem;
import com.$2012.vo.Cart;

@Component("orderService")
@Transactional
public class OrderServiceImpl extends DaoSupport<Order> implements OrderService {
	private GeneratedOrderIdService generatedOrderIdService;
	private UserService userService;
	
	@PostConstruct //init-method
	public void init() {
		//��Ȼinit()��"orderService"�ﲻ���������@PostConstruct��ʵ����bean�������ִ�У�δ������
		//��generatedOrderIdServiceʵ����һ��������󣬴������ִ��Ŀ������init����ǰ�������֮����ύ����
		this.generatedOrderIdService.init();
	}

	/*
	 * ע�������û������¶�������
	 * �ɸ��÷�����synchronized�ؼ��֣������ܽ�������������
	 * ����Ŀ�в�������һ��������ʵ�壬��������������ʽ���ɶ�����ˮ��(1,2,3...)
	 * ����ˮ�Ž��д����γ����յķ��Ϲ淶�Ķ�����(�磺12090100000001)
	 */
	public Order createOrder(Cart cart, String username) {
		Order order = new Order();
		User user = userService.find(username);
		order.setUser(user);
		order.setDeliverFee(cart.getDeliverFee());
		order.setNote(cart.getNote());
		if ("true".equals(cart.getBuyerIsAcceptor())) {//����������Ϊ������һʧ
			cart.getBuyer().setBuyerName(cart.getAcceptor().getAcceptorName());
			cart.getBuyer().setGender(cart.getAcceptor().getGender());
			cart.getBuyer().setAddress(cart.getAcceptor().getAddress());
			cart.getBuyer().setEmail(cart.getAcceptor().getEmail());
			cart.getBuyer().setPostalcode(cart.getAcceptor().getPostalcode());
			if (cart.getAcceptor().getPhone() != null)
				cart.getBuyer().setPhone(cart.getAcceptor().getPhone());
			if (cart.getAcceptor().getMobile() != null) 
				cart.getBuyer().setMobile(cart.getAcceptor().getMobile());
		}
		order.setBuyer(cart.getBuyer());
		order.setAcceptor(cart.getAcceptor());
		order.setState(OrderState.WAITCONFIRM);
		order.setPaymentWay(cart.getPaymentWay());
		order.setProductTotalPrice(cart.getTotalSalePrice());
		order.setTotalPrice(cart.getOrderTotalPrice());
		order.setPayableFee(cart.getOrderTotalPrice());
		for (BuyItem item : cart.getItems()) {
			Product product = item.getProduct();
			ProductStyle style = product.getStyles().iterator().next();
			OrderItem oitem = new OrderItem(product.getName(), product.getProductId(),
					product.getSalePrice(), item.getAmount(), style.getName(), style.getStyleId());
			order.addOrderItem(oitem);
		}
		//����û�����ϵ��ϢΪ�գ����ջ��˵������Ϣ�����û�
		if (user.getContactInfo() == null) {
			Acceptor acceptor = cart.getAcceptor();
			ContactInfo contactInfo = new ContactInfo();
			contactInfo.setAddress(acceptor.getAddress());
			contactInfo.setPhone(acceptor.getPhone());
			contactInfo.setMobile(acceptor.getMobile());
			contactInfo.setPostalcode(acceptor.getPostalcode());
			if (user.getRealname() == null) user.setRealname(acceptor.getAcceptorName());
			if (user.getGender() == null) user.setGender(acceptor.getGender());
			contactInfo.setUser(user);
			user.setContactInfo(contactInfo);
			userService.update(user);
		}
		order.setOrderId(this.buildOrderId2(order.getCreateDate()));//�漰�����������������ʷ����
		super.save(order);
		return order;
	}
	
	/*
	 * ���ɶ�����--yyMMdd[6λ]+(���충������+1)[8λ��������ǰ�油0]
	 */
	@SuppressWarnings("unused")
	private String buildOrderId(Date date) {
		StringBuilder id = new StringBuilder(new SimpleDateFormat("yyMMdd").format(date));
		SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			final Date zeroTime = dateFmt.parse(dateFmt.format(date));
			long count = (Long) this.hibernateTemplate.find("select count(o) from Order o where o.createDate>?", zeroTime).get(0);
			String strCount = fillZero(8, String.valueOf(count + 1));
			id.append(strCount);
		} catch (ParseException e) {
			throw new RuntimeException("���ɶ�����ʧ��");
		}
		return id.toString();
	}
	/*
	 * ���ɶ�����--yyMMdd[6λ]+��ˮ��[8λ��������ǰ�油0]
	 */
	private String buildOrderId2(Date date) {
		StringBuilder id = new StringBuilder(new SimpleDateFormat("yyMMdd").format(date));
		id.append(this.fillZero(8, String.valueOf(this.generatedOrderIdService.buildOrderId())));
		return id.toString();
	}
	/*
	 * ��0
	 */
	private String fillZero(int length, String source) {
		StringBuilder result = new StringBuilder(source);
		for (int i = result.length(); i < length; i++) {
			result.insert(0, '0');
		}
		return result.toString();
	}

	public GeneratedOrderIdService getGeneratedOrderIdService() {
		return generatedOrderIdService;
	}
	@Resource
	public void setGeneratedOrderIdService(
			GeneratedOrderIdService generatedOrderIdService) {
		this.generatedOrderIdService = generatedOrderIdService;
	}

	public UserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void updatePaymentWay(String orderId, PaymentWay paymentWay) {
		this.hibernateTemplate.bulkUpdate("update Order o set o.paymentWay=? where o.orderId=?", new Object[]{paymentWay, orderId});
	}

	public void updateDeliverWay(final String orderId, final DeliverWay deliverWay) {
		this.hibernateTemplate.bulkUpdate("update Acceptor o set o.deliverWay=? where o.order.orderId=?", new Object[]{deliverWay, orderId});
	}

	public void updateDeliverFee(String orderId, float deliverFee) {
		Order order = this.find(orderId);
		order.setDeliverFee(deliverFee);
		order.setTotalPrice(order.getProductTotalPrice() + order.getDeliverFee());
		order.setPayableFee(order.getTotalPrice());
	}

	public void cancelOrder(String orderId) {
		Order order = this.find(orderId);
		if (!OrderState.RECEIVED.equals(order.getState())) 
			order.setState(OrderState.CANCEL);
	}

	public void confirmOrder(String orderId) {
		Order order = this.find(orderId);
		if (OrderState.WAITCONFIRM.equals(order.getState())) {
			if (!PaymentWay.COD.equals(order.getPaymentWay()) && !order.getPaymentState())
				order.setState(OrderState.WAITPAYMENT);//��ʱ�����õȴ�7��δ������ȡ����������ȻҲ���˹�ȡ��
			else order.setState(OrderState.ADMEASUREPRODUCT);
		}
	}

	public void confirmPayment(String orderId) {
		Order order = this.find(orderId);
		order.setPaymentState(true);
		if (OrderState.WAITPAYMENT.equals(order.getState())) 
			order.setState(OrderState.ADMEASUREPRODUCT);
		else if (OrderState.DELIVERED.equals(order.getState()) && PaymentWay.COD.equals(order.getPaymentWay()))
			order.setState(OrderState.RECEIVED);
	}

	public void turnWaitDeliver(String orderId) {
		Order order = this.find(orderId);
		if (OrderState.ADMEASUREPRODUCT.equals(order.getState())) 
			order.setState(OrderState.WAITDELIVER);
	}

	public void turnDelivered(String orderId) {
		Order order = this.find(orderId);
		if (OrderState.WAITDELIVER.equals(order.getState())) 
			order.setState(OrderState.DELIVERED);
	}

	public void turnReceived(String orderId) {
		Order order = this.find(orderId);
		if (OrderState.DELIVERED.equals(order.getState())) 
			order.setState(OrderState.RECEIVED);
	}

	public Order addLock(final String orderId, final String username) {
		this.hibernateTemplate.bulkUpdate("update Order o set o.lockUser=? where o.orderId=? and o.lockUser is null and o.state not in(?,?)", new Object[]{username, orderId, OrderState.RECEIVED, OrderState.CANCEL});
		return this.find(orderId);
	}

	public void unlockOrder(final String... orderIds) {
		if (orderIds != null && orderIds.length > 0) {
			StringBuilder n = new StringBuilder();
			for (int i = 0; i < orderIds.length; i++) {
				n.append("?,");
			}
			n.deleteCharAt(n.length() - 1);
			Object[] params = new Object[orderIds.length+1];
			for (int i = 0; i < orderIds.length; i++) {
				params[i+1] = orderIds[i];
			}
			this.hibernateTemplate.bulkUpdate("update Order o set o.lockUser=? where o.orderId in(" + n.toString() + ")", params);
		}
	}

}
