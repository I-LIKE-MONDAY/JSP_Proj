<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="sDbconn.jsp"%>

<%
  request.setCharacterEncoding("utf-8");

  int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));

  Connection conn = null;
  PreparedStatement pstmt = null;

  String query = "UPDATE board SET deleted_yn = 'Y' ";
  query += "WHERE board_idx = ? ";
  try {
    conn = DriverManager.getConnection(url, uid, upw);
    pstmt = conn.prepareStatement(query);
    pstmt.setInt(1, boardIdx);
    pstmt.executeUpdate();
  }
  catch (SQLException e) {
    out.println("SQLExceprion : " + e.getMessage());
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