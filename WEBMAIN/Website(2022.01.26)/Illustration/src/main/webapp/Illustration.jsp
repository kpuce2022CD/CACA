<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="domain.*, java.util.List"%>

<!DOCTYPE html>
<html style="font-size: 16px;">

<head>
<!-- 뷰 포트 메타데이터는 모바일 반응형 만들 때 필요함.-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="page_type" content="np-template-header-footer-from-plugin">
<title>Illustration</title>

<link rel="stylesheet" href="./css/nicepage.css" media="screen">
<link rel="stylesheet" href="./css/Illustration.css" media="screen">

<!-- 페이지 띄워주는 것과 관련있는 jquery, js -->
<script class="u-script" type="text/javascript" src="./css/jquery.js" defer=""></script>
<script class="u-script" type="text/javascript" src="./css/nicepage.js"defer=""></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


<!-- 제작 프로그램 명시 -->
<meta name="generator" content="Nicepage 4.2.6, nicepage.com">

<!--  글씨 폰트  -->
<link id="u-theme-google-font" rel="stylesheet"href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">


<meta name="theme-color" content="#478ac9">
<meta property="og:title" content="Illustration">
<meta property="og:description" content="">


<!-- 이미지 정렬  -->
<style type="text/css">
img {
	max-width: 32%;
	height: 32%;
	padding: 4px;
}

#cl-dashboard {
	display: none;
}

.clicked {
   border: 1px solid red;
   color: white;
}


</style>

<!-- input[type=checkbox] {
    display:none;
}   -->

</head>

<body class="u-body">

	<!-- header 부분. 글로벌 링크(로그인, 회원가입, 사이트맵, 언어 선택등 웹사이트 어느 곳에서든지 이용할 수 있는 링크)등으로 구성된 영역. 세션에 따라 해당 부분 호출해 오는 식으로 구성. -->
	<header class="u-clearfix u-grey-75 u-header u-header" id="sec-61f1">
		<div class="u-clearfix u-sheet u-sheet-1">
		
			<a href="#" data-page-id="59354799" class="u-image u-logo u-image-1" data-image-width="600" data-image-height="400" title="Home"></a> 
			
			<span class="u-icon u-icon-circle u-text-palette-1-base u-icon-1">
				<svg class="u-svg-link" preserveAspectRatio="xMidYMin slice"viewBox="0 0 55 55" style=""> </svg> 
				<svg class="u-svg-content" viewBox="0 0 55 55" x="0px"y="0px" id="svg-af4d" style="enable-background: new 0 0 55 55;"></svg>
			</span>


			<!-- 내비게이션 바의 스타일 지정 -->
			<nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
				<div class="menu-collapse"
					style="font-size: 1rem; letter-spacing: 0px;">
					<a
						class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
					</a>
				</div>

				<!-- 웹페이지 로그인 상태일 때 버튼 스타일 및 링크, 이름 지정. 내비게이션 바는 각 프로젝트에 연결할 것. -->
				<div class="u-custom-menu u-nav-container">
					<ul class="u-nav u-unstyled u-nav-1">
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
							style="color: rgb(255, 0, 200);"style="padding: 10px 20px;" onclick = "openPopup()">Put in the link Store</a></li>

						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
							href="Illustration.jsp" style="padding: 10px 20px;">Illustation</a>
						</li>

						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
							href="About.jsp" style="padding: 10px 20px;">About</a></li>

						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
							href="Contact.jsp" style="padding: 10px 20px;">Contact</a></li>

						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
							href="Login.jsp" style="padding: 10px 20px;">Logout</a>
						<li class="u-nav-item">
					</ul>
				</div>
			</nav>
		</div>
	</header>

	<!-- 이미지 내부에만 padding 등 옵션을 주기 위해서 section 나눠놓음. http://localhost:8080/Illustration/IllustrationServlet 으로 테스트 해야함.-->
	<!-- directory_path 부분에 db에 저장된 서버 이미지 경로가 들어감. for문 돌리면 일러 리스트 자동으로 있는만큼 출력되는듯.-->
	  <section style="padding: 5px;">
           <% List<IllustVO> IllustList = (List<IllustVO>)request.getAttribute("IllustList");
            	for(IllustVO vo : IllustList){ %>
	            <img src = "<%=vo.getDirectory_path() %>" onclick = "inputClickEvent(this)">
	            <%}%>    
      </section>	
	
	<script>
let selectedIllust = new Array();  // 배열 저장할 selectedIllust 선언

/*
function mapping(input){   // input에 value 맵핑. (value 값은 vo.getDirectory_path()의 string 형태)
	
	// value에 데이터 삽입 전용 IllustList 선언
	List<IllustVO> IllustList = (List<IllustVO>)request.getAttribute("IllustList");

	// value 저장할 for문 선언 후, 클릭 이벤트 안에 삽입.
	for(IllustVO vo : IllustList){  // 일러스트 리스트 만큼 반복.
		input.value = "vo.getDirectory_path()";
	}
	
}

// input 함수 호출 및, input 할당.
mapping(input);
div.append(input);
*/

// 여기까지는 진행됨.
function inputClickEvent(input){   // 클릭 이벤트 삽입
	input.addEventListener('click', function(e) {   // input 에 이벤트 리스너 삽입.
			
     //중복방지 함수
     // selectedIllust = selectedIllust.filter((element, index) => selectedIllust.indexOf(element) != index);  // 선택한 이미지만 넘어감.

	//click class가 존재할때(제거해주는 toggle)
	if (input.classList.contains("clicked")) {   // 클릭 상태일 때 리무브 클릭.
   		input.classList.remove("clicked");
   		selectedIllust.splice(selectedIllust.indexOf(e.target.value), 1);   // 클릭 해제하면, 저장된 데이터 다시 빼냄.
    	clicked = document.querySelectorAll(".clicked");   // 클릭이벤트 범위 지정
    	
    	
        clicked.forEach((data) => {   
        	selectedIllust.push(data.value);   // 클릭한 이벤트 넘겨주는 함수
        });
    	

    //click class가 존재하지 않을때 (추가해주는 toggle)
	} else {
		input.classList.add("clicked");
		clicked = document.querySelectorAll(".clicked");  // 클릭 이벤트 범위 지정.
		
		
        clicked.forEach((data) => {   // 클릭한 이벤트 넘겨주는 함수
        	selectedIllust.push(data.value);
        });	
		// 이 때, true를 반환해서 넘어가야 함.
	}
    // openPopup(); // openPopup 함수 사용하면, IllustPreview.jsp 로 이동. (선택한 값을 모두 저장한 뒤에 눌러주어야 함.)
  	})
}

function openPopup(){   // 해당하는 페이지에 선택한 일러스트 링크들 붙어있는 오픈 팝업
	  window.open('IllustPreview.jsp?selectedIllust=' + selectedIllust);
}
	</script>

	
</body>
</html>