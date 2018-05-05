package com.lzl.util;

import java.util.UUID;

/**
 * �ַ���������
 * @author Administrator
 *
 */
public class StringUtil {

	/**
	 * ��ȡһ��UUID
	 * @return
	 */
	public static String getUUID() {
		UUID uuid = UUID.randomUUID();
		return uuid.toString().replaceAll("-", "");
	}
	
	public static String toNull(String obj) {
		if(obj == null)
			return null;
		if(obj != null) {
			if(obj.trim().equals(""))
				return null;
			return obj;
		}
		return null;
	}
}
