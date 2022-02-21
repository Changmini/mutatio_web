package com.mutatio.sis.question.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mutatio.sis.question.vo.QuesVO;
import com.mutatio.sis.question.vo.QuestionSearchVO;

@Mapper
public interface IQuestionDao {
	
	public int getTotalRowCount();
	public QuesVO getQuesBoard(int quesNo);
	public int increaseHit(int boNo);
	public List<QuesVO> getQuesBoardList(QuestionSearchVO searchVO);
	public int questModify(QuesVO quesVO);
	public int questDelete(int quesNo);
	public int insertQuesBoard(QuesVO quesVO);

	
}
