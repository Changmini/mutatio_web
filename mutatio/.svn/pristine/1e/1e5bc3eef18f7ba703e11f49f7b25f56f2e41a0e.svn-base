package com.mutatio.sis.attach.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mutatio.sis.attach.dao.IAttachDao;
import com.mutatio.sis.attach.vo.AttachVO;
import com.mutatio.sis.exception.BizException;
import com.mutatio.sis.exception.BizNotFoundException;

@Service
public class AttachServiceImpl implements IAttachService {
	@Autowired
	private IAttachDao attachDao;

	@Override
	public AttachVO getAttach(int atchNo) throws BizException {
		AttachVO vo = attachDao.getAttach(atchNo);
		if (vo == null) {
			throw new BizNotFoundException("첨부파일 [" + atchNo + "]에 대한 조회 실패");
		}
		return vo;
	}

	@Override
	public void increaseDownHit(int atchNo) throws BizException {
		attachDao.increaseDownHit(atchNo);
	}
	
	@Override
	public void deleteAttach(int delAtchNo) throws BizException {
		attachDao.deleteAttach(delAtchNo);
	}
	
}