package com.mutatio.sis.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mutatio.code.service.ICommCodeService;
import com.mutatio.sis.code.vo.CodeVO;
import com.mutatio.sis.common.vo.ResultMessageVO;
import com.mutatio.sis.exception.BizDuplicateKeyException;
import com.mutatio.sis.exception.BizNotEffectedException;
import com.mutatio.sis.exception.BizNotFoundException;
import com.mutatio.sis.member.service.MemberService;
import com.mutatio.sis.member.vo.MemberVO;
import com.mutatio.sis.thesis.service.ThesisServiceImpl;
import com.mutatio.sis.thesis.vo.ThesisVO;

@RestController
public class BookMarkController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	ThesisServiceImpl thesisServiceImpl;
	
	@Inject
	@Qualifier("commCodeServiceImpl")
	ICommCodeService codeService;
	
	
	@ModelAttribute("codeList")
	public List<CodeVO> getCodeList(){
		return codeService.getCodeListByParent("CC00");
	}
	
	// 북마크 추가 
	@ResponseBody
	@RequestMapping(value = "/bookmark/addBookmark",  produces = "application/json; charset=UTF-8")
	public Map<String, Object> addBookMark(Model model, @RequestParam(value="memId" ,required = false) String memId, String thesNo) 
							{
		System.out.println(memId + " , " + thesNo);
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memId", memId);
		paramMap.put("thesNo", thesNo);
		Map<String, Object> resultmap = new HashMap<String, Object>();
		try {
			memberService.insertBookmark(paramMap);
		} catch (BizDuplicateKeyException e) {
			e.printStackTrace();
			resultmap.put("fail", true);
		}
		
		resultmap.put("result", true);
		resultmap.put("data", "등록 끝");
		
		return resultmap;
	}
	
	// 북마크 리스트 불러오기
	@RequestMapping(value = "/bookmark/getBookmarkList",  produces = "application/json; charset=UTF-8")
	public Map<String, Object> addBookMark(Model model, @RequestParam(value="memId" ,required = false) String memId) throws BizNotEffectedException 
	{  System.out.println(memId);
		
		MemberVO vo = memberService.getMemBookMark(memId);
		HashMap<String, Object> resultmap = new HashMap<String, Object>();
		HashMap<String, Object> insertmap = new HashMap<String, Object>();
		
		List<ThesisVO> thesList = new ArrayList<ThesisVO>();
	
		
		for(int num : vo.getThesNo()) {
			try {
				ThesisVO thesVO= thesisServiceImpl.getThesis(num); // 논문리스트정보
				List<String> auth = thesisServiceImpl.getAuths(num); // 저자정보
				List<CodeVO> codeList = codeService.getCodeListByParent("CC00"); //코드이름
				// 날짜 뽑아올거 셋팅..ㅎ
					insertmap.put("memId", memId);
					insertmap.put("thesNo", String.valueOf(num));
					String getDate =  memberService.getMarkDate(insertmap);
					thesVO.setMarkDate(getDate);
			    // 코드 셋팅	
					for(CodeVO code : codeList) {
						if(code.getCommCd().equals(thesVO.getThesCategory())){
								thesVO.setCategoryNm(code.getCommNm());
								System.out.println(code.getCommNm());
						}
					}//endForCode
				thesVO.setThesAuth(auth.get(0)); // 작가셋팅..
				thesList.add(thesVO);
				} catch (BizNotFoundException e) {
				resultmap.put("fail","즐겨찾기 목록이 존재하지 않아요.");
			}
		}
		
		resultmap.put("result", true);
		resultmap.put("data", thesList);
		
		return resultmap;
	}
	
	// 삭제
	@RequestMapping("/bookmark/deleteBookmark")
	public Map<String, Object> bookmarkDelete(Model model, String thesNo, String memId) {
		HashMap<String, Object> deletemap = new HashMap<String, Object>();
		HashMap<String, Object> resultmap = new HashMap<String, Object>();
		System.out.println("논문번호 받아오나? ::: " + thesNo);
		System.out.println("아이디 받아오나? ::: " + memId);
		
		deletemap.put("memId", memId);
		deletemap.put("thesNo", thesNo);
			try {
				memberService.deleteBookmark(deletemap);
				resultmap.put("map", true);
				// 성공시 
			} catch (BizNotEffectedException e) {
				resultmap.put("fail", "결과값없음");
			}
		return resultmap;
	}
	
}
