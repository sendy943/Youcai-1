package com.$2012.web.action.privilege;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;
import org.springframework.stereotype.Component;

import com.$2012.entity.privilege.Employee;
import com.$2012.entity.privilege.PrivilegeGroup;
import com.$2012.entity.privilege.SystemPrivilege;
import com.$2012.entity.privilege.SystemPrivilegePK;
import com.$2012.utils.WebUtils;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
/*
 * Ȩ��������
 */
@Component
public class PermissionInterceptor implements Interceptor {
	private static final long serialVersionUID = 5451842413580775186L;

	public void destroy() {
	}

	public void init() {
	}

	public String intercept(ActionInvocation invocation) throws Exception {
		//��������ʷ���
		Method method = invocation.getAction().getClass().getMethod(invocation.getProxy().getConfig().getMethodName());
		HttpServletRequest request = (HttpServletRequest) invocation.getInvocationContext().get(StrutsStatics.HTTP_REQUEST);
		if(method!=null && method.isAnnotationPresent(Permission.class)){
			//�õ������ϵ�ע��
			Permission permission = method.getAnnotation(Permission.class);
			//�õ�ִ�з�����Ҫ��Ȩ��
			SystemPrivilege methodPrivilege = new SystemPrivilege(new SystemPrivilegePK(permission.module(), permission.privilege()));
			Employee emp = WebUtils.getEmp(request);
			for(PrivilegeGroup group : emp.getGroups()){
				if(group.getPrivileges().contains(methodPrivilege)) return invocation.invoke();
			}
		}
		request.setAttribute("message", "��û��ִ�иö�����Ȩ��");
		//request.setAttribute("urladdress", request.getRequestURL());
		return "noPermission";
	}

}
