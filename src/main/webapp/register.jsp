<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
<script type="text/javascript" src="${ctx }/static/js/jquery.js"></script>
</head>
<body>
	<h1>账号注册</h1>
	${sucRegister }============
	<c:if test="${not empty sucRegister }">
		<script type="text/javascript">
			if(confirm('注册已成功,现在去登录吗?')){
				window.location = '${ctx}';
			}
		</script>
	</c:if>
	<form action="${ctx }/users/register" method="post">
		
		身份证号:	<input name="cardId"><br>
		用户名:	<input name="name"><br>
		密码:		<input name="password" type="password"><br>
		确认密码:	<input id="rePassword" type="password"><br>
		<input type="button" id="registerBtn" value="注册">
	</form>
	<button onclick="goBack()">返回</button>
	
	<script type="text/javascript">
		$('#registerBtn').click(function(){
			// 1获取身份证号
			var cardId = $('input[name=cardId]').val();
			var name = $('input[name=name]').val();
			var password = $('input[name=password]').val();
			var rePassword = $('rePassword').val();
			// 全数字的18位
			var reg = /^\d{18}$/;
			if(!reg.test(cardId)){
				return;
			}
			if(name.length > 25){
				alert('用户名长度过长');
				return;
			}
			if(password.length < 6){
				alert('密码长度不足6位');
				return;
			}
			if(password != rePassword){
				alert('两次输入密码不一致,请重新输入');
				return;
			}
			
			// 1先验证 身份证号码是否被使用了,使用ajax进行查询验证
			$.ajax({
				url:'${ctx}/users/isUsed'+cardId,
				type:'get',
				success:function(data){
					if(data.code == 1){
						alert('该账号已经被注册,请换一个');
						return;
					}
				}
			})
			
			// 2如果一路通畅,意味着可以向后台提交了
			$('form').submit();
		})
		function goBack(){
			window.history.go(-1);
		}
	</script>
</body>
</html>