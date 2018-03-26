package com.mskim.backendservice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		return "home";
	}
	@RequestMapping(value = "/hash", method = RequestMethod.GET)
	public String hash(HttpServletRequest request) {
		String text = request.getParameter("text");
		System.out.println(text.hashCode());
		
		return "home";
	}
	
}
