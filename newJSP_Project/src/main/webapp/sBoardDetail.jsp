<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.ibatis.jdbc.Null" %>
<!DOCTYPE html>
<html>
<head>
    <title>상세 페이지</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <%
        request.setCharacterEncoding("utf-8");

        int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));
        String customerNickname = request.getParameter("customerNickname");
        String stayCost = request.getParameter("stayCost");
        String stayOption = request.getParameter("stayOption");
        String stayContents = request.getParameter("stayContents");
        int hitCnt = 0;
        String boardCreateDt = "";

    %>
    <script>
        $(document).ready(function () {
            $('#btn-back').on('click', function () {
                history.back();
            });

            $('#btn-delete').on('click', function () {
                var rlt = confirm('게시글을 삭제하시겠습니까?');
                if(rlt) {
                    location.href="sBoardDelete_process.jsp?boardIdx=<%=boardIdx%>";
                }
                else {
                }
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

        String sql = "UPDATE board SET hit_cnt = hit_cnt + 1 WHERE board_idx = ? ";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, boardIdx);
        pstmt.executeUpdate(); // 현재 sql문데이터 한번 날려주고

        sql = "SELECT board_idx, customer_nickname, stay_contents, stay_cost, stay_option, board_create_dt, hit_cnt FROM board WHERE board_idx = ? ";

        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, boardIdx);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            boardIdx = rs.getInt("board_idx");
            customerNickname = rs.getString("customer_nickname");
            stayContents = rs.getString("stay_contents");
            stayCost = rs.getString("stay_cost");
            stayOption = rs.getString("stay_option");
            boardCreateDt = rs.getString("board_create_dt");
            hitCnt = rs.getInt("hit_cnt");
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
        <div class="col-sm">
            <%--  업체명  --%>
            <div class="row my-3">
                <div class="col-sm">
                    <label for="customer-nickname" class="form-label">업체명 : </label>
                    <input type="text" class="form-control" id="customer-nickname" name="customerNickname" value="<%=customerNickname%>" readonly>
                </div>
            </div>
            <div class="row my-3">
                <%--  1박 금액  --%>
                <div class="col-sm">
                    <label for="stay-cost" class="form-label">1박 금액 : </label>
                    <input type="text" class="form-control text-end" id="stay-cost" name="stayCost" value="<%=stayCost%>" readonly>
                </div>
                <%--  조회수  --%>
                <div class="col-sm">
                    <label for="hit-cnt" class="form-label">조회수 : </label>
                    <input type="text" class="form-control text-end" id="hit-cnt" name="hitCnt" value="<%=hitCnt%>" readonly>
                </div>
                <%--   등록 날짜  --%>
                <div class="col-sm">
                    <label for="board-create-dt" class="form-label">등록 날짜 : </label>
                    <input type="text" class="form-control text-end" id="board-create-dt" name="boardCreateDt" value="<%=boardCreateDt%>" readonly>
                </div>
            </div>
            <div class="row my-3">
                <%--  글 내용  --%>
                <div class="col-sm">
                    <label for="stay-contents" class="form-label">글 내용 : </label>
                    <textarea class="form-control" name="stayContents" id="stay-contents" rows="10" readonly><%=stayContents%></textarea>
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
                    <a href="sBoardUpdate.jsp?boardIdx=<%=boardIdx%>" class="btn btn-warning me-2" id="btn-update">수정하기</a>

                    <a class="btn btn-danger" id="btn-delete">삭제하기</a>
                    <%
                    } else {
                    %>

                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp"%>
</body>
</html>
