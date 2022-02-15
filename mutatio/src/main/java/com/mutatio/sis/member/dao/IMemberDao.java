package com.mutatio.sis.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mutatio.sis.member.vo.MemberSearchVO;
import com.mutatio.sis.member.vo.MemberVO;

@Mapper
public interface IMemberDao {
	
	public List<MemberVO> getMemberList(MemberSearchVO searchVO);
	public MemberVO getMember(String memId);
	public MemberVO getMemberYn(String memId);
	
	public int updateMember(MemberVO member);
	public List<Integer> getCcId(MemberVO member);
	public int updateConCode(Map<String, Object> map);
	
	public int joinMember(MemberVO member);
	public int joinConCode(HashMap<String, String> map);
	public List<Map<String, String>> getConcernField(String memId);
	public int deleteMember(String memId); 	  
	public int restartMember(String memId);
	
	// 로그인
	public List<String> getUserRoleListByUserId(String memId);
	public int insertUserRole(String memId);
	
	// 즐겨찾기 관련 메서드
	public int insertBookmark(HashMap<String, Object> parammap);
	public String getMarkDate(HashMap<String, Object> parammap);
	public int[] getMemBookMark(String memId);
	public int deleteBookMark(HashMap<String, Object> parammap);
	
	public int getTotalRowCount(MemberSearchVO searchVO);

}