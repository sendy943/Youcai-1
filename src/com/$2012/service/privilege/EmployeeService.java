package com.$2012.service.privilege;

import com.$2012.dao.Dao;
import com.$2012.entity.privilege.Employee;

public interface EmployeeService extends Dao<Employee> {
	/*�ж��û����Ƿ����*/
	public boolean exists(String username);
	/*�ж��û����������Ƿ���ȷ*/
	public boolean validate(String username, String password);
}
