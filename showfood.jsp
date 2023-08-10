<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="org.springframework.web.context.support.WebApplicationContextUtils"%>
    
<%
    Food food = (Food)request.getAttribute("food");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Food - Online Food Ordering</title>
<%@ include file="components/common_cs_js.jsp"%>

</head>
<body>
<%@ include file="components/navbar.jsp"%>

<script type="text/javascript">
      function checkUser()
      {
    	  <%
    	       
    	      if(userType != null)
    	      {
    	    	  if(userType.equals("user"))
    	    	  {
    	  %>
    	             return  true;
    	          <%
    	    	  }
    	    	  
    	    	  else
    	    	  {	  
    	    	  %>
    	    	  alert("Please login as customer to buy the food.");
    	    	  return false;
    	    	  <%
    	    	  }
    	    	  
    	      }
    	      else
    	      {
    	  %>
    	    	  alert("Please login to buy the food.");
    	    	  return false;
    	  <%
    	      }
    	  %>
      }
</script>

<%
    PizzaStore store = null;
  Optional<PizzaStore> optinalStore = storeDao.findById(food.getStoreId());
  
  if(optinalStore.isPresent()) {
	  store = optinalStore.get();
  }
%>

<div class="container-fluid">
<div class="row mt-2">
       <div class="col-md-6 offset-md-3 admin" >
<div class="card">
                   <div class="card-header text-center">
                        <h1><%=food.getName()%></h1>
                   </div>
                    <div class="text-left ml-3 mt-3"><h2>Description :</h2></div>
                        <div class="card-body text-left">     
                                 <h4 class="card-text"><%=food.getDescription() %></h4> 
                        </div>
                        <hr>
                        <div class="text-left ml-3 mt-3"><h2>Pizza Store :</h2></div>
                        <div class="card-body text-left">     
                                 <h4 class="card-text">Name : <%=store.getName() %></h4> 
                        </div>
                        <div class="card-body text-left">     
                                 <h5 class="card-text">Address : <%=store.getAddress() %></h5> 
                        </div>
                        <div class="card-body text-left">     
                                 <h5 class="card-text">Mobile No : <%=store.getPhoneNo() %></h5> 
                        </div>
                        <div class="card-footer text-center">
                                 <p style="font-size:35px"><span style="font-size:35px;"><b>Price :</b></span><span class="ml-2"><b>&#8377;<%=food.getPrice() %>/-</b></span></p>
                                 <hr>
                                 
                               <%
                                   if(userType != null && userType.equals("user"))
                                   {
                               %>
                               
                               <form class="form-inline" action="addtocart">
                                  <input type="hidden" name="foodId" value="<%=food.getId()%>">
                                  <input type="hidden" name="userId" value="<%if(user!= null) {  %><%=user.getId() %> <%}%>">
                                  <div class="form-group mx-sm-3 mb-2">
                                      <input type="number" class="form-control" name="quantity" placeholder="Quantity" required>
                                  </div>
                                  <button type="submit" class="btn custom-bg text-white mb-2">Add To Cart</button>
                               </form>
                              
                              <%
                                   }
                               
                                   else if(userType != null && userType.equals("admin"))
                                   {
                              %> 
                                     
                                      <a href="deletefood?foodId=<%=food.getId()%>"><button type="button" class="btn btn-danger">Delete Food</button></a>
                                      <a href="updatefood?foodId=<%=food.getId()%>"><button type="button" class="btn btn-danger">Update Food</button></a>
                                      
                              <%
                                   }
                               
                                   else {
                              %> 
                              
                                 <form class="form-inline" action="addtocart" onclick="return checkUser()">
                                  <input type="hidden" name="foodId" value="<%=food.getId()%>">
                                  <input type="hidden" name="userId" value="<%if(user!= null) {  %><%=user.getId() %> <%}%>">
                                  <div class="form-group mx-sm-3 mb-2">
                                      <input type="number" class="form-control" name="quantity" placeholder="Quantity" required>
                                  </div>
                                  <button type="submit" class="btn custom-bg text-white mb-2">Add To Cart</button>
                               </form>
                              
                              <%
                                   }
                              %>
                             
                        </div>
                   </div>

</div>
</div>
</div>

</body>
</html>