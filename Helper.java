package com.onlinepizza.utility;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.onlinepizza.dao.FoodDao;
import com.onlinepizza.model.Cart;
import com.onlinepizza.model.Food;

public class Helper {
	
	@Autowired
	private FoodDao foodDao;
	
    public static String getAlphaNumericOrderId(int n)
    {
  
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz";
  
        StringBuilder sb = new StringBuilder(n);
  
        for (int i = 0; i < n; i++) {
  
            int index
                = (int)(AlphaNumericString.length()
                        * Math.random());
  
            sb.append(AlphaNumericString
                          .charAt(index));
        }
  
        return sb.toString();
    }
    
    public double getCartAmount(List<Cart> carts) {
    	
    	double price = 0;
    	
    	for(Cart cart : carts) {
    		
    		Food food = null;
    		
    		Optional<Food> optional = foodDao.findById(cart.getFoodId());
    		
    		if(optional.isPresent()) {
    			food = optional.get();
    		}
    		
    		price = (food.getPrice() *  cart.getQuantity()) + price;
    		
    	}
    	
		return price;
    	
    }
    
    
}
