<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>


<%@ include file="sDbconn.jsp"%>
<%
    request.setCharacterEncoding("utf-8");

    String boardIdx = request.getParameter("boardIdx");
    int stayCost = Integer.parseInt(request.getParameter("stayCost"));
    String stayOption = request.getParameter("stayOption");
    String stayContents = request.getParameter("stayContents");

%>

boardIdx : <%=boardIdx%>
<br>
stayCost : <%=stayCost%>
<br>
stayOption : <%=stayOption%>
<br>
stayContents : <%=stayContents%>

<%
    Connection conn = null;
    conn = DriverManager.getConnection(url, uid, upw);

    String query = "UPDATE board SET stay_cost = ?, stay_contents = ?, stay_option = ?, board_update_dt = now() ";
    query += "WHERE board_idx = ? ";

        PreparedStatement pstmt = null;

    try {
        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, stayCost);
        pstmt.setString(2, stayContents);
        pstmt.setString(3, stayOption);
        pstmt.setString(4, boardIdx);
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