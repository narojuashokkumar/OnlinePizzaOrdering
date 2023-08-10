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
import com.onlinepizza.dao.PizzaStoreDao;
import com.onlinepizza.model.Food;
import com.onlinepizza.model.PizzaStore;

@Controller
public class PizzaStoreController {
	
	@Autowired
	private PizzaStoreDao storeDao;
	
	@Autowired
	private FoodDao foodDao;
	
	@GetMapping("/addpizzastore")
	public String goToAddFoodPage() {
		return "addpizzastore";
	}
	
	@PostMapping("/addstore")
	public ModelAndView addStore(@ModelAttribute PizzaStore store) {
		ModelAndView mv = new ModelAndView();
		if(this.storeDao.save(store) != null ) {
			mv.addObject("status", store.getName()+" Store Successfully Registered!!!");
			mv.setViewName("index");
		}
		
		else {
			mv.addObject("status", store.getName()+" Failed to Registered!!!");
			mv.setViewName("addpizzastore");
		}
		
		return mv;
	}
	
	@PostMapping("/updatestore")
	public ModelAndView updateStore(@ModelAttribute PizzaStore store) {
		ModelAndView mv = new ModelAndView();
		if(this.storeDao.save(store) != null ) {
			mv.addObject("status", store.getName()+" Store Successfully Registered!!!");
			mv.setViewName("index");
		}
		
		else {
			mv.addObject("status", store.getName()+" Failed to Registered!!!");
			mv.setViewName("index");
		}
		
		return mv;
	}
	
	
	@GetMapping("/deletestore")
	public ModelAndView deleteStore(@RequestParam("storeId") int storeId) {
		ModelAndView mv = new ModelAndView();
		
		List<Food> foods = this.foodDao.findByStoreId(storeId);
		
		for(Food food : foods) {
			foodDao.delete(food);
		}
		
		Optional<PizzaStore> oC = storeDao.findById(storeId);
		PizzaStore store = null;
		
		if(oC.isPresent()) {
			store = oC.get();
		}
		
		this.storeDao.delete(store);
			mv.addObject("status", "Pizza store deleted successfully!!!");
			mv.setViewName("index");
		
		return mv;
		
	}
	
	@GetMapping("/updatestore")
	public ModelAndView updateStore(@RequestParam("storeId") int storeId) {
		ModelAndView mv = new ModelAndView();
		
		Optional<PizzaStore> oC = storeDao.findById(storeId);
		PizzaStore store = null;
		
		if(oC.isPresent()) {
			store = oC.get();
		}
		
		
			mv.addObject("store",store);
			mv.setViewName("updatestore");
		
		return mv;
		
	}
		

}
