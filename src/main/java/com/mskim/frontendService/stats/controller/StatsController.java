package com.mskim.frontendService.stats.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/stats")
public class StatsController {

	@RequestMapping(value={"", "/main"}, method=RequestMethod.GET)
	public String statsMain(Model model){
		model.addAttribute("category1", "내 Open API 통계");
		model.addAttribute("categoryLink", "/stats/main");
		model.addAttribute("content", "stats/stats.jsp");
		return "document/common/container";
	}
	
	@RequestMapping(value="/{apiKey}", method=RequestMethod.GET)
	public String statsDetail(Model model){
		model.addAttribute("category1", "내 Open API 통계");
		model.addAttribute("category2", "통계 상세");
		model.addAttribute("categoryLink", "/stats/main");
		model.addAttribute("content", "stats/statsDetail.jsp");
		return "document/common/container";
	}
	
}
