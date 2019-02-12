package com.kh.spring.common.aop;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.kh.spring.memo.model.exception.MemoException;
import com.kh.spring.memo.model.vo.Memo;

@Component
@Aspect
public class PasswordCheckAspect {
	Logger logger = Logger.getLogger(getClass());
	
	@Before("execution(* com.kh.spring.memo..*Controller.insert*(..))")
	public void beforeAdviceInsert(JoinPoint joinPoint) {
		// 타겟메소드(joinPoint) 실행전 코드
		Object[] obj = joinPoint.getArgs();	// 오브젝트 배열을 반환한다.
		String password = String.valueOf(((Memo) obj[0]).getPassword());
		logger.debug("입력한 비밀번호 : ["+password+"]");
		if(password.trim().length() == 0) {
			throw new MemoException("패스워드가 유효하지 않습니다.");
		}
	}
	
	@Before("execution(* com.kh.spring.memo..*Controller.delete*(..))")
	public void beforeAdviceDelete(JoinPoint joinPoint) {
		// 타겟메소드(joinPoint) 실행전 코드
		Object[] obj = joinPoint.getArgs();	// 오브젝트 배열을 반환한다.
		String password = String.valueOf((obj[1]));
		logger.debug("입력한 비밀번호 : ["+password+"]");
		if(password.trim().length() == 0) {
			throw new MemoException("패스워드가 유효하지 않습니다.");
		}
	}
}
