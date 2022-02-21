package com.mutatio.sis.recommend.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mutatio.sis.exception.BizNotFoundException;
import com.mutatio.sis.free.vo.FreeVO;
import com.mutatio.sis.question.vo.QuesVO;
import com.mutatio.sis.recommend.dao.IRecommendDao;
import com.mutatio.sis.recommend.vo.RecommendVO;
import com.mutatio.sis.reply.vo.FReplyVO;
import com.mutatio.sis.thesis.dao.IThesisDao;
import com.mutatio.sis.thesis.vo.ThesisVO;

@Service
public class recommendService {
	
	@Inject
	IRecommendDao recommendDao;
	
	@Inject
	IThesisDao theisDao;
	
	public List<RecommendVO> getRecomWordList(String memId) throws BizNotFoundException{
		List<RecommendVO> keywordList = recommendDao.getRecomWordList(memId);
		if(keywordList == null) throw new BizNotFoundException();
		return keywordList;
	}

	public List<RecommendVO> getKeywordThesisList(String thesNo) throws BizNotFoundException{
		List<RecommendVO> thesKeywordList = recommendDao.getKeywordThesisList(thesNo);
		if(thesKeywordList == null) throw new BizNotFoundException();
		return thesKeywordList;
	}
	
	public List<RecommendVO> getCountThesisCode(String commCd) throws BizNotFoundException{
		List<RecommendVO> RecoList = recommendDao.getCountThesisCode(commCd);
		
		return RecoList;
	}
	
	public List<ThesisVO> getMemReferNoDateList(String memId) throws BizNotFoundException{
		List<ThesisVO> referThesisList = recommendDao.getMemReferNoDateList(memId);
		return referThesisList;
	}
	
	public List<FreeVO> getFreeMemberBoardList(String memId) throws BizNotFoundException{
	// paging	
		List<FreeVO> freeRecoList = recommendDao.getFreeMemberBoardList(memId);
		return freeRecoList;
	}

	public List<QuesVO> getQuesMemberBoardList(String memId, String isReply) throws BizNotFoundException{
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("isReply", isReply);
		List<QuesVO> quesRecoList = recommendDao.getQuesMemberBoardList(map);
		return quesRecoList;
	}
	
	public int getMemFreeRowCount(String memId) {
		int cnt = 0;
		cnt = recommendDao.getMemFreeRowCount(memId);
		return cnt;
	}
	public int getMemQuesRowCount(String memId) {
		int cnt = 0;
		cnt = recommendDao.getMemQuesRowCount(memId);
		return cnt;
	}
	
    public List<FReplyVO> getFreeReplyList(String memId) throws BizNotFoundException{
    	List<FReplyVO> fReplyList = recommendDao.getFreeReplyList(memId);
    	return fReplyList;
    }
}
