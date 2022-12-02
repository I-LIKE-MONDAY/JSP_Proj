    <%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="sDbconn.jsp"%>

<%
  // 매개변수 받아주는 부분
  request.setCharacterEncoding("utf-8");

  String customerNickname = request.getParameter("customerNickname");
  String stayCost = request.getParameter("stayCost");
  String stayOption = request.getParameter("stayOption");
  String stayContents = request.getParameter("stayContents");

%>

<%
  Connection conn = null;
  PreparedStatement pstmt = null;

  String query = "INSERT INTO board (customer_nickname, stay_contents, stay_cost, stay_option, board_create_dt) ";
  query += "VALUES (?, ?, ?, ?, now()) ";

  try {
    conn = DriverManager.getConnection(url, uid, upw);
    pstmt = conn.prepareStatement(query);
    pstmt.setString(1, customerNickname);
    pstmt.setString(2, stayContents);
    pstmt.setString(3, stayCost);
    pstmt.setString(4, stayOption);
    pstmt.executeUpdate();
  } catch (SQLException e) {
    out.println("SQLException : " + e.getMessage());
  } finally {
    if (pstmt != null) {
      pstmt.close();
    }
    if (conn != null) {
      conn.close();
    }
  }
  response.sendRedirect("sBoardList.jsp");
%>