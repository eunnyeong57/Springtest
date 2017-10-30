package com.newlecture.webapp.aop.spring;

import java.lang.reflect.Method;
import org.springframework.aop.MethodBeforeAdvice;

public class BeforeHandler implements MethodBeforeAdvice{

	@Override
	public void before(Method method, Object[] args, Object target) throws Throwable {

		System.out.println("before handler");
		
		//method.invoke(obj,args);
	}

	

}
