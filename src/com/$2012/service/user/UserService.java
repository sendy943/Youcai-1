package com.$2012.service.user;

import java.io.Serializable;

import com.$2012.dao.Dao;
import com.$2012.entity.user.User;

public interface UserService extends Dao<User> {
	/*�ж��û��Ƿ��Ѵ���*/
	boolean exists(String name);
	/*��¼��֤*/
	boolean validate(String name, String password);
	/*�����û�*/
	void enable(Serializable... entityIds);
	/*�޸�����*/
	void updatePassword(String username, String password);
}
