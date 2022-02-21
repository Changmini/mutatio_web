package com.mutatio.sis.common.vo;

import java.io.Serializable;

public class PagingVO implements Serializable{

	private int curPage=1; 
	private int rowSize=10; 
	private int pageSize=10; 
	private int totalRowCount; // total data(row) 
	
	private int totalPageCount; // The total number of pages you can flip
	private int startRowNum; // first data(row)
	private int endRowNum; // last data(row)
	private int startPageNum; // start page
	private int endPageNum;
	
	
	// init paging
	public void pageSetting() {
		// row
		startRowNum = (curPage-1)*rowSize + 1;
		endRowNum = curPage * rowSize;
		if(endRowNum > totalRowCount) endRowNum=totalRowCount;
		
		// page
		totalPageCount = (totalRowCount-1)/rowSize+1;
		startPageNum = ((curPage-1)/pageSize)*pageSize + 1;
		endPageNum = startPageNum+pageSize - 1; 
		if(endPageNum > totalPageCount) endPageNum=totalPageCount;
	}

	
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getRowSize() {
		return rowSize;
	}

	public void setRowSize(int rowSize) {
		this.rowSize = rowSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRowCount() {
		return totalRowCount;
	}

	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}

	
	
	
	
	
} // class
