package com.$2012.entity.privilege;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/*
 * ����
 */
@Entity   //ʹ�ö���������������������ʣ��Ķ������������� <load,iterate..Ĭ��ʹ�ö������棬���Ȳ�������棬û���ٲ�һ��session����>
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Department {
	private String departmentId;
	private String name;
	private Set<Employee> employees = new HashSet<Employee>();
	
	public Department(){}
	
	public Department(String name) {
		this.name = name;
	}
	
	@OneToMany(mappedBy="department")
	public Set<Employee> getEmployees() {
		return employees;
	}
	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	}
	
	@Column(length=20, nullable=false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Id @Column(length=36)
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((departmentId == null) ? 0 : departmentId.hashCode());
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
		final Department other = (Department) obj;
		if (departmentId == null) {
			if (other.departmentId != null)
				return false;
		} else if (!departmentId.equals(other.departmentId))
			return false;
		return true;
	}
	
}
