package com.xticfc.util;

import java.io.IOException;
import java.util.Properties;

/**
 * 常量表，定义各种常量</br>
 * 提供读取配置文件的方法
 * @author xticfc
 *
 */
public class Constants {
	public static String ROOTPATH;

	public static Properties p = new Properties();
	static {
		try {
			p.load(Constants.class.getResourceAsStream("/config.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	/**
	 * 默认返回成功的值，应该是[{"result":"true"}]这样
	 */
	public static final String DEFULT_SUCCESS_RESULT = p.getProperty("successResult", "");
	
	/**
	 * 默认返回失败的值，应该是[{"result":"false"}]这样
	 */
	public static final String DEFULT_FAIL_RESULT = p.getProperty("failResult", "");
	
	/**
	 * 默认的无结果的返回值,应该是[]这样
	 */
	public static final String DEFULT_NO_RESULT = "[]";
	
	
	/**
	 * 是否有效 有效
	 */
	public static final String STATUS_YES = "1";
	
	/**
	 * 是否有效 无效
	 */
	public static final String STATUS_NO = "0";
	
	
	public static final String KAPTCHA_SESSION_KEY = "4028805e34ccd2b23134c0c8b2a00dba";
	
	
	/**
	 * 提取config.properties文件里的值，此文件应该是放在 项目名/config/下</br>
	 * @param key	配置文件里的键
	 * @return 真实值或者"",不会返回null
	 */
	public static String get(String key) {
		return p.getProperty(key, "");
	}
	
	/**
	 * 提取config.properties文件里的值，此文件应该是放在 项目名/config/下</br>
	 * @param key	配置文件里的键
	 * @param defaultValue 如果为空的话，返回的默认值
	 * @return 真实值或者提供的默认值
	 */
	public static String get(String key,String defaultValue) {
		return p.getProperty(key, defaultValue);
	}
	
	/**
	 * 提取config.properties文件里的值，此文件应该是放在 项目名/config/下</br>
	 * 将值转换成int型，如果不存在或不是数值型，返回0
	 * @param key
	 * @return
	 */
	public static int getIntValue(String key){
		return getIntValue(key, 0);
	}
	
	/**
	 * 提取config.properties文件里的值，此文件应该是放在 项目名/config/下</br>
	 * 将值转换成int型，如果不存在或不是数值型，返回提供的默认值
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static int getIntValue(String key, int defaultValue){
		String value = get(key);
		if(StringUtil.isInteger(value)){
			try{
				return Integer.parseInt(value);
			}catch(Exception e){
				e.printStackTrace();
				return defaultValue;
			}
		}else{
			return defaultValue;
		}
	}
}
