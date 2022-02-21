package com.mutatio.sis.security;

import java.util.stream.Collectors;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.mutatio.sis.member.vo.MemberVO;


@SuppressWarnings("serial")
public class CustomUser extends User {
	private MemberVO member;

	public MemberVO getMember() {
		return member;
	}
	
	public CustomUser(MemberVO member) {
		super(	  member.getMemId()
				, member.getMemPass()
				, member.getRoleList().stream()
						 .map(role -> new SimpleGrantedAuthority(role))
						 .collect(Collectors.toList()));
		this.member = member;
	}
}
