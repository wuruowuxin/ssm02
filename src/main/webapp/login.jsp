<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>房产信息查询系统</h1>
	<c:if test="${not empty msg }">
		<script type="text/javascript">
			alert("${msg.message}");
		</script>
		<!-- 清理session里面的数据 -->
		<c:remove var="msg" scope="session"/>
	</c:if>
	<form action="${ctx }/users/login" method="post">
		请输入身份证号码:<input name="cardId"><br>
		请输入密码:<input name="password"><br>
		<input type="submit" value="登录"><a href="${ctx }/register.jsp">注册</a>
	</form>
</body>
</html>