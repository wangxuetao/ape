package com.dayuanit.ape.util;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

public class HtmlUtil {
	
	private static final Whitelist whitelist = new Whitelist();
	static {
		whitelist.addTags("br");//信任的HTML标签
	}
	
	public static String showHtml(String msg) {
		if (StringUtils.isBlank(msg)) {
			return "";
		}
		
		return msg.replaceAll(" ","&nbsp;")
				.replaceAll("\r\n","<br>")
				.replaceAll("\r","<br>")
				.replaceAll("\n","<br>");
	}
	
	public static String unShowHtml(String msg) {
		if (StringUtils.isBlank(msg)) {
			return "";
		}
		
		return msg.replaceAll("&nbsp;"," ")
				.replaceAll("<br>","");
	}
	
	public static String unSafeHtml(String msg) {
		if (StringUtils.isBlank(msg)) {
			return "";
		}
		
		return Jsoup.clean(msg, whitelist);
	}
	
	public static String unShowHtml(String msg, int subLeng) {
		if (StringUtils.isBlank(msg)) {
			return "";
		}
		
		String tmp = msg.replaceAll("&nbsp;"," ")
		.replaceAll("<br>"," ");
		
		if (subLeng < tmp.length()) {
			tmp = tmp.substring(0, subLeng);
		}
		
		return tmp + "......";
	}
	
	public static String unSafeToHtml(String msg) {
		if (StringUtils.isBlank(msg)) {
			return "";
		}
		
		String tmp = showHtml(msg);
		return unSafeHtml(tmp);
	}

}
