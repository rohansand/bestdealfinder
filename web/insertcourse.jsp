<%-- 
    Document   : insprice.jsp
    Created on : Mar 17, 2018, 12:39:12 PM
    Author     : user
--%>

<%@page language="java" contentType="application/json" pageEncoding="UTF-8"%>
 <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%@include file="dataconnection.jsp"%> 
<%
    
    String insertQuery="";
    

try{

    String course=request.getParameter("course");
    String coursedescription=request.getParameter("coursedescription");
    String sql="INSERT INTO world.course (COURSENAME , COURSEDESCRIPTION) "+
             " VALUES ('"+course+"','"+coursedescription+"')";
    System.out.println(sql);
    statement.executeUpdate(sql);
    out.println("Data Inserted Successfully");
        
    //connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
   