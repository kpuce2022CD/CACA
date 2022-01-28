<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="domain.*, java.util.List"%>

<!DOCTYPE html>
<html>

<head>
<!-- 뷰 포트 메타데이터는 모바일 반응형 만들 때 필요함.-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">

<title>Illustration</title>
<!-- css 파일 불러올것. ?ver=1은, 기존 url과 다른 url로 인식하여 새로이 불러오게 함. (크롬 캐시 문제) -->
<link rel="stylesheet" type="text/css" href="./css/test.css?ver=1" media="screen">

<style>
.clicked {
   border: 1px solid red;
   color: white;
}
</style>

</head>

<body>
	<header>
		<nav class = "main-nav">
			<a href="#" class="logo">Clonet</a>
				<ul class = "navlinks">
					<li><a href="http://localhost:8080/Illustration/IllustrationServlet" onclick = "openPopup()">Put in the link Store</a></li>
					<li><a href="http://localhost:8080/About/AboutServlet">About</a></li>
					<li><a href="http://localhost:8080/Contact/ContactServlet">Contact</a></li>
					<li><a href="http://localhost:8080/Login/LoginServlet">Logout</a></li>
				</ul>
			</nav>
	</header>
	
	<section>
           <% List<IllustVO> IllustList = (List<IllustVO>)request.getAttribute("IllustList");
            	for(IllustVO vo : IllustList){ %>
	            <img src = "<%=vo.getDirectory_path() %>" onclick = "inputClickEvent(this)">
	            <%}%>
	</section>    
</body>

<script>
function inputClickEvent(input){   // 클릭 이벤트 삽입
	input.addEventListener('click', function(e) {  // input 에 이벤트 리스너 삽입.
		

	if (input.classList.contains("clicked")) {  // clicked는 css 스타일 추가 (외곽선) 해주는 연산.
   		input.classList.remove("clicked");
   		
   		// 클릭 상태일 때 리무브 클릭이므로, false 반환.

		} else {
			input.classList.add("clicked");
			// 클릭 상태가 아닐때 클릭 추가이므로 true 반환
		}
  	})
}
</script>

</html>