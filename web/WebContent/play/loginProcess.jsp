<!DOCTYPE html>
<%@page import="report.dao.MemberDao"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
</head>
<script type="https://ajax.googleapis.com/ajax"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	if (MemberDao.searchId(id) == true && MemberDao.pwCheck(id, pw)) {
		response.sendRedirect("calendar.jsp?id=" + id);
	} else {
		response.sendRedirect("login.jsp");
	}
%>
<body>
</body>
</html>