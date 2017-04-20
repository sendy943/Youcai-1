package com.$2012.web.action.privilege;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Pointcut;
/*
 * Ȩ������
 *  ����Ŀ����Ȩ�������õ���struts2��������PermissionInterceptor��û��ѡ��spring��AOP�����������ߵ�˼·һ��
 */
//@Component @Aspect
public class PermissionAspect {
	@SuppressWarnings("unused")
	@Pointcut("execution(public String com.youcai.web.action..*.*())")
    private void anyMethod() {}
	
	@Around("anyMethod()")
    public Object doBasicProfiling(ProceedingJoinPoint pjp) throws Throwable {
        return pjp.proceed();
    }
}
