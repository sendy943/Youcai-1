package com.$2012.entity.user;

import java.io.Serializable;
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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.$2012.entity.order.Order;
import com.$2012.vo.Gender;

/*
 * ��վ�û�
 */
@Entity
public class User implements Serializable{
	private static final long serialVersionUID = 8394979715028899027L;
	/** �û��� **/
	private String name;
	/** ���� **/
	private String password;//����MD5����
	/** ��ʵ���� **/
	private String realname;
	/** �������� **/
	private String email;
	/** �Ա� **/
	private Gender gender=Gender.MAN;
	/** �Ƿ����� **/
	private Boolean visible=true;
	/** ע��ʱ�� **/
	private String regTime =new Date().toString();
	/** ��ϵ��Ϣ **/
	private ContactInfo contactInfo;
	/* ���� */
	private Set<Order> orders = new HashSet<Order>();
	
	@Id @Column(length=18)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	//@Temporal(TemporalType.TIMESTAMP) @Column(nullable=true)
	@Column(length=32,nullable=false)
	public String getRegTime() {
		return regTime;
	}

	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}

	@Column(length=32,nullable=false)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(length=8)
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	@Column(length=50,nullable=false)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Enumerated(EnumType.STRING) @Column(nullable=false,length=5)
	public Gender getGender() {
		return gender;
	}
	public void setGender(Gender gender) {
		this.gender = gender;
	}
	@Column(nullable=false)
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
		result = prime * result
				+ ((name == null) ? 0 : name.hashCode());
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
		final User other = (User) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="contactId")
	public ContactInfo getContactInfo() {
		return contactInfo;
	}

	public void setContactInfo(ContactInfo contactInfo) {
		this.contactInfo = contactInfo;
	}

	@OneToMany(mappedBy="user",cascade=CascadeType.REMOVE)
	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
}
