package com.mutatio.sis.thesis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mutatio.sis.thesis.vo.ThesisVO;

@Mapper
public interface IFactorDao {
	public List<ThesisVO> getFactorList();
	public List<String> getInterestList(String memId);
	public List<Map<String,String>> getInterestMap();
}
