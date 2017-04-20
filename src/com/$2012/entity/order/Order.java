package com.$2012.entity.order;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.$2012.entity.user.User;

/*
 * ����
 */
@Entity @Table(name="t_order")  //ʹ�ö���������������������ʣ��Ķ������������� <load,iterate..Ĭ��ʹ�ö������棬���Ȳ�������棬û���ٲ�һ��session����>
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Order {
	/* ������ */
	private String orderId;
	/* �����û� */
	private User user;
	/* ��������ʱ�� */
	private Date createDate = new Date();
	/* ����״̬ */
	private OrderState state;
	/* ��Ʒ�ܽ�� */
	private Float productTotalPrice = 0f;
	/* ���ͷ� */
	private Float deliverFee = 0f;
	/* �����ܽ�� */
	private Float totalPrice= 0f;
	/* Ӧ����(ʵ����Ҫ֧���ķ���) */
	private Float payableFee = 0f;
	/* �˿͸��� */
	private String note;
	/* ֧����ʽ */
	private PaymentWay paymentWay;
	/* ֧��״̬ */
    private Boolean paymentState = false;
    /* ����������Ϣ */
	private Acceptor acceptor;
	/* ������������ϵ��Ϣ */
	private Buyer buyer;
	/* ������ */
	private Set<OrderItem> items = new HashSet<OrderItem>();
	/* �Զ������м������û�,���ֵΪnull,������δ������,����,���������� */
	private String lockUser;
	/* �ͷ����� */
	private Set<Message> msgs = new HashSet<Message>();
	
	public Order(){}
	
	public Order(String orderId) {
		this.orderId = orderId;
	}
	@OneToMany(mappedBy="order",cascade=CascadeType.REMOVE)
	public Set<Message> getMsgs() {
		return msgs;
	}
	public void setMsgs(Set<Message> msgs) {
		this.msgs = msgs;
	}
	public void addMsg(Message message) {
		this.msgs.add(message);
	}
	@Column(length=20)
	public String getLockUser() {
		return lockUser;
	}
	public void setLockUser(String lockUser) {
		this.lockUser = lockUser;
	}
	@Id @Column(length=14)
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	@ManyToOne(cascade=CascadeType.REFRESH, optional=false)
	@JoinColumn(name="username")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Temporal(TemporalType.TIMESTAMP) @Column(nullable=false)
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Enumerated(EnumType.STRING) @Column(length=16, nullable=false)
	public OrderState getState() {
		return state;
	}
	public void setState(OrderState state) {
		this.state = state;
	}
	@Column(nullable=false)
	public Float getProductTotalPrice() {
		return productTotalPrice;
	}
	public void setProductTotalPrice(Float productTotalPrice) {
		this.productTotalPrice = productTotalPrice;
	}
	@Column(nullable=false)
	public Float getDeliverFee() {
		return deliverFee;
	}
	public void setDeliverFee(Float deliverFee) {
		this.deliverFee = deliverFee;
	}
	@Column(nullable=false)
	public Float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}
	@Column(nullable=false)
	public Float getPayableFee() {
		return payableFee;
	}
	public void setPayableFee(Float payableFee) {
		this.payableFee = payableFee;
	}
	@Column(length=100)
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	@Enumerated(EnumType.STRING) @Column(length=20,nullable=false)
	public PaymentWay getPaymentWay() {
		return paymentWay;
	}
	public void setPaymentWay(PaymentWay paymentWay) {
		this.paymentWay = paymentWay;
	}
	@Column(nullable=false)
	public Boolean getPaymentState() {
		return paymentState;
	}
	public void setPaymentState(Boolean paymentState) {
		this.paymentState = paymentState;
	}
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="acceptorId")
	public Acceptor getAcceptor() {
		return acceptor;
	}
	public void setAcceptor(Acceptor acceptor) {
		this.acceptor = acceptor;
	}
	@OneToOne(cascade=CascadeType.ALL, optional=false)
	@JoinColumn(name="buyerId")
	public Buyer getBuyer() {
		return buyer;
	}
	public void setBuyer(Buyer buyer) {
		this.buyer = buyer;
	}
	@OneToMany(mappedBy="order",cascade=CascadeType.ALL)
	//˫���ϵ����ά������mappedBy
	public Set<OrderItem> getItems() {
		return items;
	}
	public void setItems(Set<OrderItem> items) {
		this.items = items;
	}
	/*
	 * ��Ӷ�����
	 */
	public void addOrderItem(OrderItem item){
		this.items.add(item);
		item.setOrder(this);
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((orderId == null) ? 0 : orderId.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		final Order other = (Order) obj;
		if (orderId == null) {
			if (other.orderId != null)
				return false;
		} else if (!orderId.equals(other.orderId))
			return false;
		return true;
	}
	
}
