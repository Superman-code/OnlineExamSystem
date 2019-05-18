package org.xkj.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateSessionFactory {
	private static final String CONFIG_FILE_LOCATION = "/hibernate.cfg.xml";	//定义配置文件路径
	/*
	 * ThreadLocal对象可以保存不同线程下的session对象
	 */
	private static final ThreadLocal<Session> threadLocal = new ThreadLocal<Session>();		//定义ThreadLocal对象
	private static Configuration configuration = new Configuration();	//定义Configuration对象
	private static SessionFactory sessionFactory;	//定义SessionFactory对象
	private static String configFile = CONFIG_FILE_LOCATION;
	
	static {
		rebuildSessionFactory();
	}
	
	private HibernateSessionFactory() {} //表示此类不可实例化，只能使用静态方法
	
	public static Session getSession() {
		Session session = threadLocal.get();  //获得session对象
		if(session == null||!session.isOpen()) {  //判断session对象是否为空或未打开
			if(sessionFactory == null) {	//如果没有创建SessionFactory对象
				rebuildSessionFactory();
			}
			//如果SessionFactory对象不为空，则调用其openSession方法创建
			session = sessionFactory.openSession();
			threadLocal.set(session);	//在threadLocal对象中保存该Session对象
		}
		return session;
	}

	private static void rebuildSessionFactory() {
		try {
			//读取配置文件
			configuration.configure(configFile);
			//创建sessionFactory对象
			sessionFactory = configuration.buildSessionFactory();
		} catch (Exception e) {
			System.err.println("%%%% Error Creating SessionFactory %%%%");
		}
	}

	public static void closeSession() {
		Session session = threadLocal.get();	//获得session对象
		if(session != null) {
			session.close();  //如果session不为空，关闭session
		}
//		threadLocal.set(null);	//将当前线程保存的session对象从threadLocal对象移除
		threadLocal.remove();
	}
	
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	public static Configuration getConfiguration() {
		return configuration;
	}

	public static void setConfigFile(String configFile) {
		HibernateSessionFactory.configFile = configFile;
	}
}
