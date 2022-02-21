package com.mutatio.sis.reply.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.mutatio.sis.common.vo.PagingVO;

public class FReplySearchVO extends PagingVO {

	private int freeReNo;
	private int freeNo;
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}

	public int getFreeReNo() {
		return freeReNo;
	}

	public void setFreeReNo(int freeReNo) {
		this.freeReNo = freeReNo;
	}

	public int getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}

	
	
	
	
} // class
