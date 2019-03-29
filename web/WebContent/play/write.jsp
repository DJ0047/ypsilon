<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@page import="report.model.Play"%>
<html>
<%
	request.setCharacterEncoding("utf-8");
	String getDate = request.getParameter("getDate");
	String pathValue = "C:\\workspace2\\web\\ReportModel1\\web\\WebContent\\image\\";
	String fileName = request.getParameter("fileName");
%>
<style>
fieldset {
	width: 400px;
	background: white;
}
</style>

<head>
<meta charset="EUC-KR">
<title>WELCOME TO MY PL@YGROUND</title>
</head>

<script>
	function saveReview(btnValue) {
		var obj = document.writeFrm;
		if (btnValue == '닫기') {
			obj.action = 'calendar.jsp';
			obj.submit();
		} else if (btnValue == '저장') {
			obj.action = 'writeProcess.jsp?getDate=<%=getDate%>&fileName=<%=fileName%>';
			obj.submit();
		}
	}
</script>
<body bgcolor="F0F0F0">
Session<%=request.getSession().getAttribute("fileImg") %>
	<form action="" method="post" name="writeFrm">
		<div align="center">
			<fieldset>
				<img src="/web/image/<%=fileName%>" width="150" height="200" />
			</fieldset>
			<br>
			<fieldset>
				<legend style="background: white">정보</legend>
				<table>
					<tr>
						<td>제목:</td>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<td>극장/장소:</td>
						<td><input type="text" name="location"></td>
					</tr>
					<tr>
						<td>좌석:</td>
						<td><input type="text" name="seat"></td>
					</tr>
					<tr>
						<td>가격:</td>
						<td><input type="text" name="price"></td>
					</tr>
				</table>
			</fieldset>
			<br>
			<fieldset>
				<legend style="background: white">리뷰/메모</legend>
				<textarea name="review" rows="5" cols="50"></textarea>
			</fieldset>
		</div>

		<input type="button" value="저장" onclick="saveReview(this.value)">
		<input type="button" value="닫기" onclick="saveReview(this.value)">
	</form>
</body>
</html>