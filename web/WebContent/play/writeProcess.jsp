<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@page import="report.dao.PlayDao"%>
<%@page import="report.model.Play"%>
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

	Play play = new Play();

	String fileName = request.getParameter("fileName");
	String title = request.getParameter("title");
	String regdate = request.getParameter("getDate");
	String location = request.getParameter("location");
	String seat = request.getParameter("seat");
	int price = Integer.parseInt(request.getParameter("price"));
	String review = request.getParameter("review");

	play.setFileName(fileName);
	play.setTitle(title);
	play.setRegdate(regdate);
	play.setLocation(location);
	play.setSeat(seat);
	play.setPrice(price);
	play.setReview(review);
	
	PlayDao.insertReview(play);

	response.sendRedirect("calendar.jsp?getDate=" + getDate + "&fileName=" + fileName);
%>
<body>
</body>
</html>