<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="domain.*, java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IllustLink</title>
<link rel="stylesheet" type="text/css" href="./css/test.css?ver=1" media="screen">
</head>
<body>
	<header>
			<nav class = "main-nav">
			<a href="#" class="logo">Clonet</a>
				<ul class = "navlinks">
					<li><a href="http://localhost:8080/Illustration/IllustrationServlet">Back</a></li>
				</ul>
			</nav>
	</header>

<!-- url 형태의 데이터 들어갈 것. (contact_Customer로 가는 링크) -->
<% List<IllustVO> IllustList = (List<IllustVO>)request.getAttribute("Linked_Illust"); %>
<!-- 받는 형식이 url 이어야 함. -->

</body>
</html>