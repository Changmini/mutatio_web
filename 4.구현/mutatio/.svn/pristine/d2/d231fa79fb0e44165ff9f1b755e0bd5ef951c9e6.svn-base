package com.mutatio.sis.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mutatio.sis.exception.BizAccessFailException;
import com.mutatio.sis.exception.BizNotFoundException;
import com.mutatio.sis.member.vo.MemberVO;
import com.mutatio.sis.reply.dao.IQReplyDao;
import com.mutatio.sis.reply.vo.QReplyReplyVO;
import com.mutatio.sis.reply.vo.QReplyVO;
import com.mutatio.sis.security.CustomUser;

@Service
public class QReplyServiceImpl {

	@Inject
	IQReplyDao replyDao;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
	
	/**
	 * <pre>
	 * 	setting QReplyReplyVO ( paging and etc(question info) )
	 * </pre>
	 * @param QReplyReplyVO
	 * @return QReplyReplyVO
	 */
	public QReplyReplyVO settingQReplyVO(QReplyReplyVO quesNo_pagingVO) {
		int totalRowCount = replyDao.getReplyCountByParent(quesNo_pagingVO);
		quesNo_pagingVO.setTotalRowCount(totalRowCount);
		quesNo_pagingVO.pageSetting();
		return quesNo_pagingVO;
	}
	
	public boolean isMore(QReplyReplyVO quesNo_pagingVO) {
		QReplyReplyVO vo = settingQReplyVO(quesNo_pagingVO);
		// 출력 댓글 수와 전체 댓글 수가 같다면...
		return vo.getEndRowNum() == vo.getTotalRowCount() ? true : false;
	}
	
	public List<QReplyVO> getReplyListByParent(QReplyReplyVO quesNo_pagingVO) {
		List<QReplyVO>replyList = replyDao.getReplyListByParent(
				settingQReplyVO(quesNo_pagingVO) // setting paging					
		);
		logger.info("getReplyListBy::{}",replyList);
		return replyList; 
	}

	public void registReply(QReplyVO reply, CustomUser member) throws BizNotFoundException {
		logger.info("regisReply:: {}",reply);
		if (member == null) throw new BizNotFoundException(); // check login
		reply.setQuesReMemId(member.getUsername()); // set memId
		
		if (reply.getQuesReLevel() >= 3) reply.setQuesReLevel(3); // max val = level 3
		replyDao.insertReply(reply);
	}

	public void modifyReply(QReplyVO reply) throws BizNotFoundException, BizAccessFailException {
		//로그인 체크 인터셉터는 로그인 여부만 살핌
		// 다른사람이 쓴 댓글을 내가 수정하려고 한다. 이런 일은 막아야됩니다.
		// DB에 있는 reMemId랑 지금 로그인 한 사람이 같은지 확인해주세요.
		replyDao.updateReply(reply);
	}

	public void removeReply(QReplyVO reply) throws BizNotFoundException, BizAccessFailException {
		replyDao.deleteReply(reply);
	}

} // class
