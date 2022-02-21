package com.mutatio.sis.exception;

public class BizUserNotMatchedException extends BizException {

	public BizUserNotMatchedException() {
	}

	public BizUserNotMatchedException(String message) {
		super(message);
	}

	public BizUserNotMatchedException(Throwable cause) {
		super(cause);
	}

	public BizUserNotMatchedException(String message, Throwable cause) {
		super(message, cause);
	}

	public BizUserNotMatchedException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

}
