package com.spring.main.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	//시간 순서대로 나열되어있음
	
	//로거가 먹히지 않음. ( 쓰고 싶으면 @서비스 달아줘야함)
	
	// 컨트롤러 접근 전 # 이 2개 제일 마니 씀
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginId") == null) {
			System.out.println("로그인 처리가 안 되어 있음");
			request.setAttribute("msg", "로그인 해주세요");
			RequestDispatcher dis = request.getRequestDispatcher("/login-form");
			dis.forward(request, response);
			
			return false;
		}
		
		return true;
	}

	// 컨트롤러 접근 후 # 이 2개 제일 마니 씀
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {

//		System.out.println("컨트롤러 요청 후 View 전송 전");
	}

	//뷰에 보내지기 직전
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
//		System.out.println("컨트롤러 요청 처리 완료 후");
		
	}

	
	
}
