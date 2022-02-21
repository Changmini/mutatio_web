package com.mutatio.sis.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mutatio.code.service.ICommCodeService;
import com.mutatio.sis.code.vo.CodeVO;
import com.mutatio.sis.common.vo.ResultMessageVO;
import com.mutatio.sis.exception.BizNotEffectedException;
import com.mutatio.sis.exception.BizNotFoundException;
import com.mutatio.sis.member.service.MemberService;
import com.mutatio.sis.member.vo.MemberSearchVO;
import com.mutatio.sis.member.vo.MemberVO;

@Controller
@RequestMapping("/management")
public class ManagerController {

	@Inject
	private MemberService memberService;

	@Inject
	ICommCodeService codeService;

	@ModelAttribute("jobCodeList")
	public List<CodeVO> getJobCodeList() {
		return codeService.getCodeListByParent("JB00");
	}

	@ModelAttribute("conCodeList")
	public List<CodeVO> getConCodeList() {
		return codeService.getCodeListByParent("CC00");
	}

	private Logger logger = org.slf4j.LoggerFactory.getLogger(this.getClass());

	// 회원 목록
	@RequestMapping("/userList.do")
	public String userList(Model model, MemberSearchVO searchVO) {
		logger.info("userList 요청:: {}",searchVO);
		List<MemberVO> memberList = memberService.getMemList(searchVO);
		model.addAttribute("searchVO",searchVO);
		model.addAttribute("memberList", memberList);
		return "manager/userList";
	}

	// 회원정보(뷰)
	@RequestMapping(value = "/userView.do")
	public String userView(Model model, String memId, HttpSession session) {
		MemberVO member = memberService.getMember(memId);
		model.addAttribute("member", member);
		return "manager/userView";
	}
	
	@PostMapping("/memberDelete.do")
	public String memberDelete(Model model, String memId, HttpSession session) {
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		try {
			memberService.deleteMember(memId);
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("멤버 삭제");
			resultMessageVO.setMessage("멤버 아이디 정지 성공");
			resultMessageVO.setUrl("/management/userList.do");
			resultMessageVO.setUrlTitle("목록으로");
		} catch (BizNotFoundException e) {
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("멤버 호출 실패");
			resultMessageVO.setMessage("해당 멤버를 찾을 수 없습니다.");
			resultMessageVO.setUrl("/management/userList.do");
			resultMessageVO.setUrlTitle("목록으로");
		} catch (BizNotEffectedException e) {
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("멤버 삭제 실패");
			resultMessageVO.setMessage("멤버 아이디를 정지할 수 없습니다.");
			resultMessageVO.setUrl("/management/userList.do");
			resultMessageVO.setUrlTitle("목록으로");
		} 
		model.addAttribute("resultMessageVO",resultMessageVO);
		return "common/message";
	}
	
	@PostMapping("memberRestart.do")
	public String memberRestart(Model model, String memId) {
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		try {
			memberService.restartMember(memId);
			return "redirect:/management/userList.do";
		} catch (BizNotFoundException bnf) {
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("멤버 호출 실패");
			resultMessageVO.setMessage("해당 멤버를 찾을 수 없습니다.");
			resultMessageVO.setUrl("/management/userList.do");
			resultMessageVO.setUrlTitle("목록으로");
			return "common/message";
		} catch (BizNotEffectedException bne) {
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("멤버 아이디 복구 실패");
			resultMessageVO.setMessage("해당 멤버의 아이디를 복구할 수 없습니다.");
			resultMessageVO.setUrl("/management/userList.do");
			resultMessageVO.setUrlTitle("목록으로");
			model.addAttribute("resultMessageVO",resultMessageVO);
			return "common/message";
		} 
	}
	

} // class







