<%--
  Created by IntelliJ IDEA.
  User: AHN
  Date: 2022-11-24
  Time: 오후 1:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
거래처 로그인 화면

<form action="login" method="post">
    <input type="text" name="cacId" id="cacId">
    <input type="password" name="cacPw" id="cacPw">
    <input type="submit" value="로그인">
</form>
<input type="button" onclick="location.href='add'" value="기업등록">

</body>
</html>
