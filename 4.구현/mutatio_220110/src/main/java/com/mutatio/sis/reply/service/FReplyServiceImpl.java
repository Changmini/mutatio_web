package com.mutatio.sis.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mutatio.sis.reply.dao.IFReplyDao;
import com.mutatio.sis.reply.vo.FReplySearchVO;
import com.mutatio.sis.reply.vo.FReplyVO;
import com.mutatio.sis.exception.BizAccessFailException;
import com.mutatio.sis.exception.BizNotFoundException;

@Service
public class FReplyServiceImpl implements IReplyService {

	@Inject
	IFReplyDao replyDao;
	
	@Override
	public List<FReplyVO> getReplyListByParent(FReplySearchVO searchVO) {
		int totalRowCount = replyDao.getReplyCountByParent(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		
		return replyDao.getReplyListByParent(searchVO);
	}

	@Override
	public void registReply(FReplyVO reply) {
		System.out.println("freeno :: "  + reply.getFreeNo());
		System.out.println("freeParentNo :: "  + reply.getFreeReParentNo());
		replyDao.insertReply(reply);
	}

	@Override
	public void modifyReply(FReplyVO reply) throws BizNotFoundException, BizAccessFailException {
		//로그인 체크 인터셉터는 로그인 여부만 살핌
		// 다른사람이 쓴 댓글을 내가 수정하려고 한다. 이런 일은 막아야됩니다.
		// DB에 있는 reMemId랑 지금 로그인 한 사람이 같은지 확인해주세요.
		
		replyDao.updateReply(reply);
		
	}

	@Override
	public void removeReply(FReplyVO reply) throws BizNotFoundException, BizAccessFailException {
		replyDao.deleteReply(reply);
		
	}

}
