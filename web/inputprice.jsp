<%-- 
    Document   : inputprice.jsp
    Created on : Mar 17, 2018, 1:28:14 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@include file="dataconnection.jsp"%> 
<!DOCTYPE html>
<html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="style.css">
        <title>JSP Page</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
        <script type="text/javascript">
         $(document).ready(function() {
           //checks for the button click event
           //Stops the submit request
            $("#myAjaxRequestForm").submit(function(e){
                  e.preventDefault();
           });
           $("#myButton").click(function(e){

                   //get the form data and then serialize that
                   dataString = $("#myAjaxRequestForm").serialize();
                   var courseId= $("select#courseId").val();
                   var institutionid= $("select#institutionid").val(); 
                   var price = $("input#price").val(); 
                   var dataVal= "courseId=" + courseId + "&institutionid=" + institutionid + "&price=" + price ;
                   var url="/myWebProject/BestDealFinder/web/insertprice.jsp";
                    $.ajax({
                       type: "POST",
                       url: url,
                       data: dataVal,
                       success: function(data) {
                           alert("Success");
                           $('#success').show();
                           $('html, body').animate({ scrollTop: $('#success').offset().top }, 'slow');

                       },
                       dataType: "json"
                   }); 



           }); 

       }); 

       </script>    
    </head>
<%
ResultSet couseList=statement.executeQuery("select * from world.course order by coursename"); 
%>
    <body>
        <div class="w3-top">
  <div class="w3-bar w3-red w3-card w3-left-align w3-large">
    <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="/myWebProject/BestDealFinder/web/BestFinder.html" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
	<a href="/myWebProject/BestDealFinder/web/index.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Coaching</a>
    <a href="/myWebProject/BestDealFinder/web/books.jsp"  class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Book</a>
    <a href="/myWebProject/BestDealFinder/web/admin.html" class="w3-right w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" >Admin</a> 
    <!--<a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Link 4</a> -->
  </div>
        
        <div class="form-style-2">
        <div class="form-style-2-heading">Provide Price Details</div>
        <form method ="POST"  id="myAjaxRequestForm" >
            <section class="block remove-top" id="success" style="display:none"></section>
            <label for="courseId">Select a course </label>
            <select class="select-field" required id="courseId"  name="courseId">
                <option value="">--Select Course--</option>   
                <%while(couseList.next()){ %>
                 <option value="<%=couseList.getString(1)%>"><%= couseList.getString(2)%></option>
               <% } %>
            </select>
            <%
           ResultSet instiutionList=statement.executeQuery("select institutionId,instiitution_name from world.institution order by instiitution_name"); 
           %>
            <br><br>
            <label for="institutionid">Select a Institution</label>
            <select class="select-field" required id="institutionid"  name="institutionid">
                <option value="">--Select Institution--</option>   
                <%while(instiutionList.next()){%>
                 <option value="<%=instiutionList.getString(1)%>"><%= instiutionList.getString(2)%></option>
               <% } %>
            </select>
            <br><br>
            <label for="price">Price</label>
            <input required  class="input-field" minlength="1" maxlength="50" type="number" id="price" name="price"/>
            <br><br>
            <!--<input id="myButton" type="button" value="Back" onclick="window.location.href='/myWebProject/BestDealFinder/web/inputcourse.jsp'" />-->
            
            <input id="myButton" type="submit" value="Submit" />
        </form>
             <br><br>
            <input id="myButton" type="button" value="Back" onclick="window.location.href='/myWebProject/BestDealFinder/web/inputcourse.jsp'" />
            
      </div>   
    </body>

</html>

