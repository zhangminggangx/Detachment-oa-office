package com.oa.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;


public class Common {
	/**
	 * ����һ��ʱ��+�������ַ���
	 * 
	 * @return
	 */
	public static String generateDateRandom() {
		String formatDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int random = new Random().nextInt(1000);
		return formatDate + random;
	}
	/**
	 * ����һ��ʱ��+MD5���ܵ��ַ���
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
	 * DES����
	 * 
	 * @param expressly
	 * 
	 * ��Ҫ���ܵ��ַ�
	 * 
	 * @return
	 * 
	 * ���ܺ���ַ�
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
	* DES����
	 * 
	 * @param ciphertext
	 * 
	 * �Ѽ��ܵ��ַ�
	 * 
	 * @return
	 * 
	 * ���ܺ���ַ�
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
