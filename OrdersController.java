package com.onlinepizza.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.onlinepizza.dao.CartDao;
import com.onlinepizza.dao.CreditCardDetailsDao;
import com.onlinepizza.dao.FoodDao;
import com.onlinepizza.dao.OrdersDao;
import com.onlinepizza.model.Cart;
import com.onlinepizza.model.CreditCardDetails;
import com.onlinepizza.model.Food;
import com.onlinepizza.model.Orders;
import com.onlinepizza.model.User;
import com.onlinepizza.utility.Helper;

@Controller
public class OrdersController {
	
	@Autowired
	private OrdersDao orderDao;
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private FoodDao foodDao;
	
	@Autowired
	private CreditCardDetailsDao creditCardDetailsDao;
	
	@GetMapping("/myorder")
	public String myOrders() {
		return "myorder";
	}
	
	@PostMapping("/placeorder")
	public ModelAndView placeOrder(HttpSession session, @RequestParam("creditCardNumber") String cardNumber, @RequestParam("validTo") String validTo, @RequestParam("validFrom") String validFrom ) {
		ModelAndView mv = new ModelAndView();
		
		
		
		CreditCardDetails creditCardDetails = this.creditCardDetailsDao.findByCreditCardNumberAndValidFromAndValidTo(cardNumber, validFrom, validTo);
		
		if(creditCardDetails == null ) {
			mv.addObject("status", "Wrong Credit Card Credentials");
			mv.setViewName("payment");
	        return mv;
		}
		User user = (User)session.getAttribute("active-user");
		List<Cart> cartss = this.cartDao.findByUserId(user.getId());
		
		double totalAmountToPay = 0;
		
		for(Cart cart : cartss) {
            Food food = null;
    		
    		Optional<Food> optional = foodDao.findById(cart.getFoodId());
    		
    		if(optional.isPresent()) {
    			food = optional.get();
    		}
    		double foodPrice =food.getPrice() * cart.getQuantity();
    		totalAmountToPay = foodPrice + totalAmountToPay;
		}
		
		if(totalAmountToPay >  creditCardDetails.getBalance()) {
			mv.addObject("status", "Low Balance, Failed to order foods");
			mv.setViewName("index");
	        return mv;
		}
		
		
		List<Cart> carts = this.cartDao.findByUserId(user.getId());
		
		Orders order = null;
		
		String orderId = Helper.getAlphaNumericOrderId(10);
		
		for(Cart cart : carts) {
			order = new Orders();
			order.setOrderDate(LocalDate.now().toString());
			order.setDeliveryDate("Pending");
			order.setDeliveryStatus("Pending");
			order.setFoodId(cart.getFoodId());
			order.setOrderId(orderId);
			order.setQuantity(cart.getQuantity());
			order.setUserId(user.getId());
			orderDao.save(order);
			cartDao.delete(cart);
		}
			mv.addObject("status", "Order Placed successfully, Your Order Id is "+orderId);
			mv.setViewName("index");
	        return mv;
	}
	
	
	
	@GetMapping("/updatedeliverydate")
	public ModelAndView addDeliveryStatus(@RequestParam("orderId") String orderId, @RequestParam("deliveryStatus") String deliveryStatus, @RequestParam("deliveryDate") String deliveryDate ) {
		ModelAndView mv = new ModelAndView();
		
		List<Orders> orders = this.orderDao.findByOrderId(orderId);
		
		for(Orders order : orders) {
			order.setDeliveryDate(deliveryDate);
			order.setDeliveryStatus(deliveryStatus);
		    this.orderDao.save(order);
		}
			mv.addObject("status", "Order Delivery Status Updated.");
			mv.setViewName("index");
	        return mv;
	}
	

	
}
