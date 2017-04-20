package com.$2012.web.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;

import com.$2012.entity.privilege.Employee;
import com.$2012.entity.privilege.IDCard;
import com.$2012.entity.privilege.PrivilegeGroup;
import com.$2012.entity.privilege.SystemPrivilege;
import com.$2012.entity.product.ProductType;
import com.$2012.service.privilege.EmployeeService;
import com.$2012.service.privilege.PrivilegeGroupService;
import com.$2012.service.privilege.SystemPrivilegeService;
import com.$2012.service.product.ProductTypeService;
import com.$2012.vo.Gender;

import org.apache.struts2.ServletActionContext;

/*
 * ϵͳ��ʼ������ʼ�����ݿ⣩
 * ��Ȼϵͳ��ʼ���Ĺ�������ֱ�������bean��init-method��������У�������
 * ϵͳ���������������ʵ�����ʼ���Ϻã������������󣬷���http://localhost/system/init��
 * ���⣬��ʼ���������������϶����໥������ϵʱ��Ҳ�ʺϼ��й���
 */
@Component
public class SystemInitAction extends BaseAction {
	private static final long serialVersionUID = -5947901814469803284L;
	private SystemPrivilegeService systemPrivilegeService;
	private PrivilegeGroupService privilegeGroupService;
	private EmployeeService employeeService;
	private ProductTypeService productTypeService;
	
	public String execute() {
		initPrivileges();//��ʼ��ϵͳȨ��
		initPrivilegeGroups();//��ʼ��Ȩ����
		initAdmin();//��ʼ��ϵͳ����Ա
		initProductType();//������ʼ��
		message = "ϵͳ��ʼ���ɹ�";
		urladdress = "/employee/go";
		return SUCCESS;
	}
	
	/*
	 * ��ʼ��ϵͳȨ��
	 * ���ݺ�̨ҵ��͹�˾�����Ź������󣬽���̨��ģ�����漰������ز�����װ��ϵͳȨ�޶���Ȼ��������ݿ�
	 * ����ֻ�Բ���ģ�������Ȩ�޴����պ���Ŀ����������Ӫʱ���پ�����������ģ�����Ȩ�޴���
	 */
	private void initPrivileges() {
		if (this.systemPrivilegeService.getCount() == 0) {
			List<SystemPrivilege> privileges = new ArrayList<SystemPrivilege>();
			privileges.add(new SystemPrivilege("department", "add", "�������"));
			privileges.add(new SystemPrivilege("department", "list", "���Ų鿴"));
			privileges.add(new SystemPrivilege("department", "update", "���Ÿ���"));
			privileges.add(new SystemPrivilege("department", "delete", "����ɾ��"));
			
			privileges.add(new SystemPrivilege("employee", "add", "Ա�����"));
			privileges.add(new SystemPrivilege("employee", "list", "Ա���鿴"));
			privileges.add(new SystemPrivilege("employee", "update", "Ա������"));
			privileges.add(new SystemPrivilege("employee", "delete", "Ա����ְ"));
			privileges.add(new SystemPrivilege("employee", "privilegeSet", "Ա��Ȩ�޷���"));
			privileges.add(new SystemPrivilege("employee", "query", "Ա����ѯ"));
			
			privileges.add(new SystemPrivilege("privilegegroup", "add", "Ȩ�������"));
			privileges.add(new SystemPrivilege("privilegegroup", "list", "Ȩ����鿴"));
			privileges.add(new SystemPrivilege("privilegegroup", "update", "Ȩ�������"));
			privileges.add(new SystemPrivilege("privilegegroup", "delete", "Ȩ����ɾ��"));
			
			privileges.add(new SystemPrivilege("user", "list", "�û��鿴"));
			privileges.add(new SystemPrivilege("user", "delete", "�û�����"));
			privileges.add(new SystemPrivilege("user", "enable", "�û�����"));
			
			privileges.add(new SystemPrivilege("order", "unlockAll", "������������"));
			
			this.systemPrivilegeService.batchSave(privileges);
		}
	}
	
	/*
	 * �½���ϵͳȨ���顱����ϵͳ������Ȩ�޼�������
	 */
	private void initPrivilegeGroups() {
		if (this.privilegeGroupService.getCount() == 0) {
			PrivilegeGroup group = new PrivilegeGroup("ϵͳȨ����");
			group.getPrivileges().addAll(this.systemPrivilegeService.getScrollData().getResultList());
			this.privilegeGroupService.save(group);
		}
	}
	
	/*
	 * ��̨����Ҫ��¼�˲ſɽ�ȥ����Ҫ��ʼ��һ��ϵͳ����Ա��Ϊ�������˺š������Ȩ�����
	 */
	private void initAdmin() {
		if (this.employeeService.getCount() == 0) {
			Employee emp = new Employee();
			emp.setName("admin");
			emp.setPassword("admin");
			emp.setRealname("ϵͳ����Ա");
			emp.setGender(Gender.MAN);
			emp.setIdCard(new IDCard("429004198903093876", "����", new Date()));
			emp.getGroups().addAll(this.privilegeGroupService.getScrollData().getResultList());
			this.employeeService.save(emp);
		}
	}
	
	/*
	 * ��ʼ����Ʒ����
	 * ��web.xml��ȡ����س������������ݿ�
	 */
	private void initProductType() {
		if (this.productTypeService.getCount() == 0) {
			ServletContext application = ServletActionContext.getServletContext();
			for (int i = 1; i <= Integer.parseInt(application.getInitParameter("typeCount")); i++) {
				this.productTypeService.save(new ProductType(application.getInitParameter("type"+i)));
			}
		}
	}
	
	public SystemPrivilegeService getSystemPrivilegeService() {
		return systemPrivilegeService;
	}
	@Resource
	public void setSystemPrivilegeService(
			SystemPrivilegeService systemPrivilegeService) {
		this.systemPrivilegeService = systemPrivilegeService;
	}

	public PrivilegeGroupService getPrivilegeGroupService() {
		return privilegeGroupService;
	}
	@Resource
	public void setPrivilegeGroupService(PrivilegeGroupService privilegeGroupService) {
		this.privilegeGroupService = privilegeGroupService;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}
	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public ProductTypeService getProductTypeService() {
		return productTypeService;
	}
	@Resource
	public void setProductTypeService(ProductTypeService productTypeService) {
		this.productTypeService = productTypeService;
	}

}
