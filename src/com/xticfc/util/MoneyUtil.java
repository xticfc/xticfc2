package com.xticfc.util;

public class MoneyUtil {


	// 将数字转化为汉字的数组,因为各个实例都要使用所以设为静态
	private static final char[] cnNumbers = { '零', '壹', '贰', '叁', '肆', '伍',
			'陆', '柒', '捌', '玖' };

	// 供分级转化的数组,因为各个实例都要使用所以设为静态
	private static final char[] series = { '元', '拾', '百', '仟', '万', '拾', '百',
			'仟', '亿', '拾', '百', '仟', '万'};
	
	private static final char[] little = {'分','角'};


	/**
	 * 取得大写形式的字符串
	 * @param original	原始的钱字符串
	 * @return
	 */
	public static String getCnString(String original) {
		if(null == original || original.trim().length() == 0){
			return null;
		}
		// 整数部分
		String integerPart = "";
		// 小数部分
		String floatPart = "";
		

		if (original.contains(".")) {
			// 如果包含小数点
			int index = original.indexOf(".");
			integerPart = original.substring(0, index);
			floatPart = original.substring(index + 1);
		} else {
			// 不包含小数点
			integerPart = original;
		}

		StringBuffer sb = new StringBuffer();

		// 整数部分处理
		for (int i = 0; i < integerPart.length(); i++) {
			int number = getNumber(integerPart.charAt(i));

			sb.append(cnNumbers[number]);
			sb.append(series[integerPart.length() - 1 - i]);
		}

		// 小数部分处理
		if (floatPart.length() > 0) {
			if(floatPart.length() > 2){
				floatPart = floatPart.substring(0, 2);
			}
			for (int i = 0; i < floatPart.length(); i++) {
				int number = getNumber(floatPart.charAt(i));

				sb.append(cnNumbers[number]);
				sb.append(little[floatPart.length() - 1 -i]);
			}
		}else{
			sb.append("整");
		}

		// 返回拼接好的字符串
		return sb.toString();
	}

	/**
	 * 将字符形式的数字转化为整形数字 因为所有实例都要用到所以用静态修饰
	 * 
	 * @param c
	 * @return
	 */
	private static int getNumber(char c) {
		String str = String.valueOf(c);
		return Integer.parseInt(str);
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println(MoneyUtil.getCnString("5432123456789.12345"));
		System.out.println(MoneyUtil.getCnString("123456789"));
		System.out.println(MoneyUtil.getCnString(".123456789"));
		System.out.println(MoneyUtil.getCnString("0.1234"));
		System.out.println(MoneyUtil.getCnString("1"));
		System.out.println(MoneyUtil.getCnString("12"));
		System.out.println(MoneyUtil.getCnString("123"));
		System.out.println(MoneyUtil.getCnString("1234"));
		System.out.println(MoneyUtil.getCnString("12345"));
		System.out.println(MoneyUtil.getCnString("123456"));
		System.out.println(MoneyUtil.getCnString("1234567"));
		System.out.println(MoneyUtil.getCnString("12345678"));
		System.out.println(MoneyUtil.getCnString("123456789"));
	}
}
