<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#com-join').on('click', function () {
                const frm = $('#frm');
                if ($('#customer_email').val() == '') {
                    alert('이메일을 입력하세요');
                }
                else if ($('#customer_pw').val() == '') {
                    alert('비밀번호를 입력하세요');
                }
                else if ($('#customer_pw').val() != $('#customer_pw2').val()) {
                    alert('비밀번호가 일치하지 않습니다.');
                }
                else if ($('#customer_nickname').val() == '') {
                    alert('닉네임을 입력하세요');
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
<main>
    <div class="container">
        <div class="row-cols-2">
            <div class="col mx-auto">
                <h2 class="text-center">회원가입</h2>
                <form action="join_process.jsp" method="post" id="frm" class="mx-5 container-fluid">
                    <div class="mx-auto">
                        <div class="form-floating my-4">
                            <label for="customer_email" class="form-label">이메일 주소</label>
                            <input type="email" class="form-control" id="customer_email" name="customerEmail" placeholder="이메일을 입력하세요">
                            <%--                    <button type="button" class="btn btn-success">중복 확인</button>--%>
                        </div>
                        <div class="form-floating my-4">
                            <label for="customer_pw">비밀번호</label>
                            <input type="password" class="form-control" id="customer_pw" name="customerPw" placeholder="비밀번호를 입력하세요">
                        </div>
                        <div class="form-floating my-4">
                            <label for="customer_pw2">비밀번호 확인</label>
                            <input type="password" class="form-control" id="customer_pw2" name="customerPw" placeholder="비밀번호를 입력하세요">
                        </div>
                        <div class="form-floating my-4">
                            <label for="customer_nickname">닉네임(사업자의 경우 사업자명)</label>
                            <input type="text" class="form-control" id="customer_nickname" name="customerNickname" placeholder="닉네임을 입력하세요">
                        </div>
                        <div class="me-5" style="text-align:center;">
                            <label class="me-5" for="comYn-y" style="margin-right: 20px">사업자 회원</label>
                            <input name="comYn" id="comYn-y" type="radio" value="Y" class="me-5">
                            <label class="ms-5" for="comYn-n" style="margin: 20px; margin-left: 20px">개인 회원</label>
                            <input class="ms-5" name="comYn" id="comYn-n" type="radio" value="N">
                        </div>
                        <div class="form-floating my-3 text-center">
                            <button type="button" class="btn btn-lg btn-success" id="com-join" style="WIDTH: 300pt">회원가입</button>
                        </div>
                        <div class="form-floating my-3 text-center">
                            <button type="button" class="btn btn-lg btn-light" id="btn-back" style="WIDTH: 300pt">돌아가기</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</main>
</body>
</html>
