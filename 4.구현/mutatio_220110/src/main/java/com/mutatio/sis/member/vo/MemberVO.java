package com.mutatio.sis.member.vo;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MemberVO {
	
	private String memId;         /*회원아이디*/
	private String memPass;       /*회원비밀번호*/
	private String memName;       /*회원이름*/
	private String memMail;       /*회원이메일*/
	private String memBir;        /*회원생년월일*/
	private String memDelYn;      /*회원삭제여부*/
	private int memMileage;       /*회원마일리지*/
	private String memJob;        /*회원직업*/
	private String memJobNm;        /*회원직업*/
	private String memRegDate;    /*회원등록일*/
	
	private String[] conCode;     /*회원관심분야*/
	private String[] conCodeName; /*회원관심분야*/
	
	private int[] thesNo;  /*관심논문 번호*/
	
	// 로그인	
	private List<String> roleList;   
	
	
	
	@Override
	public String toString() {	
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
	
	
	public List<String> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<String> roleList) {
		this.roleList = roleList;
	}
	public boolean checkRoleList(String role) {
		return this.roleList.contains(role);
	}
	
	
	public int[] getThesNo() {
		return thesNo;
	}

	public void setThesNo(int[] thesNo) {
		this.thesNo = thesNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPass() {
		return memPass;
	}

	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemMail() {
		return memMail;
	}

	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}

	public String getMemBir() {
		return memBir;
	}

	public void setMemBir(String memBir) {
		this.memBir = memBir;
	}

	public String getMemDelYn() {
		return memDelYn;
	}

	public void setMemDelYn(String memDelYn) {
		this.memDelYn = memDelYn;
	}

	public int getMemMileage() {
		return memMileage;
	}

	public void setMemMileage(int memMileage) {
		this.memMileage = memMileage;
	}

	public String getMemJob() {
		return memJob;
	}

	public void setMemJob(String memJob) {
		this.memJob = memJob;
	}

	public String getMemJobNm() {
		return memJobNm;
	}

	public void setMemJobNm(String memJobNm) {
		this.memJobNm = memJobNm;
	}

	public String getMemRegDate() {
		return memRegDate;
	}

	public void setMemRegDate(String memRegDate) {
		this.memRegDate = memRegDate;
	}
	
	public String[] getConCode() {
		return conCode;
	}

	public void setConCode(String[] conCode) {
		this.conCode = conCode;
	}
	
	public String[] getConCodeName() {
		return conCodeName;
	}

	public void setConCodeName(String[] conCodeName) {
		this.conCodeName = conCodeName;
	}

	
	
	
	
} // class






