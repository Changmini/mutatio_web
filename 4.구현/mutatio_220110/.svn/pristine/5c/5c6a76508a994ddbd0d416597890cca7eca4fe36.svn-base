package com.mutatio.sis.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.groups.Default;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mutatio.code.service.ICommCodeService;
import com.mutatio.sis.attach.vo.AttachVO;
import com.mutatio.sis.code.vo.CodeVO;
import com.mutatio.sis.common.util.StudyAttachUtils;
import com.mutatio.sis.common.valid.Modify;
import com.mutatio.sis.common.vo.ResultMessageVO;
import com.mutatio.sis.exception.BizNotEffectedException;
import com.mutatio.sis.exception.BizNotFoundException;
import com.mutatio.sis.free.service.IFreeService;
import com.mutatio.sis.free.vo.FreeSearchVO;
import com.mutatio.sis.free.vo.FreeVO;
import com.mutatio.sis.member.vo.MemberVO;
import com.mutatio.sis.security.CustomUser;

@Controller
public class FreeController {
	
	@Inject
	@Qualifier("freeServiceImpl")
	IFreeService freeService;
	
	@Inject
	@Qualifier("commCodeServiceImpl")
	ICommCodeService codeService;
	
	@Inject
	StudyAttachUtils attachUtils;
	
   
	// 하는 역할 : return값을 model 담음
	// 모든 requestMapping 실행전에 실행되는 메소드
	@ModelAttribute("codeList")
	public List<CodeVO> getCodeList(){
		System.out.println("getCodeList");
		return codeService.getCodeListByParent("FC00");
	}

	
	@RequestMapping("/freeList.do")
	public String freeList(Model model, FreeSearchVO searchVO,HttpServletRequest req) {		
		System.out.println("검색어 :::::" + searchVO.getSearchWord());
		System.out.println("서치타입 :::::" + searchVO.getSearchType());
		model.addAttribute("searchVO", searchVO);
		List<FreeVO> freeBoardList = freeService.getBoardList(searchVO);
		model.addAttribute("freeBoardList", freeBoardList);
		
		return "/free/freeList";
	}
	
	@RequestMapping("/freeView.do")
	public String freeView(Model model, HttpSession session, @RequestParam(value = "freeNo", required = true) int freeNo) {
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		CustomUser user = (CustomUser)session.getAttribute("USER_INFO");
		model.addAttribute("memberInfo", user);
		try {
			FreeVO freeBoard = freeService.getBoard(freeNo);
			model.addAttribute("freeBoard", freeBoard);
			System.out.println("freeNo = " + freeNo);
			
		} catch(BizNotFoundException ebf) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("FreeBoard찾기실패");
			resultMessageVO.setMessage("FreeBoard찾는데 실패했습니다. 글을 찾을 수 없습니다.");
			resultMessageVO.setUrl("/free/freeList.do");
			resultMessageVO.setUrlTitle("목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			model.addAttribute("ebf", ebf);
			return"common/message";
		} catch(BizNotEffectedException ebe) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("조회수 증가 실패");
			resultMessageVO.setMessage("FreeBoard찾는데 실패했습니다. 조회수를 증가시킬 수 없습니다.");
			resultMessageVO.setUrl("/free/freeList.do");
			resultMessageVO.setUrlTitle("목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			model.addAttribute("ebe", ebe);
			return"common/message";
		}
		
		return "/free/freeView";
	}
	
	@RequestMapping(value = "/member/freeForm.do")
	public String freeForm(@ModelAttribute("freeBoard")FreeVO freeBoard) {
		
		return "/free/freeForm";
	}
	
	@RequestMapping(value = "/member/freeEdit.do" ,method = RequestMethod.GET)
	public ModelAndView freeEdit(ModelAndView mav, @RequestParam int freeNo) {
		ResultMessageVO resultMessageVO = new ResultMessageVO();

		try {
			
			FreeVO freeBoard = freeService.getBoard(freeNo);
			mav.addObject("freeBoard", freeBoard);

			mav.setViewName("free/freeEdit");
			
		} catch(BizNotFoundException ebf) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("FreeBoard찾기실패");
			resultMessageVO.setMessage("FreeBoard찾는데 실패했습니다. 글을 찾을 수 없습니다.");
			resultMessageVO.setUrl("/free/free_list.do");
			resultMessageVO.setUrlTitle("목록으로");
			mav.addObject("resultMessageVO", resultMessageVO);
			mav.setViewName("common/message");
		} catch(BizNotEffectedException ebe) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("조회수 증가 실패");
			resultMessageVO.setMessage("FreeBoard찾는데 실패했습니다. 조회수를 증가시킬 수 없습니다.");
			resultMessageVO.setUrl("/free/free_list.do");
			resultMessageVO.setUrlTitle("목록으로");
			mav.addObject("resultMessageVO", resultMessageVO);
			mav.setViewName("common/message");
		}

		return mav;
	}
	

	
	
	// 등록 Regeist
	@RequestMapping(value = "/member/freeRegist.do", method = RequestMethod.POST)
	public String freeRegist(Model model
			,HttpSession session
			,@Validated(value = {Default.class}) @ModelAttribute("freeBoard")FreeVO freeBoard
			,BindingResult error
			,@RequestParam(value= "boFiles", required = false)MultipartFile[] boFiles) throws IOException {

		System.out.println("content :::: " + freeBoard.getFreeContent());
		System.out.println("title :::: " +freeBoard.freeTitle);
		System.out.println("category :::: " +freeBoard.freeCategory);
		System.out.println("file :::: " +boFiles);

		CustomUser usermeta = (CustomUser)session.getAttribute("USER_INFO");
		MemberVO user = usermeta.getMember();
		
		if(error.hasErrors()) {
			System.out.println(" error: " + error.toString());
			
			return "/free/freeForm";
		}
		try{
			// boFiles(MultiPartFile) 가지고 List<AttachVO> 만드는 함수
			// 만들 때, 실제로 파일 업로드 
			if(boFiles != null) {
				List<AttachVO> attaches = attachUtils.getAttachListByMultiparts(boFiles,"FREE", "free");
				freeBoard.setAttaches(attaches);
			}
		if(user != null) {	
			freeBoard.setFreeWriter(user.getMemId()); // 작성자 세팅
			freeBoard.setFreeNickName(user.getMemName()); // 닉네임 세팅
			System.out.println("memName  = " + user.getMemName());
			freeService.registBoard(freeBoard);
		}
			model.addAttribute("message", "해당 게시글을 등록했습니다.");
			
			FreeSearchVO searchVO = new FreeSearchVO();
			model.addAttribute("searchVO", searchVO);
			List<FreeVO> freeBoardList = freeService.getBoardList(searchVO);
			model.addAttribute("freeBoardList", freeBoardList);
			return "/free/freeList";
			
		} catch(BizNotEffectedException ebe) {
			model.addAttribute("message", "게시글 등록에 실패했습니다. ");
		}
		return "/free/freeList";
	}
	
	@RequestMapping(value = "/member/freeDelete.do")
 	public String freeDelete(Model model, String freeNo) throws BizNotFoundException, BizNotEffectedException {
 			freeService.removeBoard(freeNo);
 			model.addAttribute("message", "해당 게시글이 삭제 되었습니다.");
 			
 			FreeSearchVO searchVO = new FreeSearchVO();
 			model.addAttribute("searchVO", searchVO);
 			List<FreeVO> freeBoardList = freeService.getBoardList(searchVO);
 			model.addAttribute("freeBoardList", freeBoardList);
 			return "/free/freeList";
 	}
	
	@RequestMapping(value = "/member/freeModify.do", method = RequestMethod.POST)
	public String freeModify(Model model
			,@Validated(value = {Default.class, Modify.class}) @ModelAttribute("freeBoard")FreeVO freeBoard
			,BindingResult error
			,@RequestParam(value= "boFiles", required = false)MultipartFile[] boFiles) throws IOException {

		
		if(error.hasErrors()) {
			 List<ObjectError> errorList = error.getAllErrors();
		        for (ObjectError e : errorList)
		            System.out.println("getErrorMessage ::: " + e.getDefaultMessage());
			return "/free/free_edit";
		}
		
		System.out.println("freeNo = " + freeBoard.getFreeNo());
		
		try{
			if(boFiles != null) {
				List<AttachVO> attaches = attachUtils.getAttachListByMultiparts(boFiles,"FREE", "free");
				freeBoard.setAttaches(attaches);
			}
   //  	VIEW단에서 file delete - > freeVO delName
			freeService.modifyBoard(freeBoard);	
			model.addAttribute("message", "게시글 수정 완료.");
		} catch(BizNotFoundException ef) {
			model.addAttribute("message", "해당 게시글 찾을수 없음");
		} catch(BizNotEffectedException ee) {
			model.addAttribute("message", "수정 실패");
		}
		
		FreeSearchVO searchVO = new FreeSearchVO();
		model.addAttribute("searchVO", searchVO);
		List<FreeVO> freeBoardList = freeService.getBoardList(searchVO);
		model.addAttribute("freeBoardList", freeBoardList);
		return "/free/freeList";
	}
	
	
} // class
