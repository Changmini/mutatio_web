package com.mutatio.sis.code.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@SuppressWarnings("serial")
public class CodeVO implements Serializable {
	
	private String commCd;        /*코드*/
	private String commNm;        /*코드명*/
	private String commParent;    /*부모 코드*/
	private int commOrd;          /*순번*/
	
	@Override
	public String toString() {	
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}

	public String getCommCd() {
		return commCd;
	}

	public void setCommCd(String commCd) {
		this.commCd = commCd;
	}

	public String getCommNm() {
		return commNm;
	}

	public void setCommNm(String commNm) {
		this.commNm = commNm;
	}

	public String getCommParent() {
		return commParent;
	}

	public void setCommParent(String commParent) {
		this.commParent = commParent;
	}

	public int getCommOrd() {
		return commOrd;
	}

	public void setCommOrd(int commOrd) {
		this.commOrd = commOrd;
	}
	
	
	

}
