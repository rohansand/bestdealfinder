<%-- 
    Document   : inputprice.jsp
    Created on : Mar 17, 2018, 12:34:57 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                   var course= $("input#course").val();
                   var coursedescription= $("input#coursedescription").val(); 
                  
                   var dataVal= "course=" + course + "&coursedescription=" + coursedescription ;

                   var url="/myWebProject/BestDealFinder/web/insertcourse.jsp";
                    $.ajax({
                       type: "POST",
                       url: url,
                       data: dataVal,
                       success: function(data) {


                       },
                       dataType: "json"
                   }); 



           }); 

       }); 

       </script>    
    </head>
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
        <div class="form-style-2-heading">Provide Course Details</div>
        <form method ="POST"  id="myAjaxRequestForm" >
            <label for="course">Course </label>
            <input required class="input-field" minlength="1" maxlength="50" type="text" name="course" id="course" value=""  />
            <br><br>
            <label for="coursedescription">Course Description</label>
            <input required class="input-field" minlength="1" maxlength="250" type="text" name="coursedescription" id="coursedescription" value=""  />
            <br><br>
           <!-- <input id="myButton" type="button" value="Back" onclick="window.location.href='/myWebProject/BestDealFinder/web/input.jsp'" />-->
            <input id="myButton" align ="center" type="submit" value="Submit" />
           <!-- <input id="myButton" type="button" value="Next" onclick="window.location.href='/myWebProject/BestDealFinder/web/inputprice.jsp'" />-->
        </form>
        <br><br>
        <input id="myButton" type="button" value="Back" onclick="window.location.href='/myWebProject/BestDealFinder/web/input.jsp'" />
        <input id="myButton" type="button" value="Next" onclick="window.location.href='/myWebProject/BestDealFinder/web/inputprice.jsp'" />
       </div>
    </body>

</html>
