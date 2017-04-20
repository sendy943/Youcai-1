package com.$2012.web.action.user;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.$2012.entity.user.User;
import com.$2012.service.user.UserService;
import com.$2012.vo.PageContext;
import com.$2012.vo.QueryResult;
import com.$2012.web.action.BaseAction;
import com.$2012.web.action.privilege.Permission;

/*
 * ��ע�ᣩ�û�����
 */
@Component
@Scope("prototype")
public class UserAction extends BaseAction {
	private static final long serialVersionUID = 8670695198890029866L;

	private UserService userService;
	private List<User> users = new ArrayList<User>();
	private User user;
	
	private PageContext<User> pageCtx;
	private String query;
	
	private String[] names;
	
	@Permission(module="user", privilege="list")
	public String list() {
		pageCtx = new PageContext<User>(12, pageCtx.getCurrentPage());
		StringBuilder whereql = new StringBuilder("1=1");
		List<Object> params = new ArrayList<Object>();
		if ("true".equals(query)) {//ִ�в�ѯ
			String name = user.getName();//��ʵ������ֻ������type������ԣ���������ȫ����ѯ
			String realname = user.getRealname();
			String email = user.getEmail();
			if (name != null && !"".equals(name.trim())) {
				whereql.append(" and o.name like ?");
				params.add("%" + name + "%");
			}
			if (realname != null && !"".equals(realname.trim())) {
				whereql.append(" and o.realname like ?");
				params.add("%" + realname + "%");
			}
			if (email != null && !"".equals(email.trim())) {
				whereql.append(" and o.email like ?");
				params.add("%" + email + "%");
			}
		} 
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("name", "asc");
		QueryResult<User> qr = userService.getScrollData(pageCtx.getFirstResult(), pageCtx.getMaxResults(), whereql.toString(), params, orderby);
		users = qr.getResultList();
		pageCtx.setQueryResult(qr);
		return SUCCESS;
	}
	
	/*����*/@Permission(module="user", privilege="delete")
	public String delete() {
		userService.delete((Serializable[]) names);
		return SUCCESS;
	}
	/*����*/@Permission(module="user", privilege="enable")
	public String enable() {
		userService.enable((Serializable[]) names);
		return SUCCESS;
	}

	public UserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public PageContext<User> getPageCtx() {
		return pageCtx;
	}
	@Resource
	public void setPageCtx(PageContext<User> pageCtx) {
		this.pageCtx = pageCtx;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public String[] getNames() {
		return names;
	}

	public void setNames(String[] names) {
		this.names = names;
	}

}
