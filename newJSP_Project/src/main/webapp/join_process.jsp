<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="sDbconn.jsp"%>

<%
  // 매개변수 받아주는 부분
  request.setCharacterEncoding("utf-8");

  String customerEmail = request.getParameter("customerEmail");
  String customerPw = request.getParameter("customerPw");
  String customerNickname = request.getParameter("customerNickname");
  String comYn = request.getParameter("comYn");


  Connection conn = null;

%>
<%
  PreparedStatement pstmt = null;

  String query = "INSERT INTO customers (customer_email, customer_pw, customer_nickname, customer_joinDate, com_yn) ";
  query += "VALUES (?, ?, ?, now(), ?) ";

  try {
    conn = DriverManager.getConnection(url, uid, upw);
    pstmt = conn.prepareStatement(query);
    pstmt.setString(1, customerEmail);
    pstmt.setString(2, customerPw);
    pstmt.setString(3, customerNickname);
    pstmt.setString(4, comYn);
    pstmt.executeUpdate();
  }
  catch (SQLException e) {
    out.println("SQLException : " + e.getMessage());
  }
  finally {
    if (pstmt != null) {
      pstmt.close();
    }
    if (conn != null) {
      conn.close();
    }
  }
  response.sendRedirect("sBoardList.jsp");
%>
