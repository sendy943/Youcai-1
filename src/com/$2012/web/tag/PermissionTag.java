package com.$2012.web.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.$2012.entity.privilege.Employee;
import com.$2012.entity.privilege.PrivilegeGroup;
import com.$2012.entity.privilege.SystemPrivilege;
import com.$2012.entity.privilege.SystemPrivilegePK;
import com.$2012.utils.WebUtils;

/*
 * Ȩ��У���ǩ  ��Ҳ�ɶ���Ȩ��ע�⣬Ȼ����AOP��ⷽ�����Ƿ���Ȩ��ע�⣬�����������أ�
 */
public class PermissionTag extends TagSupport {
	private static final long serialVersionUID = -2239087804642296923L;
	
	/*ģ��*/
	private String module;
	/*Ȩ��*/
	private String privilege;
	
	@Override
	public int doStartTag() throws JspException {
		boolean result = false;
		Employee emp = WebUtils.getEmp((HttpServletRequest) pageContext.getRequest());
		SystemPrivilege privilege = new SystemPrivilege(new SystemPrivilegePK(this.module, this.privilege));
		for(PrivilegeGroup group : emp.getGroups()){
			if(group.getPrivileges().contains(privilege)){
				result = true;
				break;
			}
		}
		return result ? EVAL_BODY_INCLUDE : SKIP_BODY;
	}
	public String getPrivilege() {
		return privilege;
	}
	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
}
