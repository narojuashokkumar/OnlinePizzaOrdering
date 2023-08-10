package com.onlinepizza.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.onlinepizza.dao.UserDao;
import com.onlinepizza.model.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDao userDao;
	
	@GetMapping("/login")
	public String goToLoginPage() {
		return "login";
	}
	
	@GetMapping("/register")
	public String goToUserRegisterPage() {
		return "register";
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		session.removeAttribute("active-user");
		session.removeAttribute("user-login");
		mv.addObject("status","Logged out Successfully");
		mv.setViewName("index");
		
		return mv;
	}
	
	@PostMapping("/register")
	public ModelAndView registerUser(@ModelAttribute User user) {
		ModelAndView mv = new ModelAndView();
		if(this.userDao.save(user) != null ) {
			mv.addObject("status", user.getFirstname()+" Successfully Registered!!!");
			mv.setViewName("login");
		}
		
		else {
			mv.addObject("status", user.getFirstname()+" Failed to Registered!!!");
			mv.setViewName("register");
		}
		
		return mv;
	}
	
	@PostMapping("/login")
	public ModelAndView loginUser(@RequestParam("email") String emailId, @RequestParam("password") String password, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		User user=this.userDao.findByEmailidAndPassword(emailId, password);
		if(user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("active-user", user);
			session.setAttribute("user-login","user");
			mv.addObject("status", user.getFirstname()+" Successfully Logged In!!!");
			mv.setViewName("index");
		}
		
		else {
			mv.addObject("status"," Failed to Login!!!");
			mv.setViewName("login");
		}
		
		return mv;
	}

}
