package com.xticfc.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestUtils;



public class StringUtil extends StringUtils {

	static Log log = LogFactory.getLog(StringUtil.class);
	
	public static void main(String[] args) {
//		String s = getMD5("111111".getBytes());
//		System.out.println(s);
//		Date d = new Date();
//		System.out.println(d.toString());
	}
	
	/**
	 * 计算显示的页数,特殊数据已被处理,不会报错
	 * @param total			总数据个数
	 * @param pageSize		每页显示的个数
	 * @return
	 */
	public static int getPageNum(int total, int pageSize){
		if(total <=0 || pageSize <= 0){
			return 0;
		}
		if(total%pageSize == 0){
			return total/pageSize;
		}else{
			return total/pageSize + 1;
		}
	}
	
	/**
	 * 解决GET方式乱码问题
	 * @param s
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String encode(String s) throws UnsupportedEncodingException{
		if(null == s || s.length() == 0){
			return "";
		}
		s = new String(s.getBytes("iso-8859-1"),"UTF-8");
		return s;
	}

	/**
	 * 计算当前的起始页数，特殊数据已被处理,不会报错
	 * @param startPage	当前的起始数
	 * @param pageSize	每页个数
	 * @return
	 */
	public static int getStartPage(int startPage, int pageSize){
		if(startPage <= 0 || pageSize <= 0){
			return 0;
		}
		return startPage/pageSize;
	}
	
	
	
	/**
	 * 根据提供的参数，生成md5值</br>
	 * 会对传过来的值用UTF-8方式编码
	 * @param source
	 * @return	正常的字符串，出错会返回null
	 */

	public static String getMD5(String ss) {
		byte[] source;
		try {
			source = ss.getBytes("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
			return null;
		}
		String s = null;
		char hexDigits[] = { // 用来将字节转换成 16 进制表示的字符
		'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd',
				'e', 'f' };
		try {
			java.security.MessageDigest md = java.security.MessageDigest
					.getInstance("MD5");
			md.update(source);
			byte tmp[] = md.digest(); // MD5 的计算结果是一个 128 位的长整数，
			// 用字节表示就是 16 个字节
			char str[] = new char[16 * 2]; // 每个字节用 16 进制表示的话，使用两个字符，
			// 所以表示成 16 进制需要 32 个字符
			int k = 0; // 表示转换结果中对应的字符位置
			for (int i = 0; i < 16; i++) { // 从第一个字节开始，对 MD5 的每一个字节
				// 转换成 16 进制字符的转换
				byte byte0 = tmp[i]; // 取第 i 个字节
				str[k++] = hexDigits[byte0 >>> 4 & 0xf]; // 取字节中高 4 位的数字转换, 
				// >>> 为逻辑右移，将符号位一起右移
				str[k++] = hexDigits[byte0 & 0xf]; // 取字节中低 4 位的数字转换
			}
			s = new String(str); // 换后的结果转换为字符串

		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}

	/**
	 * 本方法封装了往前台设置的header,contentType等信息
	 * @param message			需要传给前台的数据
	 * @param type				指定传给前台的数据格式,如"html","json"等
	 * @param response			HttpServletResponse对象
	 * @throws IOException
	 * @createDate 2010-12-31 17:55:41
	 */
	public static void writeToWeb(String message, String type, HttpServletResponse response) throws IOException{
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setContentType("text/" + type +"; charset=utf-8");
		response.getWriter().write(message);
		response.getWriter().close();
	}

	
	
	
	
	/**
	 * 如果传过来个空，则返回""</br>
	 * 否则返回原对象
	 * @param o
	 * @return
	 */
	public static Object nullToSpace(Object o){
		if(null == o){
			return "";
		}
		return o;
	}
	
	/**
	 * 提供字符串是否可转换成数值型的判断</br>
	 * 如果可转成数值，则返回false</br>
	 * 如果不可转成数值，则返回true</br>
	 * isnan == is not a number</br>
	 * @param s	需要测试的字符串
	 * @return	true or false
	 */
	public static boolean isNAN(String s){
		if(null == s || s.length() == 0){
			return true;
		}
		Pattern pattern = Pattern.compile("[-+]?[0-9]*\\.?[0-9]+$");
		Matcher isNum = pattern.matcher(s);
		if(isNum.matches()){
			return false;
		}else{
			return true;
		}
	}
	
	public static boolean isInteger(String s){
		if(null == s || s.length() == 0){
			return false;
		}
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		return pattern.matcher(s).matches();
	}
	
	/**
	 * 删除掉JSON串前后的[]，某些插件不能解析带[]的json格式
	 * @param json
	 * @return
	 */
	public static String treatJson(String json){
		if(null == json || json.length() < 3){
			return "";
		}
		json = json.substring(1, json.length());
		json = json.substring(0, json.length()-1);
		return json;
	}
	
	
	/**
	 * 取随机的32位uuid
	 * @return
	 */
	public static String getUUID () {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	/**
	 * 获取通过jqGrid传过来的排序参数
	 * @param request
	 * @return
	 */
	public static String getOrderString(HttpServletRequest request){
		String orderString = "";
		Enumeration<String> e = request.getParameterNames();
		while(e.hasMoreElements()){
			System.out.println(e.nextElement());
		}
		String sortName = ServletRequestUtils.getStringParameter(request, "sidx", "");
		String sortOrder = ServletRequestUtils.getStringParameter(request, "sord", "");
		if(sortName.length() > 0){
			orderString = sortName;
			if(sortOrder.length() > 0){
				orderString += " " + sortOrder;
			}
		}
		return orderString;
	}
	
	/**
	 * 判断一个字符串是不是空或者为""
	 * @param s
	 * @return
	 */
	public static boolean isNullOrSpace(String s){
		if(null == s || s.length() == 0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 把Map<String,Object>处理成实体类
	 * @param clazz		想要的实体类
	 * @param list		包含信息的列表
	 * @return
	 */
	public static List<?> mapToList(Class<?> clazz, List<Map<String,Object>> list){
		
		if(null == list || list.size() == 0){
			return null;
		}
		List<Object> result = new ArrayList<Object>();
		Map<String,Object> map;
		for(Iterator<Map<String,Object>> iter = list.iterator(); iter.hasNext();){
			map = iter.next();
			result.add(mapToObject(clazz, map));
		}
		return result;
	}
	
	/**
	 * 把Map<String,Object>处理成实体类
	 * @param clazz		想要的实体类
	 * @param map		包含信息的Map对象
	 * @return
	 */
	public static Object mapToObject(Class<?> clazz, Map<String,Object> map){
		
		if(null == map){
			return null;
		}
		
		Field[] fields = clazz.getDeclaredFields();	//取到所有类下的属性，也就是变量名
		Field field;
		Object o = null;
		try {
			o = clazz.newInstance();
		} catch (InstantiationException e1) {
			e1.printStackTrace();
		} catch (IllegalAccessException e1) {
			e1.printStackTrace();
		}
		for(int i=0; i<fields.length; i++){
			field = fields[i];
			String fieldName = field.getName();
			//把属性的第一个字母处理成大写
			String stringLetter=fieldName.substring(0, 1).toUpperCase();    
			//取得set方法名，比如setBbzt
			String setName="set"+stringLetter+fieldName.substring(1);    
			//真正取得get方法。
			Method setMethod = null;
			Class<?> fieldClass = field.getType();
			try {
				if(isHaveSuchMethod(clazz, setName)){
					Object value = map.get(fieldName);
					if(fieldClass == String.class){
						setMethod = clazz.getMethod(setName, fieldClass);
						setMethod.invoke(o, value == null ? null : String.valueOf(value));//为其赋值 
					}else if(fieldClass == Integer.class || fieldClass == int.class){
						setMethod = clazz.getMethod(setName, fieldClass);
						setMethod.invoke(o, value == null ? null : Integer.parseInt(String.valueOf(value)));//为其赋值 
					}else if(fieldClass == Boolean.class || fieldClass == boolean.class){
						setMethod = clazz.getMethod(setName, fieldClass);
						setMethod.invoke(o, value == null ? null : Boolean.getBoolean(String.valueOf(value)));//为其赋值 
					}else if(fieldClass == Short.class || fieldClass == short.class){
						setMethod = clazz.getMethod(setName, fieldClass);
						setMethod.invoke(o, value == null ? null : Short.parseShort(String.valueOf(value)));//为其赋值 
					}else if(fieldClass == Long.class || fieldClass == long.class){
						setMethod = clazz.getMethod(setName, fieldClass);
						setMethod.invoke(o, value == null ? null : Long.parseLong(String.valueOf(value)));//为其赋值 
					}else if(fieldClass == Double.class || fieldClass == double.class){
						setMethod = clazz.getMethod(setName, fieldClass);
						setMethod.invoke(o, value == null ? null : Double.parseDouble(String.valueOf(value)));//为其赋值 
					}else if(fieldClass == Float.class || fieldClass == float.class){
						setMethod = clazz.getMethod(setName, fieldClass);
						setMethod.invoke(o, value == null ? null : Float.parseFloat(String.valueOf(value)));//为其赋值 
					}else if(fieldClass == BigInteger.class ){
						setMethod = clazz.getMethod(setName, fieldClass);
						setMethod.invoke(o, value == null ? null : BigInteger.valueOf(Long.parseLong(String.valueOf(value))));//为其赋值 
					}else if(fieldClass == BigDecimal.class){
						setMethod = clazz.getMethod(setName, fieldClass);
						setMethod.invoke(o, value == null ? null : BigDecimal.valueOf(Double.parseDouble(String.valueOf(value))));//为其赋值 
					}else if(fieldClass == Date.class){
						setMethod = clazz.getMethod(setName, fieldClass);
						if(value != null){
							if(map.get(fieldName).getClass() == java.sql.Date.class){
								setMethod.invoke(o, new Date(((java.sql.Date)value).getTime()));//为其赋值 
							}else if(map.get(fieldName).getClass() == java.sql.Time.class){
								setMethod.invoke(o, new Date(((java.sql.Time)value).getTime()));//为其赋值 
							}else if(map.get(fieldName).getClass() == java.sql.Timestamp.class){
								setMethod.invoke(o, new Date(((java.sql.Timestamp)value).getTime()));//为其赋值 
							}
						}
					}
				}
			} catch (SecurityException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			}   catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}	
			
		}
		return o;
	}
	
	/**
	 * 判断某个类里是否有某个方法
	 * @param clazz
	 * @param methodName
	 * @return
	 */
	public static boolean isHaveSuchMethod(Class<?> clazz, String methodName){
		Method[] methodArray = clazz.getMethods();
		boolean result = false;
		if(null != methodArray){
			for(int i=0; i<methodArray.length; i++){
				if(methodArray[i].getName().equals(methodName)){
					result = true;
					break;
				}
			}
		}
		return result;
	}
	
	public static void beanCopy(Object source, Object target) {

		if (null == source || null == target) {
			if (log.isWarnEnabled()) {
				log.warn("对象复制警告，不允许对象为null！");
			}
			return;
		}


		Class<?> sourceClazz = source.getClass();
		Class<?> targetClazz = target.getClass();
		Field[] fields = targetClazz.getDeclaredFields(); // 取到所有类下的属性，也就是变量名
		Field field;

		for (int i = 0; i < fields.length; i++) {
			field = fields[i];
			String fieldName = field.getName();
			// 把属性的第一个字母处理成大写
			String stringLetter = fieldName.substring(0, 1).toUpperCase();
			// 取得setter方法名，比如setBbzt
			String setName = "set" + stringLetter + fieldName.substring(1);
			// 取得getter方法名
			String getName = "get" + stringLetter + fieldName.substring(1);
			// 真正取得get方法。
			Method setMethod = null;
			// 真正取得set方法
			Method sourceGetMethod = null;
			Method targetGetMethod = null;

			Class<?> fieldClass = field.getType();
			try {
				if (isHaveSuchMethod(sourceClazz, setName)) {
					setMethod = targetClazz.getMethod(setName, fieldClass);
					if (isHaveSuchMethod(sourceClazz, getName)) {
						sourceGetMethod = sourceClazz.getMethod(getName);
						targetGetMethod = targetClazz.getMethod(getName);
					}
					Object targetValue = targetGetMethod.invoke(target);
					if (null == targetValue) {
						setMethod.invoke(target, sourceGetMethod.invoke(source));// 为其赋值
					}
				}
			} catch (SecurityException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}

		}
		return ;
	}
}
