package com.mutatio.sis.recommend.vo;

public class RecommendVO {
	
	public int thesNo;
	public String thesKeyword;
	public int memKeyCnt; // 검색 횟수
	public String memId;
	
	
	public String memKeyword;
	public String commNm;
	public String thesTitle;
	public int thesImpFactor;
	
	// 조회이력
	public String searchDate;

	public int cnt;
	
	
	
	
	public String getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getThesNo() {
		return thesNo;
	}

	public void setThesNo(int thesNo) {
		this.thesNo = thesNo;
	}

	public String getThesKeyword() {
		return thesKeyword;
	}

	public void setThesKeyword(String thesKeyword) {
		this.thesKeyword = thesKeyword;
	}

	
	
	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getThesImpFactor() {
		return thesImpFactor;
	}

	public void setThesImpFactor(int thesImpFactor) {
		this.thesImpFactor = thesImpFactor;
	}

	public String getMemKeyword() {
		return memKeyword;
	}

	public void setMem_keyword(String memKeyword) {
		this.memKeyword = memKeyword;
	}
	
	public int getMemKeyCnt() {
		return memKeyCnt;
	}

	public void setMemKeyCnt(int memKeyCnt) {
		this.memKeyCnt = memKeyCnt;
	}

	public String getCommNm() {
		return commNm;
	}

	public void setCommNm(String commNm) {
		this.commNm = commNm;
	}

	public String getThesTitle() {
		return thesTitle;
	}

	public void setThesTitle(String thesTitle) {
		this.thesTitle = thesTitle;
	}

	public int thesImpFactor() {
		return thesImpFactor;
	}

	public void setImp_factor(int thesImpFactor) {
		this.thesImpFactor = thesImpFactor;
	}

	public void setMemKeyword(String memKeyword) {
		this.memKeyword = memKeyword;
	}

	
	
	
}
