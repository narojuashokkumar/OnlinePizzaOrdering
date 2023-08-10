<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
   <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home- Online Pizza Ordering</title>
<%@ include file="components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="components/navbar.jsp"%>
    
    <%
        List<Food> foods = new ArrayList<Food>();
        
        String foodsSource = (String)request.getAttribute("food-source");
        
        if(foodsSource == null) {
           foods = foodDao.findAll();
        }
        
        else{
        	foods = (List<Food>)request.getAttribute("foods");
        }
        
    %>

    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" style="width:100%">
    <div class="carousel-item active">
      <img class="d-block w-100" src="resources/images/carou1.jpeg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="resources/images/carou2.jpeg" alt="Second slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


<div class="text-center"><%@ include file="components/message.jsp"%></div>
<div class="container-fluid">
     
     <div class="col-md-20 ">
         
             <div class="row mt-4">
                 <div class="col-md-12 admin">
                     <div class="card-columns hover">
                     
                         <%
                             String stock="Out Of Stock!!!"; 
                             for(Food f: foods)
                             {
                            	 
                            	 PizzaStore s= null;
                           	  
                           	  Optional<PizzaStore> optionalStore = storeDao.findById(f.getStoreId());
                           	  if(optionalStore.isPresent()) {
                           		  s = optionalStore.get();
                           	  }
                         %>
                        
                         <div class="card">
                         
                             <div class="card-header">
                                 <h2 class="card-title"><a href="showfood?foodId=<%=f.getId()%>" style="text-decoration: none;color:black;"> <%=f.getName() %></a></h2>                                          
                             </div>
                         
                             <div class="card-body">
                                 <p class="card-text"><%=f.getDescription() %></p> 
                                 <hr>
                                 <p class="card-text"><b>Pizza Store : </b></p> <p><%=s.getName() %></p>
                                 <p class="card-text"><b>Store Address : </b></p> <p><%=s.getAddress() %></p>
                                 
                             </div>
                             <div class="card-footer text-center">
                                 <p style="font-size:25px"><span class="ml-2"><b>&#8377;<%=f.getPrice() %>/-</b></span>
                               
                             </div>
                             
                         </div>
                         
                       
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