package com.mutatio.sis.question.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mutatio.sis.exception.BizNotEffectedException;
import com.mutatio.sis.exception.BizNotFoundException;
import com.mutatio.sis.exception.BizUserNotMatchedException;
import com.mutatio.sis.member.vo.MemberVO;
import com.mutatio.sis.question.dao.IQuestionDao;
import com.mutatio.sis.question.vo.QuesVO;
import com.mutatio.sis.question.vo.QuestionSearchVO;
import com.mutatio.sis.security.CustomUser;

@Service
public class QuestionService {
	
	@Inject
	IQuestionDao iQuestionDao;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	/*
	* <pre>
	*	Return the data list of the inquiry post.
	* </pre>
	*
	* @param searchVO
	* @return    : List<QuesVO>
	* @Author    : ChangMin
	* @Date      : 2022. 1. 7. 오전 9:51:44
	*/
	public List<QuesVO> getQuesBoardList(QuestionSearchVO searchVO) {
		int totalRowCount = iQuestionDao.getTotalRowCount();
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		logger.info("rowCnt of quesBoardList:: {}",searchVO);
		List<QuesVO> quesList = iQuestionDao.getQuesBoardList(searchVO);
		return quesList;
	}

	
	
	/*
	* <pre>
	*	Return a specific post.
	* </pre>
	*
	* @param quesNo
	* @return QuesVO
	* @throws BizNotFoundException
	* @Author    : ChangMin
	* @Date      : 2022. 1. 7. 오전 9:53:02
	*/
	public QuesVO getQuesBoard(int quesNo) throws BizNotFoundException {
		iQuestionDao.increaseHit(quesNo);
		QuesVO quesBoard = iQuestionDao.getQuesBoard(quesNo);
		if (quesBoard == null) throw new BizNotFoundException(); 
		return quesBoard;
	}
	
	
	
	/*
	* <pre>
	*	Check the role of the user.
	* </pre>
	*
	* @param user
	* @param quesBoard
	* @throws BizUserNotMatchedException
	* @Author    : ChangMin
	* @Date      : 2022. 1. 7. 오전 9:53:14
	*/
	public void checkRole(CustomUser user, QuesVO quesBoard) throws BizUserNotMatchedException {
		List<String> authority = user.getMember().getRoleList();
		logger.info("checkRole::{}",authority.contains("ROLE_MANAGER"));
		
		if(authority.contains("ROLE_MANAGER")) return;
		else if( user == null // first- inspect null
				//Check if the accessor and the author are the same
				|| !( user.getUsername().equals(quesBoard.getQuesWriter()) ) 
		) throw new BizUserNotMatchedException();
		return ;
	} 
	
	
	
	/*
	* <pre>
	*	Check whether the accessor has permission to edit.
	* </pre>
	*
	* @param username
	* @param quesWriter
	* @throws BizUserNotMatchedException
	* @Author    : ChangMin
	* @Date      : 2022. 1. 7. 오전 9:53:16
	*/
	public void editPermission(String username, String quesWriter) throws BizUserNotMatchedException {
		if (!username.equals(quesWriter)) throw new BizUserNotMatchedException();
	} // Edit permission check

	
	
	/*
	* <pre>
	*	Revise the contents of the inquiry board.
	* </pre>
	*
	* @param quesVO
	* @throws BizNotFoundException
	* @throws BizNotEffectedException
	* @Author    : ChangMin
	* @Date      : 2022. 1. 7. 오전 9:53:19
	*/
	public void questModify(QuesVO quesVO) throws BizNotFoundException, BizNotEffectedException {
		QuesVO quesBoard = iQuestionDao.getQuesBoard(quesVO.getQuesNo());// Existence of the thesis
		if (quesBoard == null) throw new BizNotFoundException();         // not exist thesis

		int cnt = iQuestionDao.questModify(quesVO);
		if (cnt < 1) throw new BizNotEffectedException();       // fail update
	}

	
	
	/*
	* <pre>
	*	Delete the inquiry board.
	* </pre>
	*
	* @param quesVO
	* @throws BizNotEffectedException
	* @throws BizNotFoundException
	* @Author    : ChangMin
	* @Date      : 2022. 1. 7. 오전 9:53:21
	*/
	public void questDelete(QuesVO quesVO) throws BizNotEffectedException, BizNotFoundException {
		int quesNo = quesVO.getQuesNo();
		QuesVO quesBoard = iQuestionDao.getQuesBoard(quesNo);
		if (quesBoard == null) throw new BizNotFoundException();

		logger.info("questDelete:::{}",quesNo);
		int cnt =  iQuestionDao.questDelete(quesNo);
		if (cnt < 1) throw new BizNotEffectedException(); 
	}

	
	
	/*
	* <pre>
	*	Register your inquiry board.
	* </pre>
	*
	* @param quesVO
	* @throws BizNotEffectedException
	* @Author    : ChangMin
	* @Date      : 2022. 1. 7. 오전 9:53:24
	*/
	public void insertQuesBoard(QuesVO quesVO) throws BizNotEffectedException {
		int cnt = iQuestionDao.insertQuesBoard(quesVO);
		if (cnt < 1) throw new BizNotEffectedException();
		
	}




	
	
	
	
	
} // class




















