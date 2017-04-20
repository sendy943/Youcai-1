package com.$2012.vo;

import java.util.ArrayList;
import java.util.List;

import com.$2012.entity.order.Acceptor;
import com.$2012.entity.order.Buyer;
import com.$2012.entity.order.PaymentWay;

/*
 * ���ﳵ
 */
public class Cart {
	/*������*/
	private List<BuyItem> items = new ArrayList<BuyItem>();
	
	/*�ջ���*/
	private Acceptor acceptor;
	/*������*/
	private Buyer buyer; 
	/*�������Ƿ�Ҳ���ջ���*/
	private String buyerIsAcceptor;
	/*֧����ʽ*/
	private PaymentWay paymentWay;
	/*���ͷ�*/
	private float deliverFee = 10f;
	/*��������*/
	private String note;
	
	/*
	 * ��ӹ�����
	 */
	public void addItem(BuyItem item) {
		if (!items.contains(item)) {
			items.add(item);
		} else {
			for (BuyItem bi : items) {
				if (bi.equals(item)) {
					bi.setAmount(bi.getAmount() + 1);
					break;
				}
			}
		}
	}
	
	/*
	 * ��չ��ﳵ
	 */
	public void clear() {
		items.clear();
	}
	
	/*
	 * ɾ��������
	 */
	public void deleteItem(BuyItem item) {
		if (items.contains(item)) items.remove(item);
	}
	

	public List<BuyItem> getItems() {
		return items;
	}

	public void setItems(List<BuyItem> items) {
		this.items = items;
	}

	/*
	 * ������Ʒ���ܽ��
	 */
	public float getTotalSalePrice(){
		float result = 0f;
		for(BuyItem item : items){
			result += item.getProduct().getSalePrice() * item.getAmount();
		}
		return result;
	}
	
	/*
	 * ������Ʒ���ܽ�ʡ���
	 */
	public float getTotalSavedPrice(){
		float result = 0f;
		for(BuyItem item : items){
			result += item.getProduct().getMarketPrice() * item.getAmount();
		}
		return result - getTotalSalePrice();
	}
	
	/*
	 * ���㶩���ܽ��
	 */
	public float getOrderTotalPrice() {
		return this.getTotalSalePrice() + this.getDeliverFee();
	}

	public String getBuyerIsAcceptor() {
		return buyerIsAcceptor;
	}

	public void setBuyerIsAcceptor(String buyerIsAcceptor) {
		this.buyerIsAcceptor = buyerIsAcceptor;
	}

	public Acceptor getAcceptor() {
		return acceptor;
	}

	public void setAcceptor(Acceptor acceptor) {
		this.acceptor = acceptor;
	}

	public Buyer getBuyer() {
		return buyer;
	}

	public void setBuyer(Buyer buyer) {
		this.buyer = buyer;
	}

	public PaymentWay getPaymentWay() {
		return paymentWay;
	}

	public void setPaymentWay(PaymentWay paymentWay) {
		this.paymentWay = paymentWay;
	}

	public float getDeliverFee() {
		return deliverFee;
	}

	public void setDeliverFee(float deliverFee) {
		this.deliverFee = deliverFee;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}
