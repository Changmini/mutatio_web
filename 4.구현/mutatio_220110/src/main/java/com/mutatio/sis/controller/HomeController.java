package com.mutatio.sis.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mutatio.sis.exception.BizNotFoundException;
import com.mutatio.sis.security.CustomUser;
import com.mutatio.sis.thesis.service.ThesisServiceImpl;
import com.mutatio.sis.thesis.vo.ThesisVO;



@Controller
public class HomeController {
	
	@Inject
	ThesisServiceImpl thesisService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * design frame
	 */
	@RequestMapping("/frame/footer.do")
	public String footer(Model model) {
		return "frame/footer";
	}
	@RequestMapping("/frame/header.do")
	public String header(Model model) {
		return "frame/header";
	}
	@RequestMapping("/frame/sub_title.do")
	public String sub_title(Model model) {
		return "frame/sub_title";
	}
	
	
	
	
	
	/**
	 * @return Main Page
	 */
	@RequestMapping({"/home.do","/"})
	public String home(Model model, HttpSession session) {		
		try {
			int topicThesis = thesisService.getHomeThesis();
			ThesisVO thesis = thesisService.getThesis(topicThesis);
			String summary = thesis.getThesSummary();
			if(summary.length() > 170) thesis.setThesSummary(summary.substring(0, 170)+"...");
			model.addAttribute("thesis", thesis);
		} catch (BizNotFoundException e) {
			e.printStackTrace();
		}
		return "home";
	}
	
	@ResponseBody
	@RequestMapping("/searchList.do")
	public Map<String, Object> searchList(Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "a001");
		
		return map;
	}
		
	
} // class











