package com.mutatio.sis.thesis.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mutatio.sis.thesis.dao.IFactorDao;
import com.mutatio.sis.thesis.vo.ThesisVO;

@Service
public class FactorServiceImpl {
	@Inject
	IFactorDao factor;
	
	public List<ThesisVO> factorList() {
		List<ThesisVO> getFactorList = factor.getFactorList();
		return getFactorList;
	}
	
	public List<String> interestList(String memId) {
		List<String> getInterestList = factor.getInterestList(memId);
		return getInterestList;
	}
	
	public List<Map<String,String>> interestMap(){
		List<Map<String,String>> getInterestMap = factor.getInterestMap();
		return getInterestMap;
	}
}
