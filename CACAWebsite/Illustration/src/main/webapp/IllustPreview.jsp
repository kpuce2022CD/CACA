<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="domain.*, java.util.List"%>

<!DOCTYPE html>
<html>

<head>
<!-- 뷰 포트 메타데이터는 모바일 반응형 만들 때 필요함.-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">

<title>IllustPreview</title>
<!-- css 파일 불러올것. ?ver=1은, 기존 url과 다른 url로 인식하여 새로이 불러오게 함. (크롬 캐시 문제) -->
<link rel="stylesheet" type="text/css" href="./css/test.css?ver=1" media="screen">
</head>

<% String list = request.getParameter("IllustList"); %>

<body>
	<header>
		<h2><%=list %></h2>
			<nav class = "main-nav">
			<a href="#" class="logo">Clonet</a>
				<ul class = "navlinks">
					<li><a href="IllustLink.jsp">Make Link!</a></li>
					<li><a href="http://localhost:8080/Illustration/IllustrationServlet">Back to recheck</a></li>
				</ul>
			</nav>
	</header>
	
	<section>
	<section>

	</section>   

	</section>    
</body>
</html>
