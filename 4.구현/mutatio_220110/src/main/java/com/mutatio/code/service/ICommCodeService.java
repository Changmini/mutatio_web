package com.mutatio.code.service;

import java.util.List;

import com.mutatio.sis.code.vo.CodeVO;

public interface ICommCodeService {
	List<CodeVO> getCodeListByParent(String parentCode) ;
	
}
