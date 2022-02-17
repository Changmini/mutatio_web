package com.mutatio.sis.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mutatio.sis.thesis.service.ThesisServiceImpl;
import com.mutatio.sis.thesis.vo.ThesisSearchVO;

@Controller
public class IntroController {
	@Inject
	private ThesisServiceImpl thesisService;
	
	@RequestMapping(value = "/introduction.do")
	public String thesisCount(Model model, ThesisSearchVO searchVO) {
		int thesisCount = thesisService.getTotalRowCount(searchVO);
		model.addAttribute("thesisCount", thesisCount);
		return "introduction";
	}
}
