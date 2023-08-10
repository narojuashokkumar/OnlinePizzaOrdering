package com.onlinepizza.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.onlinepizza.dao.AdminDao;
import com.onlinepizza.model.Admin;

@Controller
public class AdminController {
	
	@Autowired
	private AdminDao adminDao;
	
	@GetMapping("/")
	public String homePage() {
		return "index";
	}
	
	@GetMapping("/home")
	public String goToHomePage() {
		return "index";
	}
	
	@GetMapping("/adminlogin")
	public String goToAdminLoginPage() {
		return "adminlogin";
	}
	
	@GetMapping("/admindashboard")
	public String goToAdminDashboardPage() {
		return "admin";
	}
	
	@PostMapping("/adminlogin")
	public ModelAndView loginAdmin(@RequestParam("email") String emailId, @RequestParam("password") String password, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Admin admin = this.adminDao.findByUserIdAndPassword(emailId, password);
		if(admin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("active-user", admin);
			session.setAttribute("user-login","admin");
			mv.addObject("status", "Admin Successfully Logged In!!!");
			mv.setViewName("index");
		}
		
		else {
			mv.addObject("status"," Failed to Login!!!");
			mv.setViewName("adminlogin");
		}
		
		return mv;
	}

}
