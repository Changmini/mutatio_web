package com.mutatio.sis.login.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class UserVO {
	private String userId;
	private String userPass;
	private String userName;
	private String userRole;
	
	public UserVO() {}
	
	@Override
	public String toString() {
		  return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE); 
		}

	
	public UserVO(String userId, String userPass, String userName, String userRole) {
		this.userId = userId;
		this.userPass = userPass;
		this.userName = userName;
		this.userRole = userRole;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPass() {
		return userPass;
	}


	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserRole() {
		return userRole;
	}


	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	
	
}

