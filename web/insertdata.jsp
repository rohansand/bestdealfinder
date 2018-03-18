<%-- 
    Document   : response
    Created on : Feb 25, 2018, 7:20:47 PM
    Author     : 7017
--%>

<%@page language="java" contentType="application/json" pageEncoding="UTF-8"%>
 <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%@include file="dataconnection.jsp"%> 
<%
    
    String insertQuery="";
    

try{

    String institutionName=request.getParameter("institutionName");
    String description=request.getParameter("description");
    String address=request.getParameter("address");
    String website=request.getParameter("website");
    String contactNo= request.getParameter("contactphone");
    String sql="INSERT INTO world.INSTITUTION (INSTIITUTION_NAME , INSTITUTION_DESCRIPTION, INSTITUTION_ADDRESS,INSTITUTION_WEBSITE,INSTITUTION_CONTACTNO) "+
             " VALUES ('"+institutionName+"','"+description+"','"+address+"','"+website+"','"+contactNo+"')";
    System.out.println(sql);
    statement.executeUpdate(sql);
    out.println("Data Inserted Successfully");
        
    //connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
   