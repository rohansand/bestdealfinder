<%-- 
    Document   : response
    Created on : Feb 25, 2018, 7:20:47 PM
    Author     : 7017
--%>

<%@page language="java" contentType="application/json" pageEncoding="UTF-8"%>
 <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="org.json.JSONArray"%>
<%@ page import ="org.json.JSONArray"%>
<%@ page import ="org.json.JSONObject"%>
<%@ page import ="org.json.JSONException"%>
 <%@include file="dataconnection.jsp"%> 
<%
    //ObjectMapper mapper = JacksonHelper.getObjectMapper();
    //ObjectMapper mapper = new ObjectMapper();
    ResultSet priceList=null;
    List<JSONObject> resList = new ArrayList<JSONObject>(); 
try{

    String courseId=request.getParameter("courseId");
    String priceFrom=request.getParameter("priceFrom");
    String priceTo=request.getParameter("priceTo");
    String sortBy=request.getParameter("sortBy");
    priceList=statement.executeQuery("SELECT COURSE.coursename,INST.instiitution_name institutionname,INST.institution_address address,INST.institution_website url,INST.institution_contactno contactno,COURSE_INST.price price "+
    "from "+
    "world.institution INST ,"+
    "world.course_institution COURSE_INST,"+
    "world.course COURSE "+
    "where "+
    "COURSE.idcourse=COURSE_INST.idcourse "+
    "and "+
    "COURSE_INST.institutionId=INST.institutionId and  COURSE.idcourse= "+courseId+" "+
    "and COURSE_INST.price between "+priceFrom+" and  "+priceTo+" "+
    "order by COURSE_INST.price "+sortBy+" ");
    System.out.println("SELECT COURSE.coursename,INST.instiitution_name institutionname,INST.institution_address address,INST.institution_website url,INST.institution_contactno contactno,COURSE_INST.price price "+
    "from "+
    "world.institution INST ,"+
    "world.course_institution COURSE_INST,"+
    "world.course COURSE "+
    "where "+
    "COURSE.idcourse=COURSE_INST.idcourse "+
    "and "+
    "COURSE_INST.institutionId=INST.institutionId and  COURSE.idcourse= "+courseId+" "+
    "and COURSE_INST.price between "+priceFrom+" and  "+priceTo+" "+
    "order by COURSE_INST.price "+sortBy+" ");
    ResultSetMetaData rsMeta = priceList.getMetaData();
      int columnCnt = rsMeta.getColumnCount();
      List<String> columnNames = new ArrayList<String>();
      for(int i=1;i<=columnCnt;i++) {
          columnNames.add(rsMeta.getColumnName(i).toUpperCase());
      }

      while(priceList.next()) { // convert each object to an human readable JSON object
          JSONObject obj = new JSONObject();
          for(int i=1;i<=columnCnt;i++) {
              String key = columnNames.get(i - 1);
              String value = priceList.getString(i);
              System.out.println(key+" ,"+value);
              obj.put(key, value);
          }
          resList.add(obj);
      }       
      out.println(resList);
      //mapper.writeValue(response.getOutputStream(), resList);
      //out.println(mapper.writeValueAsString(resList));
            
    //connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
   