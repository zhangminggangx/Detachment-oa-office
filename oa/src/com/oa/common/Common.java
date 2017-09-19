package com.oa.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;


public class Common {
	/**
	 * 返回一个时间+随机码的字符串
	 * 
	 * @return
	 */
	public static String generateDateRandom() {
		String formatDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int random = new Random().nextInt(1000);
		return formatDate + random;
	}
	/**
	 * 返回一个时间+MD5加密的字符串
	 * 
	 * @return
	 */
	public static String generateDateRandomDes() {
		String formatDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
		return encryptionByDES(formatDate);
	}

	/***************************************************************************
	 * 
	 * <p>
	 * DES加密
	 * 
	 * @param expressly
	 * 
	 * 需要加密的字符
	 * 
	 * @return
	 * 
	 * 加密后的字符
	 * 
	 **************************************************************************/

	public static String encryptionByDES(String expressly) {
		try {
			JiaJieMi des = new JiaJieMi("sany21-sunxue");
			return des.encrypt(expressly);
		} catch (Exception e) {
			return "";
		}
	}

	/***************************************************************************
	 * 
	 * <p>
	* DES解密
	 * 
	 * @param ciphertext
	 * 
	 * 已加密的字符
	 * 
	 * @return
	 * 
	 * 解密后的字符
	 * 
	 **************************************************************************/

	public static String decryptionByDES(String ciphertext) {
		try {
			JiaJieMi des = new JiaJieMi("sany21-sunxue");
			return des.decrypt(ciphertext);
		} catch (Exception e) {
			return "error";
		}
	}
}
