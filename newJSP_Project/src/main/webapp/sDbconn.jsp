<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  String url = "jdbc:mysql://localhost:3306/mydb";
  String uid = "root";
  String upw = "1234";

  Class.forName("com.mysql.cj.jdbc.Driver");
%>