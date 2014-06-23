package com.xticfc.test;

import java.util.Date;

public class TestThread {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		TestHttpComponents thc = new TestHttpComponents();
		System.out.println(new Date().getTime());
		thc.start();
		System.out.println(new Date().getTime());

	}

}
