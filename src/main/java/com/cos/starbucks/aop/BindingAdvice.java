package com.cos.starbucks.aop;

import java.util.HashMap;
import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

@Component
@Aspect // 프록시 생성 어드바이스 실행
public class BindingAdvice {
	
	
	private static final Logger log = LoggerFactory.getLogger(BindingAdvice.class);


	// * return type
	// *Controller 타겟
	// *(..)모든 메소드의 모든 인자허용
	// @Before(직전), @After(직후) @Around(직전,직후,예외상황)
	@Around("execution(* com.cos.starbucks.controller..*Controller.*(..))") // 모든 컨트롤러와 모든메서드 실행 직전과 직후 실행
	public Object bindingPrint(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
		
		//proceedingJoinPoint = 요청한 모든정보
		
		String type = proceedingJoinPoint.getSignature().getDeclaringTypeName();//요청 클래스 
		String method=proceedingJoinPoint.getSignature().getName();//요청 메소드
		System.out.println(type+" "+ method+"()");

		Object[] args = proceedingJoinPoint.getArgs(); //요청 파라메터
		for (Object arg : args) {
			if (arg instanceof BindingResult) {
				BindingResult bindingResult = (BindingResult) arg;
				if (bindingResult.hasErrors()) {
					Map<String, String> errorMap = new HashMap<>();

					for (FieldError error : bindingResult.getFieldErrors()) {
						log.warn(type+"."+method+"() => 필드 :"+error.getField()+"메시지:" +error.getDefaultMessage());
						errorMap.put(error.getField(), error.getDefaultMessage());
					}

					return new ResponseEntity<Map<String, String>>(errorMap, HttpStatus.BAD_REQUEST);

				}
					
			}
		}
		return proceedingJoinPoint.proceed();
	}
}