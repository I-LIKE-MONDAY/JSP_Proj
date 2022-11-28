<%@ page import="java.sql.*" %>

<%
  Connection conn = null;

  String url = "jdbc:mysql://localhost:3306/mydb";
  String user = "root";
  String passwd = "1234";

  Class.forName("com.mysql.cj.jdbc.Driver");
  conn = DriverManager.getConnection(url, user, passwd);
%>