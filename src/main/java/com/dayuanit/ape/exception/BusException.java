package com.dayuanit.ape.exception;

/**
 * 业务异常
 */
public class BusException extends RuntimeException {
	
	private static final long serialVersionUID = 2587231062058794749L;
	private int errorCode;
	
	public int getErrorCode() {
		return errorCode;
	}

	public BusException(String msg) {
		super(msg);
	}
	
	public BusException(String msg, int errorCode) {
		super(msg);
		this.errorCode = errorCode;
	}

}
