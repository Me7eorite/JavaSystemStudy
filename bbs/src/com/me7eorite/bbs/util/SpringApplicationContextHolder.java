package com.me7eorite.bbs.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;


/**
 *  加载Spring配置文件时，如果Spring配置文件中所定义的Bean类实现了ApplicationContextAware 接口，
 *  那么在加载Spring配置文件时，会自动调用ApplicationContextAware 接口中的
 *  setApplicationContext(ApplicationContext context)方法
 *
 */

public class SpringApplicationContextHolder implements ApplicationContextAware {
	private static ApplicationContext context;

	@Override
	public void setApplicationContext(ApplicationContext context)
			throws BeansException {
		SpringApplicationContextHolder.context = context;
	}

	
	public static Object getSpringBean(String beanName) {
		if(StringUtil.isNotBlank(beanName)){
			return context.getBean(beanName);
		}else{
			return null;
		}
	}

	public static String[] getBeanDefinitionNames() {
		return context.getBeanDefinitionNames();
	}

}
