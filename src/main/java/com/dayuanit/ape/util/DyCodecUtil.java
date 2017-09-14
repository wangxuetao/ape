package com.dayuanit.ape.util;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

import com.dayuanit.ape.exception.BusException;

/**
 * 对称加密工具类
 *
 */
public class DyCodecUtil {
	
	private static final String private_key = "1q2w3e4r";
	
	public static byte[] encode(byte[] data, byte key[]) {
		try {
			SecretKey secretKey = new SecretKeySpec(key, "DES");
			Cipher cipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			return cipher.doFinal(data);
		} catch(Exception e) {
			throw new BusException("DES加密异常");
		}
		
	}
	
	public static String encodeMsg(byte[] data, byte key[]) {
		try {
			SecretKey secretKey = new SecretKeySpec(key, "DES");
			Cipher cipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			byte[] en = cipher.doFinal(data);
			return Base64.encodeBase64String(en);
		} catch(Exception e) {
			throw new BusException("DES加密异常");
		}
		
	}
	
	public static byte[] decode(byte[] data, byte key[]) throws Exception {
		
		SecretKey secretKey = new SecretKeySpec(key, "DES");
		Cipher cipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
		
		cipher.init(Cipher.DECRYPT_MODE, secretKey);
		
		byte[] dataBase = Base64.decodeBase64(data);
		
		return cipher.doFinal(dataBase);
	}
	
	public static boolean check(String msg, String key, String sign) throws Exception {
		byte[] deMsg = decode(msg.getBytes(), key.getBytes());
		
		return sign.equals(new String(deMsg));
	}
	
	public static String decodeMsg(byte[] data, byte key[]) throws Exception {
		
		SecretKey secretKey = new SecretKeySpec(key, "DES");
		Cipher cipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
		
		cipher.init(Cipher.DECRYPT_MODE, secretKey);
		
		byte[] dataBase = Base64.decodeBase64(data);
		
		return new String(cipher.doFinal(dataBase));
	}
	
	public static void main(String args[]) throws Exception {
		String msg = "说我是是";
		
//		byte[] encodeMsg = DyCodecUtil.encode(msg.getBytes(), private_key.getBytes());
//		String miwen = Base64.encodeBase64String(encodeMsg);
//		System.out.println("加密后：" + miwen);
//		
//		String decodeMsg = DyCodecUtil.decodeMsg(miwen.getBytes(), private_key.getBytes());
//		System.out.println("解密后：" + decodeMsg);
		
		String miwen = DyCodecUtil.encodeMsg(msg.getBytes(), private_key.getBytes());
		System.out.println("加密后：" + miwen);
		
		String decodeMsg = DyCodecUtil.decodeMsg(miwen.getBytes(), private_key.getBytes());
		System.out.println("解密后：" + decodeMsg);
	}

}
