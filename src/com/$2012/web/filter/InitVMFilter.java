package com.$2012.web.filter;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.velocity.app.Velocity;

/*
 * ģ���ʼ��������
 */
public class InitVMFilter implements Filter {

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterchain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		req.setCharacterEncoding("GBK");
		filterchain.doFilter(request, response);
	}

	/*
	 * ���ʽ���� �����ƣ���·����
	 */
	public void init(FilterConfig config) throws ServletException {
		try{
			Properties prop = new Properties();
			prop.put("runtime.log", config.getServletContext().getRealPath("/log/velocity.log"));
			prop.put("file.resource.loader.path", config.getServletContext().getRealPath("/vm"));
			prop.put("input.encoding", "GBK");
			prop.put("output.encoding", "GBK");
			Velocity.init(prop);
		}catch( Exception e ){
			e.printStackTrace();
		}
	}

}
