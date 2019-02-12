package com.kh.spring.memo.model.exception;
// custom예외 클래스를 만들때는 RuntimeException을 상속받는 것이 좋다.
public class MemoException extends RuntimeException {

	public MemoException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemoException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public MemoException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public MemoException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	
	
}
