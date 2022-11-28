<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>글쓰기 페이지</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#btn-submit').on('click', function () {
                const frm = $('#frm');

                if ($('#title').val() == '') {
                    alert('제목을 입력하세요');
                }
                else if ($('#user-id').val() == '') {
                    alert('아이디를 입력하세요');
                }
                else if ($('#pwd').val() == '') {
                    alert('비밀번호를 입력하세요');
                }
                else {
                    frm.submit();
                }
            });

            $('#btn-back').on('click', function () {
                history.back();
            });


        });
    </script>
</head>
<body>

<%-- 헤더, 푸터 파일 가져와서 사용 --%>
<%@ include file="header.jsp"%>

<main class="container mt-5">
    <div class="row">
        <div class="col-sm-6 mx-auto">
            <form action="sBoardWrite_process.jsp" method="post" id="frm">
                <div class="my-3">
                    <label class="form-label" for="title">글 제목 : </label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
                </div>
                <div class="my-3">
                    <label class="form-label" for="user-id">아이디 : </label>
                    <input type="text" class="form-control" id="user-id" name="userId" placeholder="아이디를 입력하세요">
                </div>
                <div class="my-3">
                    <label class="form-label" for="pwd">비밀번호 : </label>
                    <input type="password"class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요">
                </div>
                <div class="my-3">
                    <label class="form-label" for="contents">글 내용 : </label>
                    <textarea class="form-control" name="contents" id="contents" rows="10" placeholder="내용을 입력하세요"></textarea>
                </div>
                <div class="d-grid gap-2 my-3">
                    <button class="btn btn-primary" type="button" id="btn-submit">글쓰기</button>
                    <button class="btn btn-secondary" type="button" id="btn-back">돌아가기</button>
                </div>
            </form>
        </div>
    </div>
</main>

<%@ include file="footer.jsp"%>
</body>
</html>
