package com.mutatio.code.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mutatio.sis.code.vo.CodeVO;

@Mapper
public interface ICommCodeDao {
	public List<CodeVO> getCodeListByParent(String parentCode);
	
}
