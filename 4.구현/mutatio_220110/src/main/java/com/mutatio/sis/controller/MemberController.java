package com.mutatio.sis.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mutatio.code.service.ICommCodeService;
import com.mutatio.sis.code.vo.CodeVO;
import com.mutatio.sis.common.vo.ResultMessageVO;
import com.mutatio.sis.exception.BizNotEffectedException;
import com.mutatio.sis.exception.BizNotFoundException;
import com.mutatio.sis.login.service.ILoginService;
import com.mutatio.sis.member.service.MemberService;
import com.mutatio.sis.member.vo.MemberVO;
import com.mutatio.sis.security.CustomUser;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private ILoginService loginService;
	
	@Inject
	ICommCodeService codeService;
	
	private Logger logger = org.slf4j.LoggerFactory.getLogger(this.getClass());
	
	@ModelAttribute("jobCodeList")
	public List<CodeVO> getJobCodeList(){
		return codeService.getCodeListByParent("JB00");
	}
	@ModelAttribute("conCodeList")	
	public List<CodeVO> getConCodeList(){
		return codeService.getCodeListByParent("CC00");
	}
	
	
	
	// 회원정보 보여주기
	@GetMapping(value = "/memberInfo.do")
	public String memberInfo(Model model, HttpSession session) {
		CustomUser USER_INFO = (CustomUser) session.getAttribute("USER_INFO");
		String memId = USER_INFO.getUsername();
		logger.info("info 요청 memId:::{}",memId);
		
		MemberVO member = memberService.getMember(memId);
		model.addAttribute("member", member);
		return "member/memberInfo";
	}
	
	// 회원정보 편집창
	@PostMapping("/memberEdit.do")
	public String memberEdit(Model model, HttpSession session) {
		CustomUser user = (CustomUser) session.getAttribute("USER_INFO");
		String memId = user.getUsername();
		logger.info("info 요청 memId::::{}", memId);
		
		MemberVO member = memberService.getMember(memId);
		model.addAttribute("member", member);
		return "member/memberEdit";
	}
	
	
	// 회원정보 수정하기 (basic)
	@PostMapping(value = "/memberBasicModify.do")
	public String memberBasicModify(Model model, HttpSession session, MemberVO member) {
		CustomUser ucstomUser = (CustomUser)session.getAttribute("USER_INFO");
		member.setMemId(ucstomUser.getMember().getMemId());
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		try {
			logger.info("memberBasicModify 요청 member:::{}",member);
			memberService.modifyBasicMember(member);
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("member수정 성공");
			resultMessageVO.setMessage("member수정에 성공하였습니다");
			resultMessageVO.setUrl("/home.do");
			resultMessageVO.setUrlTitle("home으로");
		} catch (BizNotEffectedException e) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("member수정 실패");
			resultMessageVO.setMessage("member수정에 실패하였습니다");
			resultMessageVO.setUrl("/member/memberEdit.do");
			resultMessageVO.setUrlTitle("회원정보수정 화면으로");
		}
		model.addAttribute("resultMessageVO", resultMessageVO);
		return "common/message";
	}
	
	// 회원정보 수정하기 (pass)
	@PostMapping(value = "/memberPassModify.do")
	public String memberPassModify(Model model, HttpSession session, MemberVO member) {
		CustomUser ucstomUser = (CustomUser)session.getAttribute("USER_INFO");
		member.setMemId(ucstomUser.getMember().getMemId());
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		try {
			logger.info("memberPassModify 요청 member:::{}",member);
			memberService.modifyPassMember(member);
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("member수정 성공");
			resultMessageVO.setMessage("member수정에 성공하였습니다");
			resultMessageVO.setUrl("/home.do");
			resultMessageVO.setUrlTitle("home으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
		} catch (BizNotEffectedException e) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("member수정 실패");
			resultMessageVO.setMessage("member수정에 실패하였습니다");
			resultMessageVO.setUrl("/home.do");
			resultMessageVO.setUrlTitle("home으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
		}
		return "common/message";
	}
	
	
	
	
	
	@PostMapping("/memberDelete.do") // user가 탈퇴버튼 눌렀을 때 home으로 이동,
	public String memberWithdrawal(Model model, HttpServletRequest request, 
					HttpServletResponse response, HttpSession sess, String memId)
					throws BizNotEffectedException, BizNotFoundException {
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		CustomUser user = (CustomUser) sess.getAttribute("USER_INFO");
		try {
			memberService.deleteMember(user.getUsername());
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("member 삭제 성공");
			resultMessageVO.setMessage("member 삭제에 성공했습니다.");
			resultMessageVO.setUrl("/login.do");
			resultMessageVO.setUrlTitle("로그인 화면으로");
			loginService.logAndSessionOut(request, response);
		} catch(BizNotEffectedException e) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("member 삭제 실패");
			resultMessageVO.setMessage("member 삭제에 실패했습니다.");
			resultMessageVO.setUrl("/memberEdit.do");
			resultMessageVO.setUrlTitle("회원정보수정 화면으로");
		} catch(BizNotFoundException e) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("member 삭제 실패");
			resultMessageVO.setMessage("member 삭제에 실패했습니다.");
			resultMessageVO.setUrl("/memberEdit.do");
			resultMessageVO.setUrlTitle("회원정보수정 화면으로");
		}
		model.addAttribute("resultMessageVO", resultMessageVO);
		return "common/message";
	}
	
	
	
	
	
	
} // class








