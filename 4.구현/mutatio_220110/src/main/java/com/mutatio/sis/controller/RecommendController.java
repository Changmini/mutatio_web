package com.mutatio.sis.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mutatio.code.service.ICommCodeService;
import com.mutatio.sis.code.vo.CodeVO;
import com.mutatio.sis.exception.BizNotEffectedException;
import com.mutatio.sis.exception.BizNotFoundException;
import com.mutatio.sis.free.service.FreeServiceImpl;
import com.mutatio.sis.free.vo.FreeSearchVO;
import com.mutatio.sis.free.vo.FreeVO;
import com.mutatio.sis.member.service.MemberService;
import com.mutatio.sis.question.service.QuestionService;
import com.mutatio.sis.question.vo.QuesVO;
import com.mutatio.sis.recommend.service.recommendService;
import com.mutatio.sis.recommend.vo.RecommendVO;
import com.mutatio.sis.reply.vo.FReplyVO;
import com.mutatio.sis.security.CustomUser;
import com.mutatio.sis.thesis.service.ThesisServiceImpl;
import com.mutatio.sis.thesis.vo.ThesisVO;
import com.mutatio.translate.service.PapagoTranslate;

@Controller
@RequestMapping("/member")
public class RecommendController {
	
	@Inject
	recommendService recommendService;
	
	@Inject
	MemberService memberService;
	
	@Inject
	ThesisServiceImpl thesisService;
	
	@Inject
	FreeServiceImpl freeService;
	
	@Inject
	QuestionService quesService;
	
	@Inject
	@Qualifier("commCodeServiceImpl")
	ICommCodeService codeService;
	
	@Inject
	PapagoTranslate transService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@ModelAttribute("codeList")
	public List<CodeVO> getCodeList(){
		return codeService.getCodeListByParent("CC00");
	}
	
	
	@RequestMapping(value="/recommend.do")
	public String recommend(HttpSession session, Model model, String isReply) throws BizNotFoundException {
		CustomUser user = (CustomUser) session.getAttribute("USER_INFO");
		List<RecommendVO> keywordList= recommendService.getRecomWordList(user.getUsername());
		String[][] memberConCodeList = memberService.getConcernField(user.getUsername());
		String[] memberConCode = memberConCodeList[0];
		// referList
		List<ThesisVO> referThesisList = recommendService.getMemReferNoDateList(user.getUsername());
		
		// myFreeboard
		List<FreeVO> myFreeList = recommendService.getFreeMemberBoardList(user.getUsername());
		int freeRowCnt = recommendService.getMemFreeRowCount(user.getUsername());
		
		// myQuesboard
		List<QuesVO> myQuesList = recommendService.getQuesMemberBoardList(user.getUsername(), isReply);
		int quesRowCnt = recommendService.getMemQuesRowCount(user.getUsername());
		
		// FreeReplylist
		List<FReplyVO> fReplyList = recommendService.getFreeReplyList(user.getUsername());
		
		model.addAttribute("memberConCode", memberConCode);
		model.addAttribute("referList", referThesisList);
		model.addAttribute("myFreeList", myFreeList);
		model.addAttribute("freeRowCnt", freeRowCnt);
		model.addAttribute("myQuesList", myQuesList);
		model.addAttribute("quesRowCnt", quesRowCnt);
		model.addAttribute("fReplyList", fReplyList);
		model.addAttribute("keywordList", keywordList);
		model.addAttribute("memId", user.getUsername());
		
		return "/recommend/recommend";
	}
	
	@RequestMapping(value = "/recommend/getKeywordThesisList",  produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> getKeywordThesisList(Model model, @RequestParam(value="thesKeyword" ,required = false) String thesKeyword) throws BizNotFoundException{  
		logger.info("recommendThesisList 요청 :::{}", thesKeyword);
		HashMap<String, Object> resultmap = new HashMap<String, Object>();
		
		List<RecommendVO> recoList = recommendService.getKeywordThesisList(thesKeyword);
		resultmap.put("result", true);
		resultmap.put("data", recoList);
		
		return resultmap;
	}
	
	// 관심사 추천 논문리스트
	@RequestMapping(value = "/recommend/getCodeThesisList",  produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> getCodeThesisList(Model model, @RequestParam(value="commCd" ,required = false) String commCd) throws BizNotFoundException{  
		logger.info("getCodeThesisList 요청 :::{}", commCd);
		HashMap<String, Object> resultmap = new HashMap<String, Object>();
		List<RecommendVO> recoList = recommendService.getCountThesisCode(commCd);
		// 논문 리스트 뽑기
		List<ThesisVO> thesCodeList = new ArrayList<ThesisVO>(); 
		for(RecommendVO vo : recoList) {
				int thNo = vo.getThesNo();
			   ThesisVO thVO = thesisService.getThesis(thNo);
			    if(thVO.getThesNo()== vo.getThesNo()) {
			    	  thVO.setCnt(vo.getCnt());
			    }
			   thesCodeList.add(thVO);
		}
			
		resultmap.put("result", true);
		resultmap.put("data", thesCodeList);
		
		return resultmap;
	}
	
	// 문의게시판 답글유무 서치
	@RequestMapping(value = "/recommend/isQuesReply",  produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> isQuesReply(HttpSession session, Model model, @RequestParam(value="isReply") String isReply) 
		throws BizNotFoundException{  
		logger.info("isQuesReply 요청 :::{}", isReply);
		CustomUser user = (CustomUser) session.getAttribute("USER_INFO");
		HashMap<String, Object> resultmap = new HashMap<String, Object>();
		List<QuesVO> quesList = recommendService.getQuesMemberBoardList(user.getUsername(), isReply);
		if(!quesList.isEmpty()) {
			resultmap.put("result", true);
		}else {
			resultmap.put("result", false);
		}
		resultmap.put("data", quesList);
		
		return resultmap;
	}
	
	@RequestMapping(value = "/recommend/keywordTranslate", produces = "application/json; charset=UTF-8" )
	@ResponseBody
	public Map<String, Object> keywordTranslate(Model model, @RequestParam(value="thesKeyword" ,required = false) String thesKeyword) throws BizNotFoundException{  
	// 파파고 api... json 형태 번역값 String 뽑아내기...
	    	HashMap<String, Object> resultmap = new HashMap<String, Object>();
			String result = transService.getTransSentence(thesKeyword);

			JSONParser parser = new JSONParser();
			JSONObject parseJson = null;
			try {
				parseJson = (JSONObject) parser.parse(result);
			} catch (ParseException e) {
				System.out.println("변환실패");
				e.printStackTrace();
			}
			logger.info("jsonParse1 요청 :::{}", parseJson.get("message"));
			parseJson = (JSONObject) parseJson.get("message");
			parseJson = (JSONObject) parseJson.get("result");
			String res = (String) parseJson.get("translatedText");
			logger.info("res 번역된 것. 요청 :::{}", res);
			
			resultmap.put("result", true);
			resultmap.put("data", res);
			
			return resultmap;
	}

	@RequestMapping(value = "/recommend/freeDelete" , produces = "application/json; charset=UTF-8")
	@ResponseBody
 	public String freeDelete(Model model, String freeNo) throws BizNotFoundException, BizNotEffectedException {
			logger.info("recommend+ freeDelete 요청 :::{}", freeNo);	
		    freeService.removeBoard(freeNo);
 			
		    String message = "해당 게시글이 삭제되었습니다. ";
 			return message;
 	}
	
	@RequestMapping(value = "/recommend/quesDelete" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String quesDelete(Model model, String quesNo) throws BizNotFoundException, BizNotEffectedException {
		logger.info("recommend+ quesDelete 요청 :::{}", quesNo);	
		QuesVO qv = new QuesVO();
		qv.setQuesNo(Integer.parseInt(quesNo));
		quesService.questDelete(qv);
		
		String message = "해당 게시글이 삭제되었습니다. ";
		return message;
	}
	
	
} // class








