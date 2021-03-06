package com.mutatio.sis.free.service;

import java.util.List;

import com.mutatio.sis.exception.BizNotEffectedException;
import com.mutatio.sis.exception.BizNotFoundException;
import com.mutatio.sis.exception.BizPasswordNotMatchedException;
import com.mutatio.sis.free.vo.FreeSearchVO;
import com.mutatio.sis.free.vo.FreeVO;

public interface IFreeService {
	/**
	 * totalRowCount구하고 pageSetting하고 조건에 맞는 free_board 테이블에서 조건에 맞는 데이터 검색
	 * @param FreeBoardSearchVO searchVO
	 * @return List<FreeVO>
	 * */
	public List<FreeVO> getBoardList(FreeSearchVO searchVO);
	
	
	/**
	 * 조회수 증가 + 상세글보기 <br>
	 * 해당 첨부파일이 존재하는 경우
	 * FreeVO의 attaches에 저장
	 * @param int boNo
	 * @return FreeVO
	 * @throws BizNotFoundException 글을 찾을 수 없을 때
	 * @throws BizNotEffectedException 조회수 증가 update문 실패
	 * */
	public FreeVO getBoard(int boNo) throws BizNotFoundException,BizNotEffectedException;
	
	
	/**
	 *  게시판 글 수정할 때 
	 * @param FreeVO board
	 * @throws BizNotFoundException 글 못 찾을 때
	 * @throws BizPasswordNotMatchedException DB에 있는 비밀번호랑 다를때
	 * @throws BizNotEffectedException 왠지 모르게 update(del_yn='Y') 실패
	 */
	public void modifyBoard(FreeVO board)
			throws BizNotFoundException, BizNotEffectedException;
	
	
	/**
	 * 게시판 글 삭제할 때 
	 * @param FreeVO board
	 * @throws BizNotFoundException 글 못 찾을 때
	 * @throws BizPasswordNotMatchedException DB에 있는 비밀번호랑 다를때
	 * @throws BizNotEffectedException 왠지 모르게 update(del_yn='Y') 실패
	 */
	public void removeBoard(String freeNo)
			throws BizNotFoundException, BizNotEffectedException;
	
	
	/**
	 * 게시판 새로운 글 등록할 때
	 * @param FreeVO board
	 * @throws BizNotEffectedException 왠지 모르게 update(del_yn='Y') 실패
	 */
	public void registBoard(FreeVO board) throws BizNotEffectedException;


    }
