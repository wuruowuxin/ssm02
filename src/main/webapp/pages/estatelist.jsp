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
用户名:${users.name } <a href="${ctx }/users/logout">退出</a><br>
<a href="${ctx }/estate/index">房产信息查询</a>
<div>
	<h2>欢迎使用房产信息查询系统</h2>
	<form action="${ctx }/estate/page" method="post">
		查询类型:<select name="selectType">
			<option value="1" <c:if test="${type == 1 }">selected="selected"</c:if>>用户名</option>
			<option value="2" <c:if test="${type == 2 }">selected="selected"</c:if>>身份证</option>
		</select>
		<input name="inputStr" value="${inputStr }">
		<input type="button" value="查找" id="selectBtn">
	</form>
	<table>
		<thead>
			<tr>
				<td>序号</td>
				<td>项目名称</td>
				<td>产权人</td>
				<td>身份证号</td>
				<td>房屋类型</td>
				<td>使用面积</td>
				<td>建造时间</td>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${page.list }" var="obj" varStatus="i">
				<tr>
					<td>${i.index + 1 }</td>
					<td>${obj.projectName }</td>
					<td>${obj.users.name }</td>
					<td>${obj.users.cardId }</td>
					<td>${obj.houseType }</td>
					<td>${obj.area }</td>
					<td>${obj.buildTime }</td>
				</tr>
			</c:forEach>
			<tr>
				<td id="pageId">
					<a href="javascript:;" id="firstPage">首页</a>
					<a href="javascript:;" id="prevPage">《上一页</a>
					<a href="javascript:;" id="nextPage">下一页》</a>
					<a href="javascript:;" id="lastPage">尾页</a>
					到第<input name="inputPageNum" style="width: 15px">页<button id="skipPageBtn">确定</button>
					第${page.pageNum }页/共${page.pages }页(${page.total }条)
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div>
	<form action="${ctx }/estate/page" id="hiddenForm" method="post">
		<input type="hidden" name="pageNum"><br>
		<input type="hidden" name="pageSize" value="2"><br>
		<input type="hidden" name="type"><br>
		<input type="hidden" name="inputValue"><br>
	</form>
</div>
<script type="text/javascript">
	$('#firstPage').click(function(){
		// 1更新当前页码
		var pageNum = 1;
		// 2获取选择查询的类型
		var selectType = $('select[name=selectType]').val();
		// 3填写的值
		var inputStr = $('input[name=inputStr]').val();
		$('input[name=pageNum]').val(pageNum);
		$('input[name=type]').val(selectType);
		$('input[name=inputValue]').val(inputStr);
		$('form#hiddenForm').submit();
	})
	
	$('#prevPage').click(function(){
		// 1更新当前页码
		var pageNum = '${page.pageNum-1}';
		// 2获取选择查询的类型
		var selectType = $('select[name=selectType]').val();
		// 3填写的值
		var inputStr = $('input[name=inputStr]').val();
		$('input[name=pageNum]').val(pageNum);
		$('input[name=type]').val(selectType);
		$('input[name=inputValue]').val(inputStr);
		$('form#hiddenForm').submit();
	})
	
	$('#nextPage').click(function(){
		// 1更新当前页码
		var pageNum = '${page.pageNum+1}';
		// 2获取选择查询的类型
		var selectType = $('select[name=selectType]').val();
		// 3填写的值
		var inputStr = $('input[name=inputStr]').val();
		$('input[name=pageNum]').val(pageNum);
		$('input[name=type]').val(selectType);
		$('input[name=inputValue]').val(inputStr);
		$('form#hiddenForm').submit();
	})
	
	$('#lastPage').click(function(){
		// 1更新当前页码
		var pageNum = '${page.pages}';
		// 2获取选择查询的类型
		var selectType = $('select[name=selectType]').val();
		// 3填写的值
		var inputStr = $('input[name=inputStr]').val();
		$('input[name=pageNum]').val(pageNum);
		$('input[name=type]').val(selectType);
		$('input[name=inputValue]').val(inputStr);
		$('form#hiddenForm').submit();
	})
	
	$('#selectBtn').click(function(){
		// 1更新当前页码
		var pageNum = 1;
		// 2获取选择查询的类型
		var selectType = $('select[name=selectType]').val();
		// 3填写的值
		var inputStr = $('input[name=inputStr]').val();
		$('input[name=pageNum]').val(pageNum);
		$('input[name=type]').val(selectType);
		$('input[name=inputValue]').val(inputStr);
		$('form#hiddenForm').submit();
	})
	
	$('#skipPageBtn').click(function(){
		// 1更新当前页码
		var pageNum = $('input[name=inputPageNum]').val();
		// 2获取选择查询的类型
		var selectType = $('select[name=selectType]').val();
		// 3填写的值
		var inputStr = $('input[name=inputStr]').val();
		$('input[name=pageNum]').val(pageNum);
		$('input[name=type]').val(selectType);
		$('input[name=inputValue]').val(inputStr);
		$('form#hiddenForm').submit();
	})
</script>
</body>
</html>