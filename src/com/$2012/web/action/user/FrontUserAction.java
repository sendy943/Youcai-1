package com.$2012.web.action.user;

import java.io.StringWriter;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.$2012.entity.user.User;
import com.$2012.service.user.UserService;
import com.$2012.utils.*;
import com.$2012.web.action.BaseAction;
import com.$2012.web.action.shopping.CartAction;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;

/*
 * ע���¼���һ�����
 */
@Component
@Scope("prototype")
public class FrontUserAction extends BaseAction implements SessionAware {
	private static final long serialVersionUID = 5058953534890081662L;
	
	private UserService userService;
	private User user;
	
	private String msg;//������ʾ��Ϣ
	
	private Map<String, Object> session;
	
	//�һ�������ز���
	private String username;
	private String validateCode;//��MD5����username+password
	private long time;//�һ�������ʱ������
	private String password;
	
	private String regCode;//ע��ʱ�õ���֤��
	
	private String toUI;
	private String xiaoshuoUI;
	
	private CartAction cartAction;
	
	/*
	 * ����û����Ƿ��Ѵ���     ���Ҫ���ڷ����Ҳ��������У�飬����validateXxx()---xml
	 */
	public String checkName() {
		if (userService.exists(username)) {
			msg = "���û�����ע��";
		} else {
			msg = "��ϲ�����û�����ע��";
		}
		
		WebUtils.ajaxCallback(msg, "html");
		
		return null;
	}
	
	/*
	 * ���У����
	 */
	public String checkCode() {
		if (!regCode.equals(WebUtils.getCode(ServletActionContext.getRequest()))) {
			msg = "������֤���������������";
		} else {
			msg = "������֤����ȷ";
		}
		
		WebUtils.ajaxCallback(msg, "html");
		
		return null;
	}
	
	/*
	 * ע��
	 */
	public String register() {
		user.setRegTime(new Date());
		userService.save(user);
		return SUCCESS;
	}
	/*
	 * ��¼
	 */
	public String login() {
		if (userService.validate(user.getName().trim(), user.getPassword().trim())) {
			session.put("user", userService.find(user.getName()));//����¼�û�����session��
			//cartUI--�μ�com.hongxi.web.filter.UserLoginFilter
			if("cartUI".equals(toUI)) {
				cartAction.setAmount();
				return "toCartUI";
			} else if("myCenterUI".equals(toUI)) {
				return "toMyCenterUI";
			} else return SUCCESS;
		} else {
			this.addFieldError("login", "�û������������");
			return "nameorpass";
		} 
	}
	/*
	 * �˳���¼
	 */
	public String logout() {
		WebUtils.deleteUser(ServletActionContext.getRequest());
		return SUCCESS;
	}
	
	
	/*
	 * �һ�����֮�����ʼ�
	 */
	public String sendMail() throws Exception {
		if (user.getName() != null && !"".equals(user.getName().trim())) {
			if (userService.exists(user.getName().trim())) {
				user = userService.find(user.getName().trim());
				Template template = Velocity.getTemplate("email.html");
				VelocityContext context = new VelocityContext();
				context.put("username", user.getName());
				context.put("validateCode", MD5.MD5Encode(user.getName()
						+ user.getPassword()));
				context.put("time", new Date().getTime());
				StringWriter writer = new StringWriter();
				template.merge(context, writer);
				String emailContent = writer.toString();
				EmailSender.send(user.getEmail(), "������--�һ������ʼ�", emailContent, "text/html");
			}
		} 
		return SUCCESS; 
	}
	/*���跢�ͳɹ�-�����ʼ��漰��һЩ�ʼ�����֪ʶ�д�ѧϰ����*/
	public String xx() {
		if (user.getName() != null && !"".equals(user.getName().trim())) {
			if (userService.exists(user.getName().trim())) {
				user = userService.find(user.getName().trim());
				username = user.getName();
				validateCode = MD5.MD5Encode(user.getName() + user.getPassword());
				time = new Date().getTime();
			}
		} 
		return SUCCESS;
	}
	
	/*
	 * �һ�����֮��ʾ�޸��������
	 */
	public String showChangePasswordUI() {
		if((new Date().getTime() - time) <= 24*60*60*1000) {
			if (username != null && !"".equals(username)) {
				if (userService.exists(username)) {
					user = userService.find(username);
					String code = MD5.MD5Encode(user.getName() + user.getPassword());
					if (code.equals(validateCode)) return SUCCESS;
				}
			}
		} else {
			return "error";
		}
		return "error"; 
	}
	
	/*
	 * �һ�����֮�޸�����
	 */
	public String changePassword() {
		if (username != null && !"".equals(username)) {
			if (userService.exists(username)) {
				user = userService.find(username);
				String code = MD5.MD5Encode(user.getName() + user.getPassword());
				if (code.equals(validateCode)) {
					userService.updatePassword(username, password);
					message = "�޸�����ɹ�";
					urladdress = "/page/user/front/login.jsp";
					return SUCCESS;
				}
			}
		}
		return "error"; 
	}

	public UserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getValidateCode() {
		return validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	public String getRegCode() {
		return regCode;
	}

	public void setRegCode(String regCode) {
		this.regCode = regCode;
	}

	public long getTime() {
		return time;
	}

	public void setTime(long time) {
		this.time = time;
	}

	public String getXiaoshuoUI() {
		return xiaoshuoUI;
	}

	public void setXiaoshuoUI(String xiaoshuoUI) {
		this.xiaoshuoUI = xiaoshuoUI;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getToUI() {
		return toUI;
	}

	public void setToUI(String toUI) {
		this.toUI = toUI;
	}
	
	public CartAction getCartAction() {
		return cartAction;
	}
	@Resource
	public void setCartAction(CartAction cartAction) {
		this.cartAction = cartAction;
	}

}
