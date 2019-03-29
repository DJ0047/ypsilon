<!-- http://blog.naver.com/PostView.nhn?blogId=javaking75&logNo=220145998991 -->
<%@page import="report.dao.PlayDao"%>
<%@page import="report.model.Play"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<html>
<%
	request.setCharacterEncoding("utf-8");
	List<Play> list = PlayDao.searchDate();

	Calendar calendar = Calendar.getInstance();
	int[] today = {calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DATE)};

	String id = request.getParameter("id");
	String getDate = request.getParameter("getDate");
	String fileName = request.getParameter("fileName");

	String getYear = request.getParameter("year");
	String getMonth = request.getParameter("month");

	if (getYear != null) {
		today[0] = Integer.parseInt(getYear);
		today[1] = Integer.parseInt(getMonth);
	}
	System.out.println("getToday>>>> " + today[0] + " " + today[1]);
	calendar.set(today[0], today[1], 1);

	int firstDay = calendar.getMinimum(java.util.Calendar.DATE);
	int lastDay = calendar.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = calendar.get(java.util.Calendar.DAY_OF_WEEK);
	int date = 0;
	System.out.println("get...>>>> " + firstDay + " " + lastDay + " " + start);
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int todayInt = Integer.parseInt(sdf.format(todayCal.getTime()));
%>
<style>
thead td {
	font-family: "맑은고딕";
	font-size: 20pt;
	color: #434343;
}

tbody td {
	width: 150px;
	height: 200px;
	vmargin: 0px;
	cellpadding: 0px;
	cellspacing: 0px;
	border-collapse: collapse;
	font-family: "맑은고딕";
	font-size: 20pt;
}

img {
	width: 150px;
	height: 200px;
	display: block;
}

button {
	display: inline-block;
	font-family: "맑은고딕";
	font-size: 0.9em;
	color: #D65745;
	letter-spacing: 0.2em;
	background: white;
	border: 0;
	outline: 0;
	background: white;
	border: 0;
	outline: 0;
	padding: 2em 8em 2em 8em;
	border: 0;
	outline: 0;
	background: white;
	border: 0;
	outline: 0;
	outline: 0;
	background: white;
	border: 0;
	outline: 0;
	background: white;
	border: 0;
	outline: 0;
	border: 0;
	outline: 0;
	outline: 0;
}
</style>

<head>
<meta charset="EUC-KR">
<title>WELCOME TO MY PL@YGROUND</title>
<link rel="stylesheet" href="../css/bootstrap.css">
</head>
<script type="https://ajax.googleapis.com/ajax"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script>
	function changeCal(btnName) {
		var obj = document.calendarFrm;
		if (btnName == 'pre') {
			obj.action = 'calendar.jsp?year=<%=today[0]%>&month=<%=(today[1] - 1)%>';
					obj.submit();
		} else if (btnName == 'cur') {
		} else if (btnName == 'next') {
			obj.action = 'calendar.jsp?year=<%=today[0]%>&month=<%=(today[1] + 1)%>';
			obj.submit();
		}
	}
</script>
<body>

	<form action="calendar.jsp?getDate=<%=getDate%>" name="calendarFrm"
		method="post">
		<div style="text-align: center">
			<h1 style="color: #434343;">
				<a href="list.jsp" style="text-decoration: none; color: #434343">
					<%=id + "님의 PL@YGROUND"%></a>
			</h1>

			<button onclick="changeCal(this.name)" name="pre"><%=today[0] + "." + (today[1])%></button>
			<button onclick="changeCal(this.name)" name="cur"><%=today[0] + "." + (today[1] + 1)%></button>
			<button onclick="changeCal(this.name)" name="next"><%=today[0] + "." + (today[1] + 2)%></button>
		</div>
		<table>
			<thead class="thead">
				<tr align="center">
					<td>일</td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td>토</td>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr align="center">
					<%
						for (int i = 1; i < start; i++) {
					%>
					<td>&nbsp</td>
					<%
						date++;
						}
						int j = 0;
						for (int i = 1; i <= lastDay; i++) {
							String color = "";

							if (date == 0) {
								color = "#D65745";

							} else if (date == 6) {
								color = "#A2CFEE";

							} else {
								color = "#434343";
							}

							String innerDateStr = Integer.toString(today[0]);
							innerDateStr += Integer.toString(today[1] + 1).length() == 1 ? "0" + Integer.toString(today[1] + 1)
									: Integer.toString(today[1] + 1);
							innerDateStr += Integer.toString(i).length() == 1 ? "0" + Integer.toString(i) : Integer.toString(i);

							int innerDate = Integer.parseInt(innerDateStr);
							String backColor = "white";

							if (innerDate == todayInt) {
								backColor = "#D65745";
								color = "white";
							}

							if (list.size() == 0) {
								System.out.println("안나오겠지~~");
					%>
					<td bgcolor='<%=backColor%>'><a
						href="selectImage.jsp?getDate=<%=innerDateStr%>"><font
							color='<%=color%>'><%=i%></font></a></td>
					<%
						date++;
							} else {
								/* int j = 0; */
								for (; j < list.size();) {
									if (innerDate == Integer.parseInt(list.get(j).getRegdate())) {
					%>
					<td bgcolor='<%=backColor%>'><img
						src='/web/image/<%=list.get(j).getFileName()%>'></td>
					<%
						j++;
										date++;
										break;
									} else {
					%>
					<td bgcolor='<%=backColor%>'><a
						href="selectImage.jsp?getDate=<%=innerDateStr%>"><font
							color='<%=color%>'><%=i%></font></a></td>
					<%
						date++;
										break;
									} // else-날짜가 겹치지 않으면
								} // for-j

								if (innerDate > Integer.parseInt(list.get(list.size() - 1).getRegdate())) {
					%>
					<td bgcolor='<%=backColor%>'><a
						href="selectImage.jsp?getDate=<%=innerDateStr%>"><font
							color='<%=color%>'><%=i%></font></a></td>
					<%
						date++;
								}

							} // else-사이즈가 0이 아니면							

							if (date == 7) {
					%>
				</tr>
				<%
					if (i <= lastDay) {
				%>
				<tr align="center">
					<%
						}
								date = 0;
							}
						} // for-i
						while (date > 0 && date < 7) {
					%>
					<td>&nbsp</td>
					<%
						date++;
						} // while
					%>

				</tr>
			</tbody>
		</table>


	</form>
</body>
</html>