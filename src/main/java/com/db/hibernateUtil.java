package com.db;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class hibernateUtil {
	public static SessionFactory factory;
	 public static SessionFactory getSessionFactory(){
		 if(factory==null)
		 {
			 Configuration cfg=new Configuration();
			 factory = cfg.configure("hibernate.cfg.xml").buildSessionFactory();
		 }
		return factory;
	 }
}
