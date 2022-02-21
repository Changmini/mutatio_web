package com.mutatio.sis.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mutatio.sis.exception.BizNotFoundException;
import com.mutatio.sis.exception.BizPasswordNotMatchedException;
import com.mutatio.sis.member.vo.MemberVO;

public interface ILoginService {
	
	/**
	 * login체크
	 * @methodName : Login
	 * @author     : pc12
	 * @date       : 2021.12.08
	 * @param member
	 * @return
	 */
	
	public abstract MemberVO loginCheck(MemberVO member)
			throws BizNotFoundException, BizPasswordNotMatchedException; 
	
	public abstract void logAndSessionOut(HttpServletRequest request, HttpServletResponse response);

}
