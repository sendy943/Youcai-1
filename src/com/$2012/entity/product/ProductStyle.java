package com.$2012.entity.product;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.compass.annotations.Index;
import org.compass.annotations.Searchable;
import org.compass.annotations.SearchableProperty;
import org.compass.annotations.SearchableReference;

/*
 * ��Ʒ��ʽ
 */
@Entity
@Searchable(root=false) //Bug - ������ɾ����ʽʱ��ò��û���Զ���������
public class ProductStyle implements java.io.Serializable {
	private static final long serialVersionUID = 7721005950291955301L;
	private Integer styleId;
	private String name;//��ɫ
	private String productImagePath;
	private Boolean visible = true;
	private Product product; 
	
	@Id @GeneratedValue
	@SearchableProperty(index=Index.NO)
	public Integer getStyleId() {
		return styleId;
	}
	public void setStyleId(Integer styleId) {
		this.styleId = styleId;
	}
	@Column(length=16,nullable=false)
	@SearchableProperty(index=Index.NO, name="styleName")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(length=120,nullable=false)
	@SearchableProperty(index=Index.NO)
	public String getProductImagePath() {
		return productImagePath;
	}
	public void setProductImagePath(String productImagePath) {
		this.productImagePath = productImagePath;
	}
	/*��ò�Ʒԭ�ߴ�ͼƬ·����ͼƬ�����ϴ�����*/
	@Transient
	public String getProductPrototypeImagePath() {
		int i = this.productImagePath.lastIndexOf("/");
		StringBuilder sb = new StringBuilder(this.productImagePath);
		sb.insert(i, "/prototype");
		return sb.toString();
	}
	@Column(nullable=false)
	@SearchableProperty(index=Index.NO)
	public Boolean getVisible() {
		return visible;
	}
	public void setVisible(Boolean visible) {
		this.visible = visible;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((styleId == null) ? 0 : styleId.hashCode());
		return result;
	}
	/*һ����Ʒ���ж����ʽ����ʽ��ͬ���Ʒ��ͬ*/
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		final ProductStyle other = (ProductStyle) obj;
		if (styleId == null) {
			if (other.styleId != null)
				return false;
		} else if (!styleId.equals(other.styleId))
			return false;
		return true;
	}
	@ManyToOne(cascade=CascadeType.REFRESH,optional=false)
	@JoinColumn(name="productId")
	@SearchableReference
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
}
