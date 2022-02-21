package com.mutatio.sis.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mutatio.sis.reply.vo.FReplySearchVO;
import com.mutatio.sis.reply.vo.FReplyVO;

@Mapper
public interface IFReplyDao {
	public int getReplyCountByParent(FReplySearchVO searchVO);

	public List<FReplyVO> getReplyListByParent(FReplySearchVO searchVO);

	public FReplyVO getReply(int reNo);

	public int updateReply(FReplyVO reply);

	public int deleteReply(FReplyVO reply);

	public int insertReply(FReplyVO reply);
}
