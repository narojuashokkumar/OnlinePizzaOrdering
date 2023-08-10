<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.onlinepizza.dao.*"%>
<%@ page import="com.onlinepizza.model.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page- Yummy Pizza's</title>
<%@ include file="components/common_cs_js.jsp"%>

</head>
<body>
	<%@ include file="components/navbar.jsp"%>

	<div class="container admin mt-4">
		<%@ include file="components/message.jsp"%>
		<div class="row mt-6">
			<div class="col-md-6">
				<div class="card hover" data-toggle="modal"
					data-target="#show-users-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px" class="img-fluid rounded-circle"
								src="/resources/images/totalusers.png" alt="users_pic">
						</div>
						<p>click here see the users</p>
						<h2 class="text-uppercase text-muted">Total Users</h2>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card hover" data-toggle="modal"
					data-target="#total-store-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px" class="img-fluid rounded-circle"
								src="resources/images/category.png" alt="users_pic">
						</div>
						<p>click here to see the pizza store</p>
						<h2 class="text-uppercase text-muted">Total Pizza Stores</h2>
					</div>
				</div>
			</div>
			</div>
			</div>
		
			
			
			
			<div class="container admin mt-2">
		
		<div class="row mt-6">
			<div class="col-md-6">
			

			
				<div class="card hover" data-toggle="modal"
					data-target="#show-foods-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px" class="img-fluid rounded-circle"
								src="/resources/images/totalfood.png" alt="users_pic">
						</div>
						<p>click here to see Foods</p>
						<h2 class="text-uppercase text-muted">Total Foods</h2>
					</div>
				</div>
				</div>
			

		<div class="col-md-6">
				<div class="card hover" data-toggle="modal"
					data-target="#total-order-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px" class="img-fluid rounded-circle"
								src="resources/images/check.png" alt="users_pic">
						</div>
						<p class="text-lowercase text-muted">click here to see total orders</p>
						<h2 class="text-uppercase text-muted">Total Orders</h2>
					</div>
				</div> 
			
			</div>
			
			</div>
		</div>
		
		
			
   
          
            
           

		
	

	

		

		<!-- show users modal -->

		<div class="modal fade" id="show-users-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLongTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white text-center">
						<h5 class="modal-title" id="exampleModalLongTitle">Total
							Users</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="table-responsive">
							<table class="table">
								<thead class="custom-bg text-white">
									<tr>
										<th scope="col">User Id</th>
										<th scope="col">First name</th>
										<th scope="col">Last Name</th>
										<th scope="col">Email Id</th>
										<th scope="col">Mobile No</th>
										<th scope="col">Address</th>
									</tr>
								</thead>
								<tbody>
									<%
									List<User> users = userDao.findAll();
									%>

									<%
									for (User u : users) {
									%>
									<tr>
										<th scope="row" class="mid-align"><%=u.getId()%></th>
										
										<td class="mid-align"><%=u.getFirstname()%></td>
										<td class="mid-align"><%=u.getLastname()%></td>
										<td class="mid-align"><%=u.getEmailid()%></td>
										<td class="mid-align"><%=u.getMobileno()%></td>
										<td class="mid-align"><%=u.getAddress()%></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- end of show users modal -->

		<!-- total users modal -->

		<div class="modal fade" id="total-store-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLongTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white text-center">
						<h5 class="modal-title" id="exampleModalLongTitle">Total Pizza Store </h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="table-responsive">
							<table class="table">
								<thead class="custom-bg text-white">
									<tr>
										<th scope="col">Store Name</th>
										<th scope="col">Store Phone</th>
										<th scope="col">Store Address</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody>
									<%
									   List<PizzaStore> stores = storeDao.findAll();
									%>

									<%
									for (PizzaStore store : stores) {
									%>
									<tr>
										<td class="mid-align"><%=store.getName()%></td>
										<td class="mid-align"><%=store.getPhoneNo()%></td>
										<td class="mid-align"><%=store.getAddress()%></td>
										<td class="mid-align">
										<a href="deletestore?storeId=<%=store.getId()%>"><input
												type="submit" class="btn btn-danger" value="Delete"></a>
											<a  href="updatestore?storeId=<%=store.getId()%>"><input
												type="submit" class="btn btn-danger" value="Update"></a>	
									    </td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ********************* -->

		<!-- show Product modal -->

		<div class="modal fade" id="show-foods-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLongTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white text-center">
						<h5 class="modal-title" id="exampleModalLongTitle">Total
							Foods</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="table-responsive">
							<table class="table">
								<thead class="custom-bg text-white">
									<tr>
										<th scope="col">Food Name</th>
										<th scope="col">Food Description</th>
										<th scope="col">Food Price</th>
										<th scope="col">Store Name</th>
										<th scope="col">Store Address</th>
									</tr>
								</thead>
								<tbody>
									<%
									   List<Food> foods = foodDao.findAll();
									%>

									<%
									for (Food food : foods) {
										
										
										PizzaStore store = null;
										
										Optional<PizzaStore> optional = storeDao.findById(food.getStoreId());
										
										if(optional.isPresent()) {
											store = optional.get();
										}
										
									%>
									<tr>
										<td class="mid-align"><%=food.getName()%></td>
										<td class="mid-align"><%=food.getDescription()%></td>
										<td class="mid-align"><%=food.getPrice()%></td>
										<td class="mid-align"><%=store.getName()%></td>
										<td class="mid-align"><%=store.getAddress()%></td>
										
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ********************* -->

		<!-- total order modal -->

		<div class="modal fade bd-example-modal-lg" id="total-order-modal"
			tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-lg modal-size" role="document">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white text-center">
						<h5 class="modal-title" id="exampleModalLongTitle">TOTAL
							ORDERS</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">

						<%
						List<Orders> orders = ordersDao.findAll();
						
						%>
						<div class="table-responsive">
							<table class="table">
								<thead class="custom-bg text-white">
									<tr class="text-center">
										<th scope="col">Order Id</th>
										<th scope="col">User Name</th>
										<th scope="col">User Phone</th>
										
										<th scope="col">Food Name</th>
										
										<th scope="col">Quantity</th>
										<th scope="col">Store Name</th>
										
										<th scope="col">Total Price</a></th>
										<th scope="col">Order date</th>
										<th scope="col">Delivery date</th>
										<th scope="col">Delivery status</th>
										<th scope="col">Action</th>
									</tr>
								</thead>



								<tbody>

									<%
									for (Orders o : orders) {
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
								    	  
								    	  Optional<User> optionalUser = userDao.findById(o.getUserId());
								    	  if(optionalUser.isPresent()) {
								    		  u = optionalUser.get();
								    	  }
									%>
									<tr class="text-center">
										<td class="mid-align"><%=o.getOrderId()%></td>
										<td class="mid-align"><%=u.getFirstname()%></td>
										<td class="mid-align"><%=u.getMobileno()%></td>
										
										<td class="mid-align"><%=f.getName()%></td>
										
										<td class="mid-align"><%=o.getQuantity()%></td>
										<td class="mid-align"><%=s.getName()%></td>
										
										<td class="mid-align"><%=o.getQuantity()*f.getPrice()%></td>
										<td class="mid-align"><%=o.getOrderDate()%></td>
										<td class="mid-align"><%=o.getDeliveryDate()%></td>
										<td class="mid-align"><%=o.getDeliveryStatus()%></td>
										
										<td class="mid-align">
											<form action="updatedeliverydate">
												
												<input type="hidden" name="orderId" value=<%=o.getOrderId()%>>
												
												<div class="form-group mx-sm-3 mb-2">
													<input type="text" class="form-control" name="deliveryDate"
														placeholder="Delivery Date" size="85" required>
												</div>
												<div class="form-group mx-sm-3 mb-2">
													<select name="deliveryStatus" class="form-control">
														<option value="Pending">Pending</option>
														<option value="Delivered">Delivered</option>
														<option value="On the Way">On the Way</option>
														<option value="Processing">Processing</option>
													</select>
												</div>
												<button type="submit" class="btn custom-bg text-white mb-2">Set</button>
											</form>
										</td>
										
									</tr>
									<%
									}
									%>
								</tbody>


							</table>
						</div>
						<hr>

						<div class="text-center">
							<button type="button" class="btn btn-secondary ml-5"
								data-dismiss="modal">Close</button>
						</div>
						
					</div>
				</div>
			</div>
		</div>

		<!--  -->

</body>
</html>