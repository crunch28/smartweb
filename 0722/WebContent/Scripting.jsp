<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>scripting tag</title>
</head>
<body>
	<h2>scripting tag</h2>
	<%!
	int cnt=3;
	String makeItLower(String data){
		return data.toLowerCase();
	}
	%>
	
	<%
	for(int i=1; i<=cnt;i++){
		out.println("Java Server Pages" + i +".<br>");
	}
	%>
	
	<%=
	makeItLower("Hello World")
	%>
</body>
</html>