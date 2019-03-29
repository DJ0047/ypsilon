<%@page import="report.dao.PlayDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@page import="report.model.Play"%>
<html>
<%
	request.setCharacterEncoding("utf-8");
	String getDate = request.getParameter("getDate");
	String pathValue = "C:\\workspace2\\web\\ReportModel1\\web\\WebContent\\image";
	Play play = PlayDao.searchPlay(getDate);
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
		} else if (btnValue == '수정') {
			obj.action = 'modifyProcess.jsp?getDate=<%=getDate%>&fileName=<%=play.getFileName()%>';
			obj.submit();
		} else if (btnValue == '삭제') {
			obj.action = 'deleteProcess.jsp?getDate=<%=getDate%>';
			obj.submit();
		}
	}
</script>
<body bgcolor="F0F0F0">
	<form action="" method="post" name="writeFrm">
		<div align="center">
			<fieldset>
				<img src="/web/image/<%=play.getFileName()%>" width="150"
					height="200" />
			</fieldset>
			<br>
			<fieldset>
				<legend style="background: white">정보</legend>
				<table>
					<tr>
						<td>제목:</td>
						<td><input type="text" name="title"
							value="<%=play.getTitle()%>"></td>
					</tr>
					<tr>
						<td>극장/장소:</td>
						<td><input type="text" name="location"
							value="<%=play.getLocation()%>"></td>
					</tr>
					<tr>
						<td>좌석:</td>
						<td><input type="text" name="seat"
							value="<%=play.getSeat()%>"></td>
					</tr>
					<tr>
						<td>가격:</td>
						<td><input type="text" name="price"
							value="<%=play.getPrice()%>"></td>
					</tr>
				</table>
			</fieldset>
			<br>
			<fieldset>
				<legend style="background: white">리뷰/메모</legend>
				<textarea name="review" rows="5" cols="50"><%=play.getReview()%></textarea>
			</fieldset>
		</div>

		<input type="button" value="수정" onclick="saveReview(this.value)">
		<input type="button" value="삭제" onclick="saveReview(this.value)">
		<input type="button" value="닫기" onclick="saveReview(this.value)">
	</form>
</body>
</html>