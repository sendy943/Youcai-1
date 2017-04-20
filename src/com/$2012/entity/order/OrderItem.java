package com.$2012.entity.order;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
/*
 * ������
 *     ���ڶ���������Ʒ�йصĲ�����Ϣ�ڶ����ύ���ǲ�������ĵ�
 *     ���Դ˴������ù���Product
 *     �磺�����µĵ㵥������׼����������Ʒ�����ˣ��������Ļ������ײ�������
 */
@Entity
public class OrderItem {
	private Integer itemId;
	/* ��Ʒ���� */
	private String productName;
	/* ��Ʒid */
	private Integer productId;
	/* ��Ʒ���ۼ� */
	private Float productPrice = 0f;
	/* �������� */
	private Integer amount = 1;
	/* ��Ʒ��ʽ */
	private String styleName;	
	/* ��Ʒ��ʽID */
	private Integer styleId;
	/* �������� */
	private Order order;
	
	public OrderItem(){}
	
	/*
	 * �ù�������δ��itemId�����Ϊ�����ֲ�ͬ��OrderItem��Ҫ��дhashCode()
	 */
	public OrderItem(String productName, Integer productid, Float productPrice,
			Integer amount, String styleName, Integer styleid) {
		this.productName = productName;
		this.productId = productid;
		this.productPrice = productPrice;
		this.amount = amount;
		this.styleName = styleName;
		this.styleId = styleid;
	}
	@Id @GeneratedValue
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	@Column(length=50,nullable=false)
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	@Column(nullable=false)
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	@Column(nullable=false)
	public Float getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Float productPrice) {
		this.productPrice = productPrice;
	}
	@Column(nullable=false)
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	@Column(length=30,nullable=false)
	public String getStyleName() {
		return styleName;
	}
	public void setStyleName(String styleName) {
		this.styleName = styleName;
	}
	@Column(nullable=false)
	public Integer getStyleid() {
		return styleId;
	}
	public void setStyleid(Integer styleid) {
		this.styleId = styleid;
	}
	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.REFRESH}, optional=false)
	@JoinColumn(name="order_id")
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		//����itemId���������������ɣ�����itemId��Ϊnull���ʸ�дhashCode�㷨��0->super.hashCode()��
		result = prime * result + ((itemId == null) ? super.hashCode() : itemId.hashCode());
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
		final OrderItem other = (OrderItem) obj;
		if (itemId == null) {
			if (other.itemId != null)
				return false;
		} else if (!itemId.equals(other.itemId))
			return false;
		return true;
	}
	
}
