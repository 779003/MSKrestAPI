package com.mskim.frontendService.stats.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mskim.frontendService.stats.StatsService;
import com.mskim.frontendService.usr.service.LoginService;

@Controller
@RequestMapping(value="/stats")
public class StatsController {

	@Autowired
	LoginService loginService;
	
	@Autowired
	StatsService statsService;
	
	@RequestMapping(value={"", "/main"}, method=RequestMethod.GET)
	public String statsMain(Model model, HttpSession session){
		
		String memberId = loginService.getLoginMember(session).getId();
		List<HashMap<String, String>> appList = statsService.appList(memberId);
		
		model.addAttribute("appList", appList);
		model.addAttribute("ssMemberId",loginService.getLoginMember(session).getId());
		model.addAttribute("category1", "내 Open API 통계");
		model.addAttribute("categoryLink", "/stats/main");
		model.addAttribute("content", "stats/stats.jsp");
		return "document/common/container";
	}
	
	@RequestMapping(value="/{apiKey}", method=RequestMethod.GET)
	public String statsDetail(Model model, HttpSession session, 
			@PathVariable String apiKey, @RequestParam(value="selectDate", required = false) String selectDate){
		
		if(selectDate == null) { //날짜 입력이 없을 경우 [일주일전~오늘] 통계 데이터 세팅
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			Date date = new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			cal.add(Calendar.DATE, -7);
			selectDate = sdf.format(cal.getTime()) + "-" + sdf.format(date);
		}
		
		String stDt;
		String edDt;
		
		int dash = selectDate.indexOf('-'); 
		if(dash == -1) {
			stDt = selectDate;
			edDt = selectDate;
		}else {
			stDt = selectDate.substring(0, dash); 
			edDt = selectDate.substring(dash+1, selectDate.length());  
		}
		
		HashMap<String, String> statsParam = new HashMap<String, String>();
		statsParam.put("apiKey", apiKey);
		statsParam.put("stDt", stDt);
		statsParam.put("edDt", edDt);
		
		HashMap<String, String> statsDetailMain = statsService.statsDetailMain(apiKey);
		HashMap<String, String> statsToday = statsService.statsToday(apiKey);
		List<HashMap<String, String>> statsCall = statsService.statsCall(statsParam);
		List<HashMap<String, String>> statsError = statsService.statsError(statsParam);
		List<HashMap<String, String>> statsReferer = statsService.statsReferer(statsParam);
		List<HashMap<String, String>> statsLogList = statsService.statsLogList(apiKey);
		
		model.addAttribute("selectDate", selectDate);
		model.addAttribute("statsDetailMain", statsDetailMain);
		model.addAttribute("statsToday", statsToday);
		model.addAttribute("statsCall", statsCall);
		model.addAttribute("statsError", statsError);
		model.addAttribute("statsReferer", statsReferer);
		model.addAttribute("statsLogList", statsLogList);
		
		
		model.addAttribute("ssMemberId",loginService.getLoginMember(session).getId());
		model.addAttribute("category1", "내 Open API 통계");
		model.addAttribute("category2", "통계 상세");
		model.addAttribute("categoryLink", "/stats/main");
		model.addAttribute("content", "stats/statsDetail.jsp");
		return "document/common/container";
	}
	
}
