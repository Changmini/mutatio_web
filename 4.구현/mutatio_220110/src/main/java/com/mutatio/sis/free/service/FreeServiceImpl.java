package com.mutatio.sis.free.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mutatio.sis.attach.dao.IAttachDao;
import com.mutatio.sis.attach.vo.AttachVO;
import com.mutatio.sis.exception.BizNotEffectedException;
import com.mutatio.sis.exception.BizNotFoundException;
import com.mutatio.sis.exception.BizPasswordNotMatchedException;
import com.mutatio.sis.free.dao.IFreeDao;
import com.mutatio.sis.free.vo.FreeSearchVO;
import com.mutatio.sis.free.vo.FreeVO;

@Service
public class FreeServiceImpl implements IFreeService {

	@Inject
	IFreeDao freeBoardDao;

	@Inject
	IAttachDao attachDao;
	
	@Override
	public List<FreeVO> getBoardList(FreeSearchVO searchVO) {
			
			int totalRowCount = freeBoardDao.getTotalRowCount(searchVO);
			searchVO.setTotalRowCount(totalRowCount);
			searchVO.pageSetting();
			
			
			// try catch가 없다. 
			// --> freeFreeardDao.getFreeardList에서 발생한 DaoExcepion은 실제로
			//      프로그램 흐름을 멈추고 에러발생시킨다.
			List<FreeVO> freeboardList = freeBoardDao.getBoardList(searchVO);

			AttachVO attach = new AttachVO();
			attach.setAtchCategory("FREE");
			for(int i = 0; i < freeboardList.size(); i++) {
				// 댓글개수셋팅
				int cnt = 0;
				cnt = freeBoardDao.getReplyCnt(freeboardList.get(i).getFreeNo());
				freeboardList.get(i).setReplyCnt(cnt);
				
				attach.setAtchParentNo(freeboardList.get(i).getFreeNo());
				if(attachDao.getAttachByParentNoList(attach) != null) {
					List<AttachVO> attaches = attachDao.getAttachByParentNoList(attach);
					freeboardList.get(i).setAttaches(attaches);
				}
			}
			return freeboardList;
		
	}

	@Override
	public FreeVO getBoard(int freeNo) throws BizNotFoundException, BizNotEffectedException {

//			IAttachDao attachDao = session.getMapper(IAttachDao.class);
			
			int cnt = freeBoardDao.increaseHit(freeNo);
			if(cnt <= 0) throw new BizNotEffectedException(); // 조회수
			
			FreeVO freeboard = freeBoardDao.getBoard(freeNo);
			if(freeboard == null) throw new BizNotFoundException();
			// 첨부파일 조회 (글번호 + 자유게시판)
//  		FreeNo 이용해서 attach테이블 조회			
			AttachVO attach = new AttachVO();
			attach.setAtchParentNo(freeboard.getFreeNo());
			attach.setAtchCategory("FREE");
			List<AttachVO> attaches = attachDao.getAttachByParentNoList(attach);
			freeboard.setAttaches(attaches);
			
			return freeboard;
	}

	@Override
	public void modifyBoard(FreeVO freeboard)
			throws BizNotFoundException, BizNotEffectedException {

			// 글 쓸때 비밀번호 입력 --> 수정시 비밀번호 입력해야 수정가능.
			FreeVO vo = freeBoardDao.getBoard(freeboard.getFreeNo());
			// vo는 DB에 있는 글
			// Freeard는 내가 Edit 창에서 입력한 값들.
			if(vo==null) throw new BizNotFoundException();
			
			int cnt = freeBoardDao.updateBoard(freeboard);
			if(cnt <=0) throw new BizNotEffectedException();
			// free 테이블 업데이트
			
			List<AttachVO> attaches = freeboard.getAttaches();
			if(attaches != null) { 
				for(AttachVO attach : attaches) {
					// 원래는 regist에서 FreeNo 0인데 mybatis에서 selectKey에 의해서
					// sequence 쓴 값이 FreeVO에 셋팅됨. 
					attach.setAtchParentNo(freeboard.getFreeNo());
					attachDao.insertAttach(attach);
				}
			} // freeEdit에서 추가한거 따로 업로드 해주기
			// delAtachNos가지고 또 삭제			
			int[] delatchNos = freeboard.getDelAtchNos();
			if(delatchNos != null) {
				for(int delAtchNo : delatchNos) {
					attachDao.deleteAttach(delAtchNo);
				}
			} // DB에서만 삭제, 파일은 그대로...
			
		
	}

	@Override
	public void removeBoard(String freeNo)
			throws BizNotFoundException, BizNotEffectedException {
			
			int cnt = freeBoardDao.deleteBoard(freeNo);
			if(cnt <=0) throw new BizNotEffectedException();
	}

	@Override
	public void registBoard(FreeVO Freeard) throws BizNotEffectedException {

//			IAttachDao attachDao = session.getMapper(IAttachDao.class);
			int cnt = freeBoardDao.insertBoard(Freeard);
			// insertFreeard는 freeFreeard 에 insert
			// Freeard의 attaches가지고 attach 테이블에 insert
			List<AttachVO> attaches = Freeard.getAttaches();
			if(attaches != null) {
				for(AttachVO attach : attaches) {

					// 원래는 regist에서 FreeNo 0인데 mybatis에서 selectKey에 의해서
					// sequence 쓴 값이 FreeVO에 셋팅됨. 
					attach.setAtchParentNo(Freeard.getFreeNo());
				
					attachDao.insertAttach(attach);
				}
			}
			
			if(cnt<=0) throw new BizNotEffectedException();
			//게시판 등록 이후 attach 테이블에 입력
			/*
			 * List<AttachVO> attaches = Freeard.getAttaches(); if(attaches != null &&
			 * attaches.size() > 0) { // 첨부파일 저장 for(AttachVO vo : attaches) {
			 * vo.setAtchParentNo(Freeard.getFreeNo()); attachDao.insertAttach(vo); } }
			 */
	}
		

}
