<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Pizza Store - Online Pizza Ordering</title>
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
                    <h3 class="text-center my-3">Update Pizza Store here..!!</h3>
            <form action="updatestore" method="post">
            
            <%
               PizzaStore store = (PizzaStore)request.getAttribute("store");
            %>
                 
                 <div class="form-group">
                     <label for="name">Store Id</label>
                     <input type="text" class="form-control" id="id" aria-describedby="emailHelp" name="id" value="<%=store.getId()%>" required readonly>
                 </div>
                 
                 <div class="form-group">
                     <label for="name">Store Name</label>
                     <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="name" placeholder="Enter store name" value="<%=store.getName()%>" required>
                 </div>
                 
                 <div class="form-group">
                     <label for="phone">Address</label>
                     <textarea style="height:90px" class="form-control" placeholder="Enter Address" name="address" required ><%=store.getAddress() %></textarea>
                 </div>
                 
                 <div class="form-group">
                     <label for="phone">Mobile No.</label>
                     <input type="number" class="form-control" id="phone" aria-describedby="emailHelp" name="phoneNo" placeholder="Enter Address" value="<%=store.getPhoneNo() %>" required>
                 </div>
                 
                 <div class="container text-center">
                      <button class="btn text-white custom-bg">Update Store</button>
                 </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>