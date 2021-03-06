package com.mutatio.sis.login.service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Service;

import com.mutatio.sis.exception.BizNotEffectedException;
import com.mutatio.sis.exception.BizNotFoundException;
import com.mutatio.sis.exception.BizPasswordNotMatchedException;
import com.mutatio.sis.exception.DaoDuplicateKeyException;
import com.mutatio.sis.member.dao.IMemberDao;
import com.mutatio.sis.member.vo.MemberVO;

@Service
public class LoginServiceImpl implements ILoginService{

	@Inject
	private IMemberDao memberDao;
	
	@Override
	public MemberVO loginCheck(MemberVO member) throws BizNotFoundException, BizPasswordNotMatchedException {
		MemberVO vo = memberDao.getMember(member.getMemId());
		if(vo == null) throw new BizNotFoundException(); // Not Found member
		if(!vo.getMemPass().equals(member.getMemPass())) throw new BizPasswordNotMatchedException();
		return vo;
	}
	
	@Override
	public void logAndSessionOut(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
	} // logout
	
	

} // class













