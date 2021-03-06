package com.mutatio.sis.recommend.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mutatio.sis.free.vo.FreeVO;
import com.mutatio.sis.question.vo.QuesVO;
import com.mutatio.sis.recommend.vo.RecommendVO;
import com.mutatio.sis.reply.vo.FReplyVO;
import com.mutatio.sis.thesis.vo.ThesisVO;

@Mapper
public interface IRecommendDao {
	
	public List<RecommendVO> getRecomWordList(String memId);
	public List<RecommendVO> getKeywordThesisList(String thesNo);
	public List<RecommendVO> getCountThesisCode(String commCd);
	
	// 조회이력검색
	public List<ThesisVO> getMemReferNoDateList(String memId);
	
	// 내가 쓴 자유게시판 글목록
	public List<FreeVO> getFreeMemberBoardList(String memId);
	public int getMemFreeRowCount(String memId);
	
	// 내가 쓴 문의게시판 글목록
	public List<QuesVO> getQuesMemberBoardList(Map<String, String> map);
	// 문의게시판 전체 글 갯수
	public int getMemQuesRowCount(String memId);
	
	// 내가 쓴 자유게시판 댓글목록
	public List<FReplyVO> getFreeReplyList(String memId);
	
}
