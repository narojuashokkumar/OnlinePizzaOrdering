package com.onlinepizza.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.onlinepizza.dao.FoodDao;
import com.onlinepizza.model.Food;

@Controller
public class FoodController {
	
	@Autowired
	private FoodDao foodDao;
	
	@GetMapping("/addfood")
	public String goToAddFoodPage() {
		return "addfood";
	}
	
	@GetMapping("/showfood")
	public ModelAndView goToShowFoodPage(@RequestParam("foodId") int foodId) {
		ModelAndView mv = new ModelAndView();
		Food food = null;
		Optional<Food> o = foodDao.findById(foodId);
		
		if(o.isPresent()) {
			food = o.get();
		}
		
		mv.setViewName("showfood");
		mv.addObject("food", food);
		
		return mv;
	}
	
	@PostMapping("/addfood")
	public ModelAndView addFood(@ModelAttribute Food food) {
		ModelAndView mv = new ModelAndView();
		if(this.foodDao.save(food) != null ) {
			mv.addObject("status", food.getName()+" Added Successfully!!!");
			mv.setViewName("index");
		}
		
		else {
			mv.addObject("status", food.getName()+" Failed to Add!!!");
			mv.setViewName("addfood");
		}
		
		return mv;
	}
	
	@PostMapping("/updatefood")
	public ModelAndView updateFood(@ModelAttribute Food food) {
		ModelAndView mv = new ModelAndView();
		if(this.foodDao.save(food) != null ) {
			mv.addObject("status", food.getName()+" Store Successfully Updated!!!");
			mv.setViewName("index");
		}
		
		else {
			mv.addObject("status", food.getName()+" Failed to Update!!!");
			mv.setViewName("index");
		}
		
		return mv;
	}
	
	@GetMapping("/searchfood")
	public ModelAndView searchFood(@RequestParam("foodname") String foodName) {
		ModelAndView mv = new ModelAndView();
		
		List<Food> foods = this.foodDao.findByNameContainingIgnoreCase(foodName);
		mv.addObject("food-source", "search");
			mv.addObject("foods", foods);
			mv.setViewName("index");
		
		return mv;
	}

	@GetMapping("/deletefood")
	public ModelAndView deleteFood(@RequestParam("foodId") int foodId) {
		ModelAndView mv = new ModelAndView();
		
		Optional<Food> oF = foodDao.findById(foodId);
	    Food food = null;
		
		if(oF.isPresent()) {
			food = oF.get();
		}
		
		this.foodDao.delete(food);
			mv.addObject("status", "Food deleted successfully!!!");
			mv.setViewName("index");
		
		return mv;
	}
	
	@GetMapping("/updatefood")
	public ModelAndView updateStore(@RequestParam("foodId") int foodId) {
		ModelAndView mv = new ModelAndView();
		
		Optional<Food> oC = foodDao.findById(foodId);
		Food food = null;
		
		if(oC.isPresent()) {
			food = oC.get();
		}
		
			mv.addObject("food",food);
			mv.setViewName("updatefood");
		
		return mv;
		
	}
	
}
