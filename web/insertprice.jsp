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
try{
    Integer  courseId = Integer.valueOf(request.getParameter("courseId"));	
    Integer  institutionid=Integer.valueOf(request.getParameter("institutionid"));
    String price=request.getParameter("price");
    String sql="INSERT INTO world.course_institution (IDCOURSE , INSTITUTIONID,PRICE) "+
        " VALUES ("+courseId+","+institutionid+",'"+price+"')";
    System.out.println(sql);
    statement.executeUpdate(sql);
   
    out.println("Success");
        
    //connection.close();
} catch (Exception e) {
    out.println("Error"+e);
        
    e.printStackTrace();
}
%>
   