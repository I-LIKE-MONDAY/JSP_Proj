<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#com-login').on('click', function () {
                const frm = $('#frm');
                if ($('#customer_email').val() == '') {
                    alert('이메일을 입력하세요');
                }
                else if ($('#customer_pw').val() == '') {
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
<main class="container mt-5">
    <div class="row">
        <h2 class="text-center">로그인</h2>
        <form action="login_process.jsp" method="post" id="frm">
            <div class="col-sm-6 mx-auto">
                <div class="form-floating my-3">
                    <input type="email" class="form-control" id="customer_email" name="customerEmail" placeholder="이메일을 입력하세요">
                    <label for="customer_email">이메일 주소</label>
                </div>
                <div class="form-floating my-3">
                    <input type="password" class="form-control" id="customer_pw" name="customerPw" placeholder="비밀번호를 입력하세요">
                    <label for="customer_pw">비밀번호</label>
                </div>
                <div class="" style="text-align:center;">
                    <label class="" for="comYn-y">사업자 회원</label>
                    <input name="comYn" id="comYn-y" type="radio" value="Y">
                    <label class="ms-5" for="comYn-n">개인 회원</label>
                    <input name="comYn" id="comYn-n" type="radio" value="N">
                </div>
                <div class="d-grid">
                    <button type="button" class="form-floating my-3 btn btn-light" id="com-login">로그인</button>
                </div>
                <div class="d-grid">
                    <button type="button" class="form-floating my-3 btn btn-light" id="btn-back">돌아가기</button>
                </div>
            </div>
        </form>
    </div>
</main>
</body>
</html>
