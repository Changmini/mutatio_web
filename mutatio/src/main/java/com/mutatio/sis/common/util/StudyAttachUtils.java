package com.mutatio.sis.common.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.mutatio.sis.attach.vo.AttachVO;
import com.mutatio.sis.controller.FreeController;




@Component
public class StudyAttachUtils {
	@Value("#{appconf['file.upload.path']}")
	private String uploadPath;


	/** MultipartFile에서 VO 설정 및 업로드 파일 처리 후 리턴, 없는 경우 null */
	public AttachVO getAttachByMultipart(MultipartFile multipart, String category, String path) throws IOException {
		if (!multipart.isEmpty()) {
			String fileName = UUID.randomUUID().toString();
			AttachVO vo = new AttachVO();
			vo.setAtchOriginalName(multipart.getOriginalFilename());
			vo.setAtchFileSize(multipart.getSize());
			vo.setAtchContentType(multipart.getContentType());
			vo.setAtchFileName(fileName);
			vo.setAtchCategory(category);
			vo.setAtchPath(path);
			vo.setAtchFancySize(StudyFileUtils.fancySize(multipart.getSize()));
			String filePath = uploadPath + File.separatorChar + vo.getAtchPath();
			
		  	FileUtils.copyInputStreamToFile(multipart.getInputStream(), new File(filePath, fileName));  
			//여기서 실제 파일이 저장(regist에서 실행됬다), inputStream을 file로 변환하는 메소드
			//multipart.transferTo(new File(filePath, fileName)); // 비슷한 역할    
			
			return vo;
		} else {
			return null;
		}
	}

	/** 다중 MultipartFile에서 VO 설정 및 업로드 파일 처리 후 List 리턴 */
	public List<AttachVO> getAttachListByMultiparts(MultipartFile[] multipartFiles, String category, String path)
			throws IOException {
		List<AttachVO> atchList = new ArrayList<AttachVO>();
		for (int i = 0; i < multipartFiles.length; i++) {
			MultipartFile multipart = multipartFiles[i];
			AttachVO vo = this.getAttachByMultipart(multipart, category, path);
			if (vo != null) {
				atchList.add(vo);
			}
		}
		return atchList;
	}
}