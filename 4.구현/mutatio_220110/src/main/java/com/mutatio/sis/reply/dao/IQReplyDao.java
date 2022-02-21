package com.mutatio.sis.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mutatio.sis.reply.vo.QReplyReplyVO;
import com.mutatio.sis.reply.vo.QReplyVO;

@Mapper
public interface IQReplyDao {
	public int getReplyCountByParent(QReplyReplyVO searchVO);

	public List<QReplyVO> getReplyListByParent(QReplyReplyVO searchVO);

	public QReplyVO getReply(int reNo);

	public int updateReply(QReplyVO reply);

	public int deleteReply(QReplyVO reply);

	public int insertReply(QReplyVO reply);

	public List<Integer> getReplyQuesNo(QReplyReplyVO searchVO);
}
