<%-- 
    Document   : dataconnection
    Created on : Mar 3, 2018, 5:52:35 PM
    Author     : 7017
--%>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String password = "admin";
String userid = "root";
try {
    Class.forName(driver);
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}
Connection connection = null;
Statement statement = null;

 connection = DriverManager.getConnection(connectionUrl,userid,password); 
 statement= connection.createStatement(); 
%>
