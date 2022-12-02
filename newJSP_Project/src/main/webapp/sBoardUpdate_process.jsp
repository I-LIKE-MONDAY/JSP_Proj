<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="sDbconn.jsp"%>

<%
    request.setCharacterEncoding("utf-8");

    int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));
    String stayCost = request.getParameter("stayCost");
//    String stayOption = request.getParameter("stayOption");
    String stayContents = request.getParameter("stayContents");

    Connection conn = null;
    PreparedStatement pstmt = null;

    String query = "UPDATE board SET stay_cost = ?, stay_contents = ?, update_dt = now() ";
    query += "WHERE boardIdx = ? ";
    try {
        conn = DriverManager.getConnection(url, uid, upw);
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, stayCost);
        pstmt.setString(2, stayContents);
        pstmt.setInt(3, boardIdx);
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