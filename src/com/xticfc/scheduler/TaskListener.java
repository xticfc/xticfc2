package com.xticfc.scheduler;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.quartz.Scheduler;
import org.springframework.beans.factory.annotation.Autowired;

public class TaskListener implements ServletContextListener {

	private ServletContext context = null;
	private Scheduler scheduler;;
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		// TODO Auto-generated method stub
		this.context = null;
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		context = event.getServletContext();
//		try {
			System.out.println(scheduler);
//		} catch (SchedulerException e) {
//			e.printStackTrace();
//		}
	}

	@Autowired
	public Scheduler getScheduler() {
		return scheduler;
	}

	public void setScheduler(Scheduler scheduler) {
		this.scheduler = scheduler;
	}


}
