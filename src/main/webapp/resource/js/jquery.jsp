<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		// DOM 객체를
		//var _chButton = document.getElementByID("ch-Button"); // DOM 객체
		// jQuery 객체로 바꾸는 방법1 : jQuery 함수 이용하기
		//var chButton = jQuery(_chButton);

		// jQuery 객체로 바꾸는 방법2 : $ 함수 이용하기
		//var chButton = $(_chButton);
			
		// jQuery 객체로 바꾸는 방법3 : CSS Selector 이용하기
		var chButton = $("#ch-button");
		
		// 이벤트 바인딩 두 가지 옵션 : 첫번째 범용 이벤트 바인딩 함수 on()
		/* chButton.on("click", function(){
			alert("aa");
		});	 */	
		
		// 이벤트 바인딩 두 가지 옵션 : 두번째 특수 이벤트 바인딩 함수 click/keydown...()
		chButton.click(function(){
			//?.style.background = "red";
			// 여러개의 스타일을 설정해야 하는 경우 : 방법1
			/* $("#p").css("background", "red"); // 아이디엔 #
			$("#p").css("font-size","13px"); */

			// 여러개의 스타일을 설정해야 하는 경우 : 방법2
			$("#p").css({
				background : "red",
				"font-size" : "23px"
			});
		});
	});	
   
</script>
</head>
<body>
	
	<hr />
	<!-- 노드 순환 예제 -->
	<input id="ch-button" type="button" value="배경색 변경" />
	<div>
		<div>1</div>
		<div id="p">
			<div>2</div>
		</div>
		<div>3</div>
	</div>
	
</body>
</html>