<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Order - Online Pizza Ordering</title>
<%@ include file="components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="components/navbar.jsp"%>

<%
List<Orders> l= ordersDao.findByUserId(user.getId());
%>

<div class="container-fluid mt-5">
  
  <%
            if(l == null )
            {
        %>
        <div class="text-center">
        <h1>NO ORDERS MADE BY YOU !!</h1>
        <hr>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        <%
            }
        
            else
            {
            	
            	
        %>
        <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr>
    <th scope="col">Order Id</th>
      <th scope="col">Food Name</th>    
      <th scope="col">Food Description</th>
      <th scope="col">Quantity</th>
      <th scope="col">Store Name</th>
      <th scope="col">Store Address</th>
      <th scope="col">Store Contact</th>
      <th scope="col">Total price</th>
      <th scope="col">Order Date</th>
      <th scope="col">Delivery Date</th>
      <th scope="col">Delivery Status</th>
    </tr>
  </thead>
  
 
  
  <tbody>
  
   <%
      for(Orders o:l)
      {
    	  int foodId=o.getFoodId();
    	  Food f = null;
    	  
    	  Optional<Food> optional = foodDao.findById(foodId);
    	  if(optional.isPresent()) {
    		  f = optional.get();
    	  }
    	  
    	  PizzaStore s= null;
    	  
    	  Optional<PizzaStore> optionalStore = storeDao.findById(f.getStoreId());
    	  if(optionalStore.isPresent()) {
    		  s = optionalStore.get();
    	  }
    	  
          User u= null;
    	  
    	  Optional<User> optionalUser = userDao.findById(o.getId());
    	  if(optionalUser.isPresent()) {
    		  u = optionalUser.get();
    	  }
   %>
    <tr class="text-center">
    <td class="mid-align"><%=o.getOrderId() %></td>
      <td class="mid-align"><%=f.getName() %></td>
      <td class="mid-align"><%=f.getDescription() %></td>
      <td class="mid-align"><%=o.getQuantity() %></td>
        <td class="mid-align"><%=s.getName() %></td>
        <td class="mid-align"><%=s.getAddress() %></td>
        <td class="mid-align"><%=s.getPhoneNo() %></td>
          <td class="mid-align"><%=o.getQuantity() * f.getPrice() %></td>
          <td class="mid-align"><%=o.getOrderDate() %></td>
          <td class="mid-align"><%=o.getDeliveryDate() %></td>
          <td class="mid-align"><%=o.getDeliveryStatus() %></td>
          
    </tr>
    <%
      }
   
            }
    %>
  </tbody>
 
  
</table>
  
</div>
</div>
</body>
</html>