package com.$2012.entity.product;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.compass.annotations.Index;
import org.compass.annotations.Searchable;
import org.compass.annotations.SearchableComponent;
import org.compass.annotations.SearchableId;
import org.compass.annotations.SearchableProperty;

/*
 * ��Ʒ���飩
 */
@Entity 
@Searchable
public class Product implements java.io.Serializable {
	private static final long serialVersionUID = 6038809104006738452L;
	private Integer productId;
	/*����*/
	private String code;
	/*��Ʒ����*/
	private String name;
	/*��Ʒ����*/
	private ProductType type;
	/*�׼�*/
	private Float basePrice;
	/*�г���*/
	private Float marketPrice;
	/*���ۼ�*/
	private Float salePrice;
	/*���*/
	private String description;
	/*���(ȥ��html��ǩ)*/
	private String description2;
	/*����˵��*/
	private String buyExplain;
	/*�Ƿ�ɼ�*/
	private Boolean visible = true;
	/*�ϼ�����*/
	private Date showDate = new Date();
	/*��������*/
	private Integer saleCount = 0;//�������ջ�����ͳ��
	/*����ָ��-����Ŀ��ָ�������Ĵ���*/
	private Long clickCount = 0L;
	/*�Ƿ��Ƽ�*/
	private Boolean commend = false;
	/*��Ʒ��ʽ*/
	private Set<ProductStyle> styles = new HashSet<ProductStyle>();
	/*Ʒ��*/
	private Brand brand;
	
	@Id @GeneratedValue 
	@SearchableId
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	@Column(length=30)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}                                                      
	@Column(length=50,nullable=false) 
	@SearchableProperty(index=Index.ANALYZED, boost=2, name="productName")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@ManyToOne(cascade=CascadeType.REFRESH,optional=false)
	@JoinColumn(name="typeId")//�ڹ�ϵά���������
	@SearchableComponent
	public ProductType getType() {
		return type;
	}
	public void setType(ProductType type) {
		this.type = type;
	}
	@Column(nullable=false)
	public Float getBasePrice() {
		return basePrice;
	}
	public void setBasePrice(Float basePrice) {
		this.basePrice = basePrice;
	}
	@Column(nullable=false) 
	@SearchableProperty(index=Index.NO)
	public Float getMarketPrice() {
		return marketPrice;
	}
	public void setMarketPrice(Float marketPrice) {
		this.marketPrice = marketPrice;
	}
	@Column(nullable=false) 
	@SearchableProperty(index=Index.NO)
	public Float getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(Float salePrice) {
		this.salePrice = salePrice;
	}
	@Transient
	public Float getSavedPrice() {
		return this.marketPrice - this.salePrice;
	}
	@Lob @Column(nullable=false)  
	@SearchableProperty
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Column(length=30) 
	@SearchableProperty(index=Index.NO)
	public String getBuyExplain() {
		return buyExplain;
	}
	public void setBuyExplain(String buyExplain) {
		this.buyExplain = buyExplain;
	}
	@Column(nullable=false)
	@SearchableProperty(index=Index.NO)
	public Boolean getVisible() {
		return visible;
	}
	public void setVisible(Boolean visible) {
		this.visible = visible;
	}
	@Temporal(TemporalType.DATE)
	public Date getShowDate() {
		return showDate;
	}
	public void setShowDate(Date showDate) {
		this.showDate = showDate;
	}
	@Column(nullable=false)
	public Integer getSaleCount() {
		return saleCount;
	}
	public void setSaleCount(Integer saleCount) {
		this.saleCount = saleCount;
	}
	@Column(nullable=false)
	public Long getClickCount() {
		return clickCount;
	}
	public void setClickCount(Long clickCount) {
		this.clickCount = clickCount;
	}
	@Column(nullable=false)
	public Boolean getCommend() {
		return commend;
	}
	public void setCommend(Boolean commend) {
		this.commend = commend;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((productId == null) ? 0 : productId.hashCode());
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
		final Product other = (Product) obj;
		if (productId == null) {
			if (other.productId != null)
				return false;
		} else if (!productId.equals(other.productId))
			return false;
		return true;
	}
	@OneToMany(cascade=CascadeType.ALL,mappedBy="product")
	@OrderBy("visible desc, styleId asc")
	@SearchableComponent
	public Set<ProductStyle> getStyles() {
		return styles;
	}
	public void setStyles(Set<ProductStyle> styles) {
		this.styles = styles;
	}
	/*
	 * �����ʽ
	 */
	public void addStyle(ProductStyle style) {
		if (!this.styles.contains(style)) {
			style.setProduct(this);
			this.styles.add(style);
		}
	}
	/*
	 * ɾ����ʽ
	 */
	public void removeStyle(ProductStyle style) {
		if (this.styles.contains(style)) {
			style.setProduct(null);
			this.styles.remove(style);
		}
	}
	@Transient
	public String getDescription2() {
		return description2;
	}
	public void setDescription2(String description2) {
		this.description2 = description2;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)//ʵ���кܶ��Ʒδ����Ʒ��
	@JoinColumn(name="brandId")
	@SearchableComponent
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
}
