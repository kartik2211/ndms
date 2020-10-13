<%@page import="com.nds.db.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel = "stylesheet" href = "css\contact_us.css"/>
        <link rel = "stylesheet" href = "css\mark1.css"/>
        <link rel = "stylesheet" href = "css\mark2.css"/>
        <link rel = "stylesheet" href = "css\dropdown.css"/>
    </head>
    <body style="background-image: url('images_1/4.jpg');height:100%;background-size: cover;">
        <div>
            <h1 style="font-family:Old English Text MT;"><a href="#"style="color:white;text-decoration:none;" >&nbsp The Times-Journal</a><h1>
                    <ul class="p2">
                        <li class="p3"><a href="login.jsp">Logout</a></li>
                        <li class="p3"><a href="contact_us_vend.jsp">Contact Us</a></li>
                        <li class="p3"> <div class="dropdown">
                        <button class="dropbtn" style="width:170px;"><span style="font-family:calibri;font-size:30px;float:right;"><b>About me</b></span> 
                        <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content">
                            <a href="change_password_vend.jsp">Change Password</a>
                            <a href="personal_details_vend.jsp">Personal Details</a>
                        </div>
                        </li>
                        <li class="p3"> <div class="dropdown">
                                <button class="dropbtn" style="width:150px;"><span style="font-family:calibri;font-size:30px;float:right;"><b>Details</b></span> 
                        <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content">
                            <a href="delivery_boy_details.jsp">Delivery Boy Details</a>
                            <a href="subscribed_customer.jsp">Subscribed Customers</a>
                        </div>
                        </li>
                        <li class="p3"><a href="add_delivery_boy.jsp">Add Delivery Boy</a></li>
                        <li class="p3"><a href="welcomeVendor.jsp">Home</a></li>
                    </ul>
                    </div><br/>
        
                    <fieldset>
                        <form action="contact">
                            <div class="imgcontainer">
                                <img src="images\3.jpg" alt="Avatar" class="avatar">
                            </div>
                           <%
                                String username = (String) session.getAttribute("Username");
                                String email = (String) session.getAttribute("Email");
                                String phone_number = (String) session.getAttribute("PhoneNumber");
                                System.out.println("Username is " + username);

                                System.out.println("email is " + email);

                                System.out.println("phone_number is " + phone_number);
                                session.setAttribute("Username", username);
                                session.setAttribute("Email", email);
                                session.setAttribute("PhoneNumber", phone_number);

                            %><%                                Connection connection = DbConnection.getConnection();
                                String dbfirst_name = "";
                                String dblast_name = "";
                                String name = "";
                                String sql = "select first_name,last_name from Attributes where email='" + email + "' and category='Customer'";
                                try {
                                    Statement st = connection.createStatement();
                                    ResultSet rs = st.executeQuery(sql);
                                    System.out.println("Hello=====");
                                    while (rs.next()) {
                                        dbfirst_name = rs.getString("first_name");
                                        dblast_name = rs.getString("last_name");

                                        name = dbfirst_name + " " + dblast_name;
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                            
                            <br/>
                            <div class="container">
                                <label for="uname"><b>Name</b></label>
                                <input type="text" placeholder="Enter Name" name="nds.first_name" value="<%=name%>" required readonly>
                                <br/>
                                <br/>
                                <br/>
                                <label for="psw"><b>Email</b></label>
                                <input type="email" placeholder="Enter Email" name="nds.email" value="<%=email%>"required readonly>
                                <br/>
                                <br/>
                                <label for="psw"><b>Phone</b></label>
                                <input type="text" placeholder="Enter Phone Number" name="nds.phone_number" value="<%=phone_number%>"required>
                                <br/>
                                <br/>
                                <label for="psw"><b>Subject</b></label>
                                <input type="text" placeholder="Enter Subject" name="nds.subject" required>
                                <br/>
                                <br/>
                                <label for="psw"><b>Message</b></label>
                                <input type="text" placeholder="Enter Message" name="nds.message" required>
                                <input type="hidden" name="nds.category" value="Vendor">

                                <br/>
                                <br/> 

                                <br/>
                                <br/>
<table>
<tr>								
        <th>                        <button type="submit">Submit</button></th>
                                <th><button type="reset" >Reset</button></th>
                            </tr>
</table>
							</div>


                        </form>
                    </fieldset>
			
                    <footer >
                        <ul type =none>
                            <li class="line"><a href="welcomeVendor.jsp">Home</a></li>
                            <li class="line"><a href="subscribed_customer.jsp">Subscribed Customers</a></li>
                            <li class="line"><a href="add_delivery_boy.jsp">Add Delivery Boy</a></li>
                            <li class="line"><a href="delivery_boy_details.jsp">Delivery Boy Details</a></li>
                            <li class="line" ><a href="change_password_vend.jsp" >Change Password</a></li>
                            <li class="line" ><a href="personal_details_vend.jsp" >Personal Details</a></li>
                            <li class="line"><a href="contact_us_vend.jsp">Contact Us</a></li>
                        </ul>
                        <p style = "color:white;">Copyright &copy 2020, All Rights Reserved by Nishachars</p>
                    </footer>

                    </body>
                    </html>