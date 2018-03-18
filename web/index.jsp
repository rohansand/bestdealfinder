<%-- 
    Document   : index
    Created on : Feb 25, 2018, 7:01:54 PM
    Author     : 7017
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@include file="dataconnection.jsp"%> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="style.css">
        <title>Best Deal Welcome Page</title>
        <%@include file="header.jsp"%> 
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
                  var priceFrom = $("input#priceFrom").val(); 
                  var priceTo=$("input#priceTo").val(); 
                  var courseId=$("#courseId option:selected").val(); 
                  var sortBy=$("#sortBy option:selected").val();
                  var dataVal= "priceFrom=" + priceFrom + "&priceTo=" + priceTo +"&courseId="+ courseId +"&sortBy="+sortBy;

                  var url="/myWebProject/BestDealFinder/web/response.jsp";
                   $.ajax({
                      type: "POST",
                      url: url,
                      data: dataVal,
                      success: function(data) {

                               $("#tbody tr").remove();
                              if(data.length==0){
                                  //alert("No Data Found");
                                  $("#tbody tr").remove();     
                                  var trVal="<tr><td>No Data found</td></tr>";    
                                  $("#tbody").append(trVal); 
                              }
                              $("#customers").css('display', 'block'); 
                              for(var i=0;i<data.length;i++)
                              {
                                  var address="http://"+data[i]["INSTITUTION_WEBSITE"];
                                  var number =   data[i]["PRICE"];
                                  var tr="<tr>";
                                  var td1="<td>"+data[i]["INSTIITUTION_NAME"]+"</td>";
                                  var td2="<td>"+number+"</td>";
                                  var td3="<td>"+data[i]["INSTITUTION_ADDRESS"]+"</td>";
                                  var td4="<td><a href="+address+" target='_blank'>"+data[i]["INSTITUTION_WEBSITE"]+"</a></td>";
                                  var td5="<td>"+data[i]["INSTITUTION_CONTACTNO"]+"</td></tr>";
                                 $("#tbody").append(tr+td1+td2+td3+td4+td5); 

                              }    
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
    <h1 style="text-align:center;">Coaching</h1>
    <div>
    <form method ="POST"  id="myAjaxRequestForm" >
        <label>Select a course</label>
        <select required id="courseId"  name="courseId">
                <option value="">--Select Course--</option>   
             <%  while(couseList.next()){ %>
                <option value="<%=couseList.getString(1)%>"><%= couseList.getString(2)%></option>
            <% } %>
        </select>
        
        <label for="priceFrom"> Price Range From : </label>
        <input required  type="number"  id="priceFrom" name="priceFrom"/>
        <label for="priceTo"> To : </label>
        <input required  type="number"  id="priceTo" name="priceTo"/>
        <label>Sort By: </label>
        <select id="sortBy" name="sortBy">
            <option value="ASC">ASC</option>   
            <option value="DESC">DESC</option> 
        </select>
        
          <input id="myButton" type="submit" value="Submit" />
    </form>
 </div >      
   <br><br>
<div >
<table id="customers" style="display:none;">
    <tr>
        <th>Institution Name</th>
        <th>Price</th>
        <th>Address</th>
        <th>Web Site</th>
        <th>Contact No</th>
  </tr>

<tbody id="tbody">
</tbody>
</table>
 </div>
    
  
 

</body>
</html>
