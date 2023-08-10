<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register- Add Food</title>
<%@ include file="components/common_cs_js.jsp"%>
</head>
<body>
  <%@ include file="components/navbar.jsp"%>
  
 <div class="container-fluid">
  <div class="row mt-2">
       <div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <%@ include file="components/message.jsp"%>
                <div class="card-body px-5">
                    <h3 class="text-center my-3">Add Food here..!!</h3>
            <form action="addfood" method="post">
                 <div class="form-group">
                     <label for="name">Food Name</label>
                     <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="name" placeholder="Enter food name" required>
                 </div>
                 
                  <div class="form-group">
                     <label for="email">Food Description</label>
                     <input type="text" class="form-control" id="email" aria-describedby="emailHelp" name="description" placeholder="Enter food description" required>
                 </div>
                 
                 <div class="form-group">
                     <label for="password">Price</label>
                     <input type="number" class="form-control" id="password" aria-describedby="emailHelp" name="price" placeholder="Enter price" required>
                 </div>
                 
                 <%
                     List<PizzaStore> stores = storeDao.findAll();
                 %>
                 
                 <div class="form-group">
                     <label for="email">Select Pizza Store</label>
                   <select name="storeId" class="form-control">
                       <option value="0">Select Store</option>
                      <%
                		   for(PizzaStore store : stores)
                           {
                       %>
                             <option value="<%=store.getId()%>"><%=store.getName()%></option>
                       <%
                           }
                       %>
                   </select>
                 </div>
                 
                 <div class="container text-center">
                      <button class="btn text-white custom-bg">Add Food</button>
                 </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>