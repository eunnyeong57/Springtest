package com.newlecture.webapp.aop.spring;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.util.StopWatch;

public class LogHandler implements MethodInterceptor {

	@Override
	public Object invoke(MethodInvocation method) throws Throwable {

		StopWatch watch = new StopWatch();
		watch.start();
		
		Object result = method.proceed();
		watch.stop();
		
		long du = watch.getTotalTimeMillis();
		
		System.out.println(method.getMethod().getName()+"() 호출에"+du+"밀리초 걸렸습니다.");
		
		return result;
	}

}
