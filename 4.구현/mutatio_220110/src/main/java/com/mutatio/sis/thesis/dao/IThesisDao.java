package com.mutatio.sis.thesis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mutatio.sis.member.vo.MemberVO;
import com.mutatio.sis.thesis.vo.ThesisQualityVO;
import com.mutatio.sis.thesis.vo.ThesisSearchVO;
import com.mutatio.sis.thesis.vo.ThesisVO;

@Mapper
public interface IThesisDao {
	
	public int getTotalRowCount(ThesisSearchVO searchVO);
	public ThesisVO getThesis(int thesNo);
	public List<ThesisVO> getThesisList(ThesisSearchVO searchVO);
	public List<String> getAuths(int thesNo);
	public List<Integer> getSearchAuths(String auth);
	public List<String> getKeyword(int thesNo);
	
	/**
	 * <pre>
	 * 	조회된 논문의 내용(현재는 키워드로 비교)과 유사한 논문이 몇 개가 있는가
	 * 	희소성
	 * </pre>
	 * @param thesNo
	 * @return float x.xx
	 */
	public float scarcity(int thesNo);
	/**
	 * <pre>
	 * 	전체 논문에서 조회된 논문의 각각의 키워드가 얼만큼 쓰였는가
	 * 	인기성
	 * </pre>
	 * @param thesNo
	 * @return float x.xx
	 */
	public float popular(int thesNo);
	/**
	 * <pre>
	 * 	인용수를 정규화 시킨 수치
	 * </pre>
	 * @param thesNo
	 * @return float x.xx
	 */
	public float impReg(int thesNo);
	/**
	 * <pre>
	 * 	논문의 최신성 데이터 출력
	 * </pre>
	 * @param thesNo
	 * @return float x.xx
	 */
	public float freshness(int thesNo);
	
	/**
	 * <pre>
	 * 	논문의 품질 수치 저장
	 * </pre>
	 * @param thesNo, keyF
	 */
	public int setQualityIndex(ThesisQualityVO tqVO);
	public List<Integer> isMoreThanOneVal();
	public int setUpateQualityIndex(ThesisQualityVO tqVO);
	public List<Integer> getAllThesNo();
	public List<ThesisVO> getThesisQualityList(ThesisSearchVO searchVO);
	
	
	/**
	 * <pre>
	 * 	조회 논문과 관련된 논문 추천
	 * </pre>
	 * @param thesNo
	 * @return multi thesis (add info)
	 */
	public List<ThesisVO> getAddInfo(int thesNo);
	
	/**
	 * <pre>
	 * 	메인홈의 토픽논문 추천
	 * </pre>
	 * @return int
	 */
	public int getHomeThesis();
	

	public int getMemReferThesis(MemberVO member);
	
	/**
	 * <pre>
	 * 	논문 퀄리티 반올림 
	 * </pre>
	 * @return float
	 */
	public float getThesisRoundQuality(int thesNo);

	
	

	
	
	
} // class
