package com.kh.spring.log4j;

import org.apache.log4j.Logger;

public class Log4jTest {

	private Logger logger = Logger.getLogger(Log4jTest.class);
	
	public static void main(String[] args) {
		new Log4jTest().test();
	}
	
	public void test() {
		logger.fatal("Fatal로그!");
		// 아주 심각한 에러
		
		logger.error("Error로그!");
		// 요청처리중 에러가 발생한 경우
		
		logger.warn("Warn로그!");
		// 프로그램실행에는 당장 문제가 없지만, 문제소지가 있음.
		
		logger.info("Info로그!");
		// 상태변경과 같은 정보성 메시지
		
		logger.debug("Debug로그!");
		// 개발모드
		
		logger.trace("Trace로그!");
		// 디버그레벨을 좀더 세분화해서 관리하기 위한 레벨
		
	}

}
