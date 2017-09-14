package com.dayuanit.ape.util;

import java.util.HashSet;
import java.util.Random;
import java.util.Set;
public class InviteCodeUtil {
	   public static char[] getChar(){
	        char[] passwordLit = new char[62];
	        char fword = 'a';
	        char mword = 'a';
	        char bword = '0';
	        for (int i = 0; i < 62; i++) {
	            if (i < 26) {
	                passwordLit[i] = fword;
	                fword++;
	            }else if(i<52){
	                passwordLit[i] = mword;
	                mword++;
	            }else{
	                passwordLit[i] = bword;
	                bword++;
	            }
	            //System.out.println(passwordLit[i]);
	        }
	     return passwordLit;
	    }
	     
	    public static String getCode() {
	 
	        char[] r = getChar();
	        Random rr = new Random();
	        char[] pw= new char[6];
	        for(int i=0;i<pw.length;i++){
	            int num = rr.nextInt(62);
	            pw[i]=r[num];
	            //System.out.print(pw[i]+"");
	        }
			return String.valueOf(pw); 
	    }
	    
	    public static void main(String[] args) {
	    	int row =0;
	    	Set<String> codeSet = new HashSet<String>();
			

			do {
				codeSet.add(InviteCodeUtil.getCode());
			}while(codeSet.size()<1); 
			System.out.println(codeSet.size());
			for (String str : codeSet) {
				row++;
			      System.out.println(str);
			}
			System.out.println(row);
		}
}
