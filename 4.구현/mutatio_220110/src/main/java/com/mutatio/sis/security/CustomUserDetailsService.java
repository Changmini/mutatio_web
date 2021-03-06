package com.mutatio.sis.security;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.mutatio.sis.member.dao.IMemberDao;
import com.mutatio.sis.member.vo.MemberVO;


@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	private org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@Inject
	private IMemberDao memberDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.debug("loadUserByUsername username={}", username);
		MemberVO member = memberDao.getMemberYn(username);
		if (member == null) throw new UsernameNotFoundException("UserNotFound");
		member.setRoleList(memberDao.getUserRoleListByUserId(username));
		CustomUser USER = new CustomUser(member); // create CustomUser
		
		ServletRequestAttributes servletRequest = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		servletRequest.getRequest().getSession().setAttribute("USER_INFO", USER);
		return USER;
	}
} // class










