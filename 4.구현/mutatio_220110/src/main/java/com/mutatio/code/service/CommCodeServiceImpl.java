package com.mutatio.code.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mutatio.code.dao.ICommCodeDao;
import com.mutatio.sis.code.vo.CodeVO;

@Service
public class CommCodeServiceImpl implements ICommCodeService {
	@Inject
	ICommCodeDao codeDao;
	/*
	 * @Override public List<CodeVO> getCodeListByParent(String parentCode) {
	 * System.out.println("getCodeListByParent"); return
	 * codeDao.getCodeListByParent(parentCode);
	 * 
	 * }
	 */

	@Override
	public List<CodeVO> getCodeListByParent(String parentCode) {
		System.out.println("getCodeListByParent"); 
		return codeDao.getCodeListByParent(parentCode);
	}

}
