<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>글 수정 페이지</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <%
        request.setCharacterEncoding("utf-8");

        String boardIdx = request.getParameter("boardIdx");
        String customerNickname = request.getParameter("customerNickname");
        int stayCost = 0;
        String stayOption = request.getParameter("stayOption");
        String stayContents = request.getParameter("stayContents");
        String hitCnt = request.getParameter("hitCnt");
        String boardCreateDt = "";
        String boardUpdateDt = "";

    %>
    <script>
        $(document).ready(function () {
            $('#btn-back').on('click', function () {
                history.back();
            });

            $('#btn-update').on('click', function () {
                <%--location.href="sBoardUpdate_process.jsp?boardIdx=<%=boardIdx%>";--%>
                const frm = $("#frm");
                frm.submit();
            });
        });
    </script>
</head>
<body>


<%@ include file="sDbconn.jsp"%>

<%
    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;

    try {
        conn = DriverManager.getConnection(url, uid, upw);

        String sql = "SELECT board_idx, customer_nickname, stay_contents, stay_cost, stay_option, board_create_dt, hit_cnt FROM board WHERE board_idx = ? ";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, boardIdx);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            boardIdx = rs.getString("board_idx");
            customerNickname = rs.getString("customer_nickname");
            stayContents = rs.getString("stay_contents");
            stayCost = rs.getInt("stay_cost");
            stayOption = rs.getString("stay_option");
            boardCreateDt = rs.getString("board_create_dt");
            hitCnt = rs.getString("hit_cnt");

        }
    }
    catch (SQLException e) {
        out.println("SQLException : " + e.getMessage());
    }
    finally {
        if (rs != null) {
            rs.close();
        }
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>


<%-- 헤더, 푸터 파일 가져와서 사용 --%>
<%@ include file="header.jsp"%>

<main class="container mt-5">
    <div class="row">
        <form action="sBoardUpdate_process.jsp?boardIdx=<%=boardIdx%>" method="post" id="frm">
            <div class="col-sm">
                <%--  업체명  --%>
                <div class="row my-3">
                    <div class="col-sm">
                        <label for="customer-nickname" class="form-label">업체명 : </label>
                        <input type="text" class="form-control" id="customer-nickname" name="customerNickname" value="<%=customerNickname%>" disabled>
                    </div>
                </div>
                <div class="row my-3">
                    <div class="col-sm">
                        <label for="stay-option" class="form-label">옵션 : </label>
                        <input type="text" class="form-control" id="stay-option" name="stayOption" value="<%=stayOption%>" placeholder="옵션">
                    </div>
                </div>
                <div class="row my-3">
                    <%--  1박 금액  --%>
                    <div class="col-sm">
                        <label for="stay-cost" class="form-label">1박 금액 : </label>
                        <input type="text" class="form-control text-end" id="stay-cost" name="stayCost" placeholder="금액을 입력하세요" value="<%=stayCost%>">
                    </div>
                    <%--  조회수  --%>
                    <div class="col-sm">
                        <label for="hit-cnt" class="form-label">조회수 : </label>
                        <input type="text" class="form-control text-end" id="hit-cnt" name="hitCnt" value="<%=hitCnt%>" disabled>
                    </div>
                    <%--   등록 날짜  --%>
                    <div class="col-sm">
                        <label for="board-create-dt" class="form-label">등록 날짜 : </label>
                        <input type="text" class="form-control text-end" id="board-create-dt" name="boardCreateDt" value="<%=boardCreateDt%>" disabled>
                    </div>
                </div>
                <div class="row my-3">
                    <%--  글 내용  --%>
                    <div class="col-sm">
                        <label for="stay-contents" class="form-label">글 내용 : </label>
                        <textarea class="form-control" name="stayContents" id="stay-contents" rows="10" placeholder="내용을 입력하세요."><%=stayContents%></textarea>
                    </div>
                </div>
                <div class="row my-3">
                    <div class="col-sm">
                        <button class="btn btn-secondary" type="button" id="btn-back">목록으로</button>
                    </div>
                    <div class="col-sm d-flex justify-content-end">
                        <%
                            if(customerNicknameSession != null && customerNicknameSession.equals(customerNickname)){
                        %>
                        <button class="btn btn-warning me-2" id="btn-update" type="button">수정 완료</button>
                        <%
                        } else {
                        %>

                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </form>
    </div>
</main>

<%@ include file="footer.jsp"%>
</body>
</html>
