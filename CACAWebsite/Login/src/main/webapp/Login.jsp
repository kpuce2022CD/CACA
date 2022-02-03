<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  해당 jsp 에서는 View 부분만 처리!  -->
<!DOCTYPE html>
<html style="font-size: 16px;">

<!-- head 부분 -->
<head>

<!-- css 파일. nicepage.css와, login.css 경로에 링크가 필요함. -->
<link rel="stylesheet" href="./css/test.css" media="screen" type="text/css">

<title>Login</title>


</head>


<!-- body 부분 -->
<body>
	<header>
		 <!-- nav는 하나의 고유한 상단 태그. id 부여함. nav, ui, li, a는 기본구성. -->
			<nav class = "main-nav">
			<a href="#" class="logo">Clonet</a>
				<ul class = "navlinks">
					<li><a href="http://localhost:8080/About_Customer/About_CustomerServlet">About (customer)</a></li>
					<li><a href="http://localhost:8080/Contact_Customer/Contact_CustomerServlet">Contact (customer)</a></li>
				</ul>
			</nav>
	</header>

	<!-- section. 내용적 흐름과 구조를 만들기 위해 내용을 나누는 용도. 로그인 폼은 섹션으로 구성되어 있다는걸 알 수 있음. -->
	<section>
		<div>
			<img src="./images/saturn1.png">

					<!-- 로그인 제목 -->
					<h3>Log In</h3>

					<!-- 로그인 폼 크기 및 속성 정의 -->
					<div>

						<!-- 로그인 폼의 action은 LoginServlet(컨트롤러)에 접근하도록. 접근 방식은 입력한 url이 가려지는 post로 설정. -->
						<form action="LoginServlet" method="post" source="custom" name="form-3">
							<!-- 1. 아이디 입력창 -->
							<div>
								<label for="userID"></label>
								<input type="text" name="id" placeholder="Enter your ID" required="">
							</div>

							<!-- 2. 패스워드 입력창 -->
							<div>
								<label for="userPwd"></label>
								<input type="password" name="pw" placeholder="Enter your Password" required="">
								<!-- 타입 비밀번호인, userPwd 라는 이름의 입력창-->
							</div>

							<!-- 3. 로그인 버튼 (class로 디자인 적용 등.) -->
							<div>
								<input type="submit" value=Login>
							</div>
							
						</form>
						
					</div>
				</div>
	</section>
</body>
</html>