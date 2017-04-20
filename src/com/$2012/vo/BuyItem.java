package com.$2012.vo;

import com.$2012.entity.product.Product;
import com.$2012.entity.product.ProductStyle;

/*
 * ������Ƿ�Ϊͬһ������ɲ�Ʒid�Ͳ�Ʒ��ʽid��ͬ������
 */
public class BuyItem {
	/*�������Ʒ*/
	private Product product;
	/*���������*/
	private int amount;
	
	public BuyItem(Product product) {
		this.product = product;
	}
	public BuyItem(Product product, int amount) {
		this.product = product;
		this.amount = amount;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public int hashCode() {
		String itemId = product.hashCode() + "-";
		if (product.getStyles().size() > 0)
			itemId += product.getStyles().iterator().next().getStyleId();
		return itemId.hashCode();
	}
	/*
	 * �Ƿ�Ϊͬһ������ɲ�Ʒid�Ͳ�Ʒ��ʽid��ͬ����
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		final BuyItem other = (BuyItem) obj;
		if (product == null) {
			if (other.product != null)
				return false;
		} else if (!product.equals(other.product))
			return false;
		
		if (product.getStyles().size() != other.product.getStyles().size())
			return false;
		if (product.getStyles().size() > 0) {
			ProductStyle style = product.getStyles().iterator().next();
			ProductStyle otherStyle = other.product.getStyles().iterator().next();
			if (!style.equals(otherStyle))
				return false;
		}
		return true;
	}
}
