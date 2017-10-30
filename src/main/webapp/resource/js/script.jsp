<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function calcApp(){
   
   var xText = document.getElementById("x");
   var yText = document.getElementById("y");
   var addButton = document.getElementById("add-button");
   var resultText = document.getElementById("result");
   
   addButton.onclick = addButtonClick;
   
   function addButtonClick() {

      var x, y;
      x = parseInt(xText.value);
      y = parseInt(yText.value);

      resultText.value = x + y;
      /* btnPrint.type = "text"; */
   }
}

   window.onload = calcApp;
   
   //------------------------------------------------------------------------------------------------------
   
   window.onload=function(){
      var countLabel = document.getElementById("count-label");
      var countButton = document.getElementById("count-button");
      var timerId = null;
      
      var ex1 = document.getElementById("ex1");
      ex1.style.marginTop="0px"
   /*    countButton.onclick = function(){
         setTimeout(test, 3000);
      };
      
      function test(){
         countLabel.textContent = parseInt(countLabel.textContent)-1;
      } */
      
      countButton.onclick = function(){
         if(timerId == null)
           timerId = setInterval(function(){
                var count = parseInt(countLabel.textContent);
                var marginTop = parseInt(ex1.style.marginTop);
                
                if(count <= 0){ //목표치에 도달했을 경우
                   clearInterval(timerId);
                   timerId = null;
                 }
                
                if(marginTop >= 100){ //목표치에 도달했을 경우
                   clearInterval(timerId);
                   timerId = null;
                 }
                
               //countLabel.textContent = count-1;
                ex1.style.marginTop = (marginTop+1)+"px";
            }, 30);
      };
      
   };
   
   //----open a window 예제-------------------------------------------------------------------------------
   window.onload = function(){
      var openButton = document.getElementById("open-button");
      var movButton = document.getElementById("mov-button");
      var transButton = document.getElementById("trans-button");
      var iframe = window.frames[0];
      
      var win =null;
      
      openButton.onclick = function(){
         if(win == null)
            win=open("notice.html", "_blank", "width=500px height=300px");
      };
      
      movButton.onclick = function(){
         if(win != null)
            win.moveBy(-10,0);
      };
      
      transButton.onclick = function(){
         //iframe.location.href="http://www.daum.net";
         iframe.document.write("hello");
      };
   };
   
   
   //----iframe 예제-------------------------------------------------------------------------------
/*    window.onload = function(){
      var navButton = document.getElementById("nav-button");
      var win = window.frames[0];
      
      navButton.onclick = function(){
         win.location.href="http://www.newlecture.com";
      };
   
   }; */
   
   //----노드 순회 예제-------------------------------------------------------------------------------
   window.onload = function(){
      var chButton = document.getElementById("ch-button");
      var p = document.getElementById("p");
      
      chButton.onclick = function(){
         //p.style.background ="blue";
         //p.firstElementChild.style.border ="1px solid blue";
         
         //alert(p.firstChild.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling)
         for(var node=p.firstChild; node !=null; node = node.nextSibling)
            alert(node.nodeType);
      };
   };
   
   //----Selector API 예제-------------------------------------------------------------------------------
   window.onload = function(){
      var chButton = document.querySelector("#ch-button1");
      //var p = document.querySelector("#module1 > div:first-child + div > div");
      var divs = document.querySelectorAll("#module1 > div");
      var p = divs[1].querySelector("div");
      
      chButton.onclick = function(){
         p.style.border ="1px solid red";
         
      };
   };
   
   //----속성 변경 예제-------------------------------------------------------------------------------
   window.onload = function(){
      var chImgButton = document.querySelector("#ch-img-button");
      var container = document.querySelector("#img-container");
      var img = container.querySelector("img");
      
      chImgButton.onclick = function(){
         img.src ="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjflWCHejV7BvcSgvHCBoDAbfS0cZPQ61_k9ye0GVDj7TZhP5t";
         
      };
   };
   
   //----자식 노드 변경 예제-------------------------------------------------------------------------------
   
    window.onload = function (){
            
            var chNodeButton = document.querySelector("#ch-node-button");
            var container = document.querySelector("#ch-node-container");
            
            chNodeButton.onclick = function(){
               // container.textContent = "<h1>hoho</h1>"; textContent 는 쓰는 그대로 나옴 <h1>hoho</h1>
               container.innerHTML = "<h1>hoho</h1>";
               };
         };
         
     //----텍스트 노드 추가 예제-------------------------------------------------------------------------------
        
     window.onload = function (){
                
               var addTextNodeButton = document.querySelector("#add-text-node-button");
                 var addImgNodeButton = document.querySelector("#add-img-node-button");
                var removeNodeButton = document.querySelector("#remove-node-button");
               var container = document.querySelector("#node-container");
                
               function remove11(e){
                  container.removeChild(e.target);
               }
               
               var idx = 0;
               
               addTextNodeButton.onclick = function(){
                  var span =document.createElement("span");
                  span.onclick = remove11;
                  //1. text 노드 생성
                  var txt = document.createTextNode("안녕하세요."+idx++);
                  //2. container(부모)를 얻기
                  //3. 부모에 자식을 추가
                  span.appendChild(txt);
                  container.appendChild(span);
                  };
                  
                addImgNodeButton.onclick = function(){
                  // 방법 1
              /*  var img = document.createElement("img");
                  img.src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp45QewRHWqu8XIu4-RxLCHrvK5PS6OzrjIOOZkIYKH8F8915U4Q"
                  container.appendChild(img); */
                  
                  // 방법 2 (성능 문제 있을 수 있음.)
                  container.innerHTML += 
                     '<img onclick="remove11()" <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp45QewRHWqu8XIu4-RxLCHrvK5PS6OzrjIOOZkIYKH8F8915U4Q" />'
                     
                 };
                 
               removeNodeButton.onclick = function(){
                  
                  //1. 내정된 노드를 지우기(마지막 추가노드 삭제) ex)막내지우기
                 /*  container.parentNode //container.parentElement
                  container.lastChild */
                  container.removeChild(container.lastChild);
                  
                  //2. 선택된 노드를 지우기
                };
          };

       //---- 노드 바꾸기 예제-------------------------------------------------------------------------------

         window.addEventListener("load", function(e) {
            
         
      
            var swapNodeButton = document.querySelector("#swap-node-button");
            var container = document.querySelector("#node-swap-container");
      
      
            swapNodeButton.onclick = function() {
             /* var node1 = container.querySelector("img:first-child");
               var node3 = container.querySelector("img:last-child");
                 */
               var nodes = container.getElementsByTagName("img");
               var node1 = nodes[0];
               var node3 = nodes[2];
               var nodeNext = node1.nextElementSibling;
                
               var oldNode = container.replaceChild(node1,node3);
               //var newNode = container.insertBefore(node3, nodes[0]);
               var newNode = container.insertBefore(node3, nodeNext);
            };
      
         });
         
         
         //---- 노드 바꾸기 예제 2-------------------------------------------------------------------------------

         window.addEventListener("load", function() {
      
            var moveUpButton = document.querySelector("#move-up-button");
            var radioButton = document.querySelector("id");
            var checkedId = 0;
            
            var container = document.querySelector("#move-up-container");
            var tbody =container.querySelector("tbody");
                /* td 찾는 두가지 방법 */
         //   var td = tbody.querySelector("tr:first-child td:last-child");
            var td = tbody.firstElementChild.lastElementChild;//
             
            
            /* var trs =container.querySelectorAll("tbody tr");
            for(var i=0;i<trs.length;i++){
               trs[i].onclick = function(e){
                  e.target.style.background = "pink";
               }
            }
             */
             
             td.addEventListener("click", function(e){
               // alert("td");
            //   e.stopPropagation();
               
               //console.log("td");
               e.target.style.background="green";
             },false);
             
            tbody.addEventListener("click", function(e){
                  
            	var tr = null;
               
                if(e.target.nodeName == "INPUT"){
                	
                	var tr = e.targer.parentNode.parentNode;
                	
                }
                  // console.log("tbody");
                  /* e.target.style.background = "blue"; */
                  //alert("target: "+e.target.nodeName+", current: "+ e.currentTarget.nodeName);
                  //alert("tbody");
                  //e.target.style.background="pink";
         /*          if(e.target ==?){
                     checkedId = .value;
                  }
          */         
                  
               },true);
               
            moveUpButton.onclick = function() {
               
            	if(tr == null)
            		return;
            	
            
				var bf = tr.previousElementSibling;
				var af = tr.nexdtElementSibling;
            	var container = tr.parentNode;
				//tr.style.background = "pink";
				
				container.replaceChild(tr,bf);
				container.insertBefore(bf,af);
               
             
            }
            
            
         });
         
//---- 기본 행위 막기 예제-------------------------------------------------------------------------------
   window.addEventListener("load", function(){
      var titleText = document.querySelector("form input[name]");
      var submitButton = document.querySelector("form input[type='submit']");
      var cancelButton =document.querySelector("form a");
      submitButton.onclick = function(e){
         if(titleText.value ==""){
            alert("제목을 입력하세요");
            e.preventDefault();      //화면 갱신을 막음      
         }
         
      }
      
      cancelButton.onclick = function(e){
         if(titleText.value !=""){
            var con = confirm("작성중이던 입력을 취소하시겠습니까?");
            if(con == false)
               e.preventDefault();
            /* 
            if(confirm("작성중이던 입력을 취소하시겠습니까?"))
               e.preventDefault();
            */
            
               
         }
      }
   });
   <!-- ------------------노드복제 예제 ---------------------------------->
   window.addEventListener("load", function(){
	      var cloneButton = document.querySelector("#ex-clone input[value='복제']");
	      var tbody = document.querySelector("#ex-clone tbody");
	      
	      cloneButton.onclick = function(e){
	           var tr = tbody.querySelector("tr");
	           var clone = tr.cloneNode(true);
	           tbody.appendChild(clone);
	      }
	   });
   
   <!-- ------------------노드복제 예제2 ---------------------------------->
   window.addEventListener("load", function(){
	      var cloneButton = document.querySelector("#ex2-clone input[value='단순복제']");
	      var ajaxButton = document.querySelector("#ex2-clone input[value='ajax요청']");
	      var tbody = document.querySelector("#ex2-clone tbody");
	      var template = document.querySelector("#ex2-clone template");
	      var container = document.querySelector("#ex2-clone div:first-Child");
	      
	      var data = [{id:"1", title:"니", writerId:"newlec"},{id:"2", title:"나", writerId:"dragon"},{id:"3", title:"노", writerId:"wa"}];
	      
	      
	      ajaxButton.onclick = function(e){
	    	  /* 2.비동기형방식 */
	    	  var xhr = new XMLHttpRequest();
	    	  
	    	  /* xhr.onreadystatechange = function(e){
	    		  if(xhr.readyState == 4)
	    		  data = eval(xhr.responseText);
	    	  }; */
	    	  xhr.onload = function(){
	    		  data = JSON.parse(xhr.responseText);
	    		  // 2. ajax icon 제거
	    		  container.removeChild(container.lastChild);
	    	  };
	    	  xhr.onerorr = function(e){
	    		alert("예기치 못한 오류가 발생했습니다.");  
	    	  };
	    	  
	    	  xhr.open("GET","../../customer/notice-ajax",true);
	    	  xhr.send();
	    	  
	    	  //1. ajax icon 추가
	    	  var img = document.createElement("img");
	    	  img.src = "../images/ajax-loader.gif";
	    	  container.appendChild(img);
	    	  
	    	  /* 1. 동기형방식
	    	  var xhr = new XMLHttpRequest();
	    	  xhr.open("GET","../../customer/notice-ajax",false);
	    	  xhr.send();
	    	  data = eval(xhr.responseText); */
	    	  
	      };
	      
	      cloneButton.onclick = function(e){
	            
	            if('content' in template){
//	               alert("현재 브라우저가 template을 지원하고있습니다");
	               /* 
	                //template의 content에 값을 설정
	               var tds = template.content.querySelectorAll("td");
	               tds[0].appendChild(document.createTextNode("1"));
	               tds[1].appendChild(document.createTextNode("test title"));
	               tds[2].textContent = "newlec";
	               // 값을 설정된 content에 복사
	               var clone = document.importNode(template.content, true);
	                 */
	               for(var i=0; i<data.length;i++){
	                  
	               var clone = document.importNode(template.content, true);
	               var tds = clone.querySelectorAll("td");
	               tds[0].appendChild(document.createTextNode(data[i].id));
	               tds[1].textContent = data[i].title;
	               tds[2].textContent = data[i].writerId; 
	               
	               //복제된 clone(tr)을 노드 트리에 추가
	               tbody.appendChild(clone);
	               }
	               
	            }
	      }

	   });
   
   <!-- ------------------Ajax로 파일 전송하기와 트리거 그리고 파일목록뷰어---------------------------------->
   window.addEventListener("load", function(){
	  var fileInput = document.querySelector("#ex3-upload input");
	  var submitButton = document.querySelector("#ex3-upload span");
	  var progressBar = document.querySelector("#ex3-upload #progress-bar");
	  progressBar.style.width= "0px";
	  
	  var fileViewer = document.querySelector("#ex3-upload ul");
	  
	  //파일 목록 초기화
	  var xhr = new XMLHttpRequest();
	  xhr.onload = function(){
		  var files = JSON.parse(xhr.responseText);//["file1.txt", "file2.txt"];
		  
		  for(var i=0; i<files.length; i++){
			  var li = document.createElement("li");
			  li.textContent = files[i];
			  fileViewer.appendChild(li);
		  }
	  };
	  xhr.open("GET", "../../file-list");
	  xhr.send();

	  //var a = document.createElement("a");
	  
	  submitButton.onclick = function(e){
		  var event = new MouseEvent("click", {
			  'view':window,
			  'bubbles':true,
			  'cancelable':true
		  });
		  
		  //console.log("bf");
		  fileInput.dispatchEvent(event);
		  fileInput.onchange = function(){
		  var file = fileInput.files[0];
		  
		  var formData = new FormData();
		  formData.append("title", "테스트");
		  formData.append("file", file);
		  
		  var xhr = new XMLHttpRequest();
		  xhr.upload.onprogress = function(e){
			  var percentage = Math.round(e.loaded * 100 / e.total);
			  progressBar.textContent = percentage + "%";
			  progressBar.style.width = percentage + "px";
		  };
		  
		  xhr.onload = function(){
			  
		  };  
		  xhr.onerror = function(e){
			  alert("예기치 못한 오류가 발생하였습니다.");
		  };
		  xhr.open("POST", "../../upload?${_csrf.parameterName}=${_csrf.token}");
		  xhr.send(formData);

		  //alert(file.name);
		  /* for(var key in fileInput.files[0])
			  alert(key); */
		  //console.log("af");
	  	};
	  };
   });
   
</script>
</head>
<body>

	<!-- ------------------Ajax로 파일 전송하기와 트리거 ---------------------------------->
	<div id="ex3-upload">

		<input type="file" style="display: none;" /> 
		<span style="border: 1px solid #999; border-radius: 5px; background: pink; padding: 3px; cursor: pointer;">파일선택</span>
		<span id="progress-bar" style="background: aqua; display: inline-block"></span>
		<hr />
		
		<%-- <form action="../../upload?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
			<div>
				<input type="submit" value="전송" />
				<input type="button" value="" />
			</div>
			<div id="clone-container">
				<table border="1">
					<tbody>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" /></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td><input type="file" name="file" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form> --%>
		
		<div>
			<ul>
			 	<li><!-- ajax-icon.gif --></li>
			</ul>
		</div>
	</div>
	<hr />

	<!-- ------------------노드복제 예제2 ---------------------------------->
	<div id="ex2-clone">
		<div>
			<input type="button" value="단순복제" /> <input type="button"
				value="ajax요청" />
		</div>
		<div id="clone-container">
			<table border="1">
				<thead>
					<tr>
						<td></td>
						<td>코드</td>
						<td>제목</td>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<template>
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			</template>
		</div>
	</div>
	<hr />

	<!-- ------------------노드복제 예제 ---------------------------------->
	<div id="ex-clone">
		<div>
			<input type="button" value="복제" />
		</div>
		<div id="clone-container">
			<table border="1">
				<thead>
					<tr>
						<td></td>
						<td>코드</td>
						<td>제목</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input name="id" type="radio" value="1" /></td>
						<td>1</td>
						<td>제목1~~~~~~~~~~~~~~</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<hr />

	<!-- ------------------기본행위막기 예제 ---------------------------------->
	<form>
		<input type="text" name="title" /><br /> <input type="submit"
			value="전송" /> <a href="">취소</a>
	</form>
	<hr />
	<!-- ---------------------노드 바꾸기 예제2 + 이벤트 심화 : 버블링과 캡처링 ---------------------------------->
	<input id="move-up-button" type="button" value="위로 옮기기">
	<div id="move-up-container">
		<table border="1">
			<thead>
				<tr>
					<td></td>
					<td>코드</td>
					<td>제목</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input name="id" type="radio" value="1" /></td>
					<td>1</td>
					<td>제목1~~~~~~~~~~~~~~</td>
				</tr>
				<tr>
					<td><input name="id" type="radio" value="2" /></td>
					<td>2</td>
					<td>222222222##################################################################</td>
				</tr>
				<tr>
					<td><input name="id" type="radio" value="3" /></td>
					<td>3</td>
					<td>집에가야지</td>
				</tr>
				<tr>
					<td><input name="id" type="radio" value="4" /></td>
					<td>4</td>
					<td>추석#</td>
				</tr>
				<tr>
					<td><input name="id" type="radio" value="5" /></td>
					<td>5</td>
					<td>~~~~~~추서어어억~~~~~</td>
				</tr>

			</tbody>
		</table>

	</div>
	<hr />
	<!-- ---------------------노드 바꾸기 예제 ---------------------------------->
	<input id="swap-node-button" type="button" value="노드 바꾸기">
	<div id="node-swap-container">
		<img src="../images/라이언.gif" /><img src="../images/라이언엉.gif" /><img
			src="../images/17.gif" />

	</div>
	<hr />
	<!-- ---------------------텍스트 노드 추가 예제 ---------------------------------->
	<input id="add-text-node-button" type="button" value="텍스트노드 추가">
	<input id="add-img-node-button" type="button" value="이미지노드 추가">
	<input id="remove-node-button" type="button" value="노드 삭제">
	<div id="node-container"></div>
	<hr />

	<!-- ---------------------자식 노드 변경 예제 ---------------------------------->
	<input id="ch-node-button" type="button" value="자식노드 변경">
	<div id="ch-node-container">hello</div>
	<hr />

	<!-- 속성 변경 예제------------------------------------------------------------------------------------ -->
	<input type="text" id="img-src" />
	<input id="ch-img-button" type="button" value="이미지 변경" />
	<div id="img-container">
		<img
			src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp45QewRHWqu8XIu4-RxLCHrvK5PS6OzrjIOOZkIYKH8F8915U4Q" />
	</div>
	<hr />

	<!-- Selector API 예제------------------------------------------------------------------------------------ -->
	<input id="ch-button1" type="button" value="배경색 변경" />
	<div id="module1">
		<div>1</div>
		<div>
			<div>2</div>
			<!-- comment -->
		</div>
		<div>3</div>
	</div>
	<hr />
	<!-- 노드 순회 예제------------------------------------------------------------------------------------ -->
	<input id="ch-button" type="button" value="배경색 변경" />
	<div>
		<div>1</div>
		<div id="p">
			<div>2</div>
			<!-- comment -->
		</div>
		<div>3</div>
	</div>
	<hr />
	<!-- iframe 예제------------------------------------------------------------------------------------ -->
	<div>
		<input id="nav-button" type="button" value="페이지 전환" />
		<iframe src="notice.html" style="width: 500px; height: 300px;"></iframe>
	</div>
	<hr />
	<!-- open a window 예제------------------------------------------------------------------------------------ -->
	<div>
		<input id="open-button" type="button" value="새창띄우기" /> <input
			id="mov-button" type="button" value="왼쪽으로 이동" /> <input
			id="trans-button" type="button" value="페이지 이동" />
	</div>
	<hr />
	<!-- Timer 예제------------------------------------------------------------------------------------ -->
	<p>
		남은시간 <span id="count-label">60</span>초 <input type="button"
			id="count-button" value="카운트 시작" />
	</p>
	<hr />
	<!-- Calculator 예제------------------------------------------------------------------------------------ -->
	<div id="ex1">
		<input type="text" id="x" placeholder="x값을 입력하세요" /> <input
			type="text" id="y" placeholder="y값을 입력하세요" /> = <input type="button"
			value="더하기" id="add-button" /> <input type="text" value=""
			id="result" />
	</div>
</body>
</html>