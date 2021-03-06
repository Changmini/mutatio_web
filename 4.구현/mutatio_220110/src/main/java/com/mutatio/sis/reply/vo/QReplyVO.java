package com.mutatio.sis.reply.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class QReplyVO {

	private int quesNo;                /*부모글번호 */
	private int quesReNo;             /*댓글번호*/
	private int quesReParentNo;       /*부모댓글 번호*/
	private String quesReMemId;       /*작성자ID*/
	private String quesReContent;     /*댓글 내용*/
	private String quesReRegDate;     /*댓글 등록일자*/
	private String quesReModDate;     /*댓글 수정일자*/
	private String quesReDelYn;     /*댓글 삭제여부*/
	
	// 대댓글 쿼리에 필요한 vo
	private int quesReLevel;
	

	private String quesReMemName;    /*reMemId를 가지고 DB에 연결해서 조회해서 얻으면 됨*/
	private String reContent; //???
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
	
	
	
	public int getQuesNo() {
		return quesNo;
	}
	public void setQuesNo(int quesNo) {
		this.quesNo = quesNo;
	}
	public int getQuesReNo() {
		return quesReNo;
	}
	public void setQuesReNo(int quesReNo) {
		this.quesReNo = quesReNo;
	}
	public int getQuesReParentNo() {
		return quesReParentNo;
	}
	public void setQuesReParentNo(int quesReParentNo) {
		this.quesReParentNo = quesReParentNo;
	}
	public String getQuesReMemId() {
		return quesReMemId;
	}
	public void setQuesReMemId(String quesReMemId) {
		this.quesReMemId = quesReMemId;
	}
	public String getQuesReContent() {
		return quesReContent;
	}
	public void setQuesReContent(String quesReContent) {
		this.quesReContent = quesReContent;
	}
	public String getQuesReRegDate() {
		return quesReRegDate;
	}
	public void setQuesReRegDate(String quesReRegDate) {
		this.quesReRegDate = quesReRegDate;
	}
	public String getQuesReModDate() {
		return quesReModDate;
	}
	public void setQuesReModDate(String quesReModDate) {
		this.quesReModDate = quesReModDate;
	}
	public String getQuesReDelYn() {
		return quesReDelYn;
	}
	public void setQuesReDelYn(String quesReDelYn) {
		this.quesReDelYn = quesReDelYn;
	}
	public int getQuesReLevel() {
		return quesReLevel;
	}
	public void setQuesReLevel(int quesReLevel) {
		this.quesReLevel = quesReLevel;
	}
	public String getQuesReMemName() {
		return quesReMemName;
	}
	public void setQuesReMemName(String quesReMemName) {
		this.quesReMemName = quesReMemName;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	
	
	
	

	

	
	
	
}
