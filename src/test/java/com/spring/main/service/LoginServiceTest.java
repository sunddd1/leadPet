package com.spring.main.service;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.junit.MockitoJUnitRunner;

import com.spring.main.dao.LoginDAO;

@RunWith(MockitoJUnitRunner.class)
public class LoginServiceTest {
	
	@Inject
	private LoginDAO loginDAO;
	
	@InjectMocks
	private LoginService loginService;
	
	@Test
	public void 입력된_ID가_NULL이면_로그인_불가 () {
		// given
		String id = null;
		String password = "pass";
		
		// when
		LoginService.Type result = loginService.login(id, password);
		 
		// then
		assertThat(result, is(LoginService.Type.NONE));
	}
	
	@Test
	public void 입력된_ID가_공백이면_로그인_불가() {
		// given
		String id = "  ";
		String password = "pass";
		
		// when
		LoginService.Type result = loginService.login(id, password);
		
		// then
		assertThat(result, is(LoginService.Type.NONE));
	}
	
	@Test
	public void 입력된_PASSWORD가_NULL이면_로그인_불가() {
		// given
		String id = "user";
		String password = null;
		
		// when
		LoginService.Type result = loginService.login(id, password);
		
		// then
		assertThat(result, is(LoginService.Type.NONE));
	}

	@Test
	public void 입력된_PASSWORD가_공백이면_로그인_불가() {
		// given
		String id = "user";
		String password = "   ";
		
		// when
		LoginService.Type result = loginService.login(id, password);
		
		// then
		assertThat(result, is(LoginService.Type.NONE));
	}
}
