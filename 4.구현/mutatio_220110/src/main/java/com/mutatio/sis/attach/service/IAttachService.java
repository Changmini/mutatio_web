package com.mutatio.sis.attach.service;

import com.mutatio.sis.attach.vo.AttachVO;
import com.mutatio.sis.exception.BizException;

public interface IAttachService {
	/** 첨부파일 상세 조회 */
	public AttachVO getAttach(int atchNo) throws BizException;

	/** 다운로드 횟수 증가 */
	public void increaseDownHit(int atchNo) throws BizException;
	
	/** 해당 파일 삭제 **/
	public void deleteAttach(int delAtchNo) throws BizException;
}
