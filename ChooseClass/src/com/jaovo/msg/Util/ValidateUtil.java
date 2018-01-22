package com.jaovo.msg.Util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class ValidateUtil {
	public static  boolean validateNull(HttpServletRequest request,String[] fileds) {
		boolean validate = true;
		//map对象用来装载不同的错误信息
		Map<String,String> errorMsg = new  HashMap();
		for(int i=0;i<3;i++) {
			String value = request.getParameter(fileds[i]);
			
			
			
			if(i==1) {
				
				if(value.equals("王建民")||value.equals("刘立嘉")||value.equals("刘丹")||value.equals("王辉")||value.equals("杨子光"))
				{
					validate=true;
				}
				else
				{
					validate = false;
					errorMsg.put(fileds[i], "教师不正确");
				}
			}
			
			if(i==2) {
				 
			     boolean a[]=new boolean[4];
			     String[] sub={"一教","二教","三教","基教"};
			     for(int j=0;j<4;j++) {
				     a[i]=value.startsWith(sub[j]);
			     }
			     boolean is=false;
			     for(int k=0;k<4;k++) {
			    	 if(a[i]==true)
			    		 is=true;
			     }
				
				if(is==true)
				{
					validate=true;
				}
				else
				{
					validate = false;
					errorMsg.put(fileds[i], "教室不正确");
				}
			
			if (!validate) {
				request.setAttribute("errormsg", errorMsg);
			}
			}
		}
		
		
		return validate;
	}
	public static String showError(HttpServletRequest request , String filed) {
		Map<String, String> errorMsg = (Map<String,String>)request.getAttribute("errormsg");
		if (errorMsg == null) {
			return "";
		}
		String msg = errorMsg.get(filed);
		if (msg == null) {
			return "";
		}
		return msg;
	}
	
}
