<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Credit Card</title>
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
                    <h3 class="text-center my-3">Add Credit Card here..!!</h3>
            <form action="addcreditcard" method="post">
                 <div class="form-group">
                     <label for="name">Credit Card Number</label>
                     <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="creditCardNumber" placeholder="Enter credit card no." required>
                 </div>
                 
                  <div class="form-group">
                     <label for="email">Valid From</label>
                     <input type="text" class="form-control" id="email" aria-describedby="emailHelp" name="validFrom" placeholder="Enter Valid From" required>
                 </div>
                 
                 <div class="form-group">
                     <label for="password">Valid To</label>
                     <input type="text" class="form-control" id="password" aria-describedby="emailHelp" name="validTo" placeholder="Enter Valid To" required>
                 </div>
                 
                 <div class="form-group">
                     <label for="password">Balance</label>
                     <input type="text" class="form-control" id="password" aria-describedby="emailHelp" name="balance" placeholder="Enter Balance" required>
                 </div>
                 
                 <div class="container text-center">
                      <button class="btn text-white custom-bg">Register Card</button>
                 </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>