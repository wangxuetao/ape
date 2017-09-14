package com.dayuanit.ape.util;

import org.apache.commons.lang.StringEscapeUtils;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

public class Test {
	
	public static void main(String[] args) {
		String msg = "<javascript><table><tr><td>1</td></tr><p></p><br></table>" +	"<img src='' alt='' />";
		String msg2 = "jkd jdkfj \n djflk";
		Whitelist wl = new Whitelist();
		wl.addTags("br","p");
		String ff = Jsoup.clean(msg, wl);
		//System.out.println(ff);
		
		String m = HtmlUtil.showHtml(msg2);
//		System.out.println(m);
//		
		String mm = HtmlUtil.unShowHtml(m);
//		System.out.println(mm);
		
		String ss = HtmlUtil.unSafeHtml("很好<script type=\"text/javascript\">alert(\"hello\")</script >大幅度");
		System.out.println(ss);
	}

}
