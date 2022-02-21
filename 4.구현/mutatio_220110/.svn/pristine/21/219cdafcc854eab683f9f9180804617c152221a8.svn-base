package com.mutatio.sis.reply.service;

import java.util.List;

import com.mutatio.sis.exception.BizNotFoundException;
import com.mutatio.sis.reply.vo.FReplySearchVO;
import com.mutatio.sis.reply.vo.FReplyVO;
import com.mutatio.sis.exception.BizAccessFailException;

public interface IReplyService {
/** 댓글 목록 조회 <br>
* <b>필수 : reCategory, reParentNo </b>
*/
public List<FReplyVO> getReplyListByParent(FReplySearchVO searchVO);
/** 댓글등록 */
public void registReply(FReplyVO reply) ;
/** 댓글 수정 <br>
* 댓글이 존재하지 않으면 BizNotFoundException
* 댓글 작성자와 로그인 사용자가 다른 경우 BizAccessFailException
*/
public void modifyReply(FReplyVO reply) throws BizNotFoundException, BizAccessFailException;
/**
* 댓글 삭제 <br>
* 해당글의 존재하지 않으면 BizNotFoundException
* 댓글 작성자와 로그인 사용자가 다른 경우 BizAccessFailException
*/
public void removeReply(FReplyVO reply) throws BizNotFoundException, BizAccessFailException;
}