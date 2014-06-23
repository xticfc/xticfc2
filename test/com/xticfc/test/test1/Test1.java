package com.xticfc.test.test1;

public class Test1 {

	public static void main(String[] args) {
		System.out.println(Test1.test1());
	}
	
	public static int test1(){
		try{
			return 1;
		}finally{
			return 2;
		}
	}
}
