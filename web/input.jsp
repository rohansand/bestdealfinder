<%-- 
    Document   : input.jsp
    Created on : Mar 15, 2018, 9:53:37 PM
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
                   var institutionName= $("input#institutionName").val();
                   var description= $("input#description").val(); 
                   var address= $("input#address").val(); 
                   var website=  $("input#website").val();
                   var contactphone=  $("input#contactphone").val();
                   var dataVal= "institutionName=" + institutionName + "&description=" + description +"&address="+ address +"&website="+website+"&contactphone="+contactphone;

                   var url="/myWebProject/BestDealFinder/web/insertdata.jsp";
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
        <div class="form-style-2-heading">Provide Institution Details</div>
        <form method ="POST"  id="myAjaxRequestForm" >
            <label for="institutionName">Institution Name </label>
            <input required  minlength="1" maxlength="100" type="text" class="input-field"  name="institutionName" id="institutionName" value=""  />
            <br><br>
            <label for="description">Description </label>
            <input required minlength="1" maxlength="250" type="text" class="input-field" name="description" id="description" value=""  />
            <br><br>
            <label for="address"> Address </label>
            <input required minlength="1" maxlength="250" type="text" class="input-field" name="address" id="address" value="" />
            <br><br>
            <label for="website"> Website </label>
            <input required minlength="1" maxlength="250" type="URL" class="input-field" name="website" id="website" value="" />
            <br><br>
            <label for="contactphone"> Contact Phone Number</label>
            <input required  maxlength="15"type="number" class="input-field"  name="contactphone" id="contactphone" value="" />
            <br><br>

             <input id="myButton" type="submit" value="Submit" />
             <input id="myButton" type="button" value="Next" onclick="window.location.href='/myWebProject/BestDealFinder/web/inputcourse.jsp'" />
            <input type="hidden" value="institute"/>
        </form>
        </div>
    </body>
</html>
