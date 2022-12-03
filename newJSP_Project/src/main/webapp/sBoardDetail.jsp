<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.ibatis.jdbc.Null" %>
<!DOCTYPE html>
<html>
<head>
    <title>상세 페이지</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <%
        request.setCharacterEncoding("utf-8");

        String boardIdx = request.getParameter("boardIdx");
        String customerNickname = request.getParameter("customerNickname");
        int stayCost = 0;
        String stayOption = "";
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
                var del = confirm('게시글을 삭제하시겠습니까?');
                if(del) {
                    location.href="sBoardDelete_process.jsp?boardIdx=<%=boardIdx%>";
                }
                else {
                }
            });

            $('#btn-update').on('click', function () {
                var upt = confirm('게시글을 수정하시겠습니까?');
                if(upt) {
                    location.href="sBoardUpdate.jsp?boardIdx=<%=boardIdx%>&customerNickname=aaaaa";
                }
                else {
                }
            });

            $('#btn-book').on('click', function () {
                var book = confirm('예약하시겠습니까?');
                if(book) {
                    location.href="booking.jsp?boardIdx=<%=boardIdx%>";
                }
                else {
                }
            });
        });
    </script>
</head>
<body>


<%@ include file="sDbconn.jsp"%>
<%@ include file="header.jsp"%>
<%
    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;

    try {
        conn = DriverManager.getConnection(url, uid, upw);

        String sql = "UPDATE board SET hit_cnt = hit_cnt + 1 WHERE board_idx = ? ";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, boardIdx);
        pstmt.executeUpdate(); // 현재 sql문데이터 한번 날려주고

        sql = "SELECT board_idx, customer_nickname, stay_contents, stay_cost, stay_option, board_create_dt, hit_cnt FROM board WHERE board_idx = ? ";

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


<main class="container mt-5">
    <div class="row">
        <div class="col-sm">
            <%--  업체명  --%>
            <div class="row my-3">
                <div class="col-sm">
                    <label for="customer-nickname" class="form-label">업체명 : </label>
                    <input type="text" class="form-control" id="customer-nickname" name="customerNickname" value="<%=customerNickname%>" readonly placeholder="업체명">
                </div>
            </div>
            <div class="row my-3">
                <div class="col-sm">
                    <label for="stay-option" class="form-label">옵션 : </label>
                    <input type="text" class="form-control" id="stay-option" name="stayOption" value="<%=stayOption%>" readonly placeholder="옵션">
                </div>
            </div>
            <div class="row my-3">
                <%--  1박 금액  --%>
                <div class="col-sm">
                    <label for="stay-cost" class="form-label">1박 금액 : </label>
                    <input type="text" class="form-control text-end" id="stay-cost" name="stayCost" value="<%=stayCost%>" readonly placeholder="1박 금액">
                </div>
                <%--  조회수  --%>
                <div class="col-sm">
                    <label for="hit-cnt" class="form-label">조회수 : </label>
                    <input type="text" class="form-control text-end" id="hit-cnt" name="hitCnt" value="<%=hitCnt%>" readonly placeholder="조회수">
                </div>
                <%--   등록 날짜  --%>
                <div class="col-sm">
                    <label for="board-create-dt" class="form-label">등록 날짜 : </label>
                    <input type="text" class="form-control text-end" id="board-create-dt" name="boardCreateDt" value="<%=boardCreateDt%>" readonly placeholder="등록 날짜">
                </div>
            </div>
            <div class="row my-3">
                <%--  글 내용  --%>
                <div class="col-sm">
                    <label for="stay-contents" class="form-label">글 내용 : </label>
                    <textarea class="form-control" name="stayContents" id="stay-contents" rows="10" placeholder="내용을 입력하세요" readonly><%=stayContents%></textarea>
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
                    <button type="button" class="btn btn-success me-2" id="btn-update">수정하기</button>
                    <button class="btn btn-danger" id="btn-delete" type="button">삭제하기</button>
                    <%
                    } else if (customerNicknameSession != null){
                    %>
                    <button class="btn btn-primary me-2" id="btn-book" type="button">예약하기</button>
                    <%
                        }
                    else {
                        %>
                    <label class="text-center me-2 mt-2">로그인 후 예약이 가능합니다.</label>
                    <button class="btn btn-primary me-2" id="btn-book" disabled>예약하기</button>
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
