package com.dayuanit.ape.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharFilter implements Filter {
	
	private static String charEncoding;

	@Override
	public void destroy() {
		System.out.println("******** char Filter destroy ********");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		request.setCharacterEncoding(charEncoding);
		chain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		System.out.println("******** char Filter init ********");
		charEncoding = config.getInitParameter("charEncoding");
	}

}
