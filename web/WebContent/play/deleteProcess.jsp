<!DOCTYPE html>
<%@page import="report.dao.PlayDao"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
</head>
<script type="https://ajax.googleapis.com/ajax"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<%
	request.setCharacterEncoding("utf-8");
	String getDate = request.getParameter("getDate");
	PlayDao.deletePlay(getDate);
	response.sendRedirect("calendar.jsp");
%>
<body>

</body>
</html>