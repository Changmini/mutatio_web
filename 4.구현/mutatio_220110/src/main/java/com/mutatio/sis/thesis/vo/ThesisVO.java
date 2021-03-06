package com.mutatio.sis.thesis.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ThesisVO {

	private int thesNo;           /*논문번호*/
	private String thesTitle;     /*논문제목*/
	private String thesHref;      /*논문링크*/
	private int thesImpFactor;    /*논문인용횟수*/
	private String thesPuDate;    /*논문발행일*/
	private String thesCategory;  /*논문게시글코드*/
	private String thesCost;      /*논문가격*/
	private int thesPage;         /*논문페이지수*/
	private String thesSummary;   
	
	// Columns where the THESIS TABLE does not exist.
	private String thesAuth;      /*논문저자*/
	private String categoryNm;	  /*카테고리 이름 */
	private int cnt;              /* 카운트 활용vo*/
	private String markDate;      /*북마크에 뽑아올거*/
	
	private Float qualityIndex;   /*논문품질수치*/
	private Integer simProb;      /*유사도 확률 ADD_INFO TABLE*/
	
	// 조회이력
	private String searchDate;

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE); 
	}
	
	public String getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}

	public String getCategoryNm() {
		return categoryNm;
	}

	public void setCategoryNm(String categoryNm) {
		this.categoryNm = categoryNm;
	}

	public String getMarkDate() {
		return markDate;
	}
	
	public void setMarkDate(String markDate) {
		this.markDate = markDate;
	}

	public int getThesNo() {
		return thesNo;
	}


	public void setThesNo(int thesNo) {
		this.thesNo = thesNo;
	}


	public String getThesTitle() {
		return thesTitle;
	}


	public void setThesTitle(String thesTitle) {
		this.thesTitle = thesTitle;
	}


	public String getThesHref() {
		return thesHref;
	}


	public void setThesHref(String thesHref) {
		this.thesHref = thesHref;
	}


	public int getThesImpFactor() {
		return thesImpFactor;
	}


	public void setThesImpFactor(int thesImpFactor) {
		this.thesImpFactor = thesImpFactor;
	}


	public String getThesPuDate() {
		return thesPuDate;
	}


	public void setThesPuDate(String thesPuDate) {
		this.thesPuDate = thesPuDate;
	}


	public String getThesCategory() {
		return thesCategory;
	}


	public void setThesCategory(String thesCategory) {
		this.thesCategory = thesCategory;
	}


	public String getThesCost() {
		return thesCost;
	}


	public void setThesCost(String thesCost) {
		this.thesCost = thesCost;
	}


	public int getThesPage() {
		return thesPage;
	}


	public void setThesPage(int thesPage) {
		this.thesPage = thesPage;
	}


	public String getThesSummary() {
		return thesSummary;
	}


	public void setThesSummary(String thesSummary) {
		this.thesSummary = thesSummary;
	}


	public String getThesAuth() {
		return thesAuth;
	}

	public void setThesAuth(String auth) {
		this.thesAuth = auth;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public Float getQualityIndex() {
		return qualityIndex;
	}

	public void setQualityIndex(Float qualityIndex) {
		this.qualityIndex = qualityIndex;
	}

	public Integer getSimProb() {
		return simProb;
	}

	public void setSimProb(Integer simProb) {
		this.simProb = simProb;
	}
	
	
	
} // class




