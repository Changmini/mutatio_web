package com.mutatio.sis.thesis.vo;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.mutatio.sis.common.vo.PagingVO;

public class ThesisSearchVO extends PagingVO{
	
	private String searchWord;
	private String searchType;
	private List<Integer> authsThesNo;
	private String[] searchDate;
	private String[] searchCCode;
	private Float searchQuality;
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
	
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public List<Integer> getAuthsThesNo() {
		return authsThesNo;
	}


	public void setAuthsThesNo(List<Integer> authsThesNo) {
		this.authsThesNo = authsThesNo;
	}


	public String[] getSearchDate() {
		return searchDate;
	}


	public void setSearchDate(String[] searchDate) {
		this.searchDate = searchDate;
	}


	public String[] getSearchCCode() {
		return searchCCode;
	}


	public void setSearchCCode(String[] searchCCode) {
		this.searchCCode = searchCCode;
	}


	public Float getSearchQuality() {
		return searchQuality;
	}


	public void setSearchQuality(Float searchQuality) {
		this.searchQuality = searchQuality;
	}
	
	

	
	
	
} // class
