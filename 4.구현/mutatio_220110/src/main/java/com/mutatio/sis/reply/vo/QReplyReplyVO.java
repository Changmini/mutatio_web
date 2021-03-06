package com.mutatio.sis.reply.vo;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.mutatio.sis.common.vo.PagingVO;

public class QReplyReplyVO extends PagingVO {

	private int quesNo;
	private List<Integer> quesReNo;
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}

	public int getQuesNo() {
		return quesNo;
	}

	public void setQuesNo(int quesNo) {
		this.quesNo = quesNo;
	}

	public List<Integer> getQuesReNo() {
		return quesReNo;
	}

	public void setQuesReNo(List<Integer> quesReNo) {
		this.quesReNo = quesReNo;
	}

	

} // class






