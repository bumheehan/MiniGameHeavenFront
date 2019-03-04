<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>PROFILE</title>
      	<link rel="shortcut icon" href="/resources/res/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css">
</head>

<body>

    <%@ include file="header.html" %>
    <input type="hidden" id="email" value="<sec:authentication property="principal.member.email"/>">
    <input type="hidden" id="userName" value="<sec:authentication property="principal.member.name"/>">
    <input type="hidden" id="profile" value="<sec:authentication property="principal.member.profile"/>">

    <%@ include file="loading.html" %>
	<div class="confirm ndisp">
 		<div class="confirmbox">
	 		<div class="confirmmsgbox">PROFILE CHANGE</div>
	 		<div class="confirmbuttonbox"><div class="yes">O</div><div class="no">X</div>	</div>
		</div>
	</div>
    <div class="user_box">
        <div class="logintxt">PROFILE</div>
        <div class="prof_box">
            <div class="pic_box">

                <div class="box">
                    <div class="probox z">
                        <div class="pro"></div>
                    </div>
                    <div class="dropZone" id="dropZone">
                        <div class="bor">DRAG<br />AND<br />DROP</div>
                    </div>
                    <div class="filebox">
                        <input type="file" name="fileinput" class="file">
                        <label for="" class="filetxt">PROFILE SELECTOR</label>
                    </div>
                   	<div class="imginit ndisp">
                   	PROFILE DELETE
                   	</div>

                </div>

            </div>
            <div class="info_box">
                <div>

                    <div class="inputitem">
                        <label for="">NAME:\><span class="error"></span></label>
                        <input id="nameinput" autocapitalize="off" autocomplete="off" autocorrect="off" class="p_input" maxlength="32" movefocus="true" name="name" placeholder="NAME" send="true" value="<sec:authentication property="principal.member.name"/>" />

                    </div>
                    <div class="inputitem">
                        <label for="">PWD:\><span class="error"></span></label>
                        <input id="pwdinput" type="password" autocapitalize="off" autocomplete="off" autocorrect="off" class="p_input" maxlength="32" movefocus="true" name="pwd" placeholder="PASSWORD" send="true" />

                    </div>
                    <div class="inputitem">
                        <label for="">PWDCHK:\><span class="error"></span></label>
                        <input id="pwdcinput" type="password" autocapitalize="off" autocomplete="off" autocorrect="off" class="p_input" maxlength="32" movefocus="true" name="pwd" placeholder="PASSWORD CHECK" send="true" />

                    </div>

                </div>
            </div>
            <div class="info_box2">
                <div>
                    <div class="inputitem">
                        <br />
                        <label for="" class="abla">ABOUT_YOU:\></label>
                        <label class="pagec">
                            0/200
                        </label>
                        <textarea id="abtinput" class="t_input" name="abt" placeholder="Introduce Yourself" cols="54" rows="7" style="resize: none;" ></textarea>

                    </div>
                    <button class="rbtn">CHANGE</button>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
    var uploadSize = 5;
    var file = null;
    var csrf_name = "${_csrf.headerName}";
    var csrf_token = "${_csrf.token}";
	
    function input (ele,text){
    	let l = text.length;
    	let i = 0;
    	let myVar = setInterval(()=>{
    		ele.innerText=text.substring(0,i);
    		i++;
    		if(i>l){
    			clearInterval(myVar);
    		}
    		
    	}, 100);
    }
    
    let ajax_nm=true;
    let ajax_pwd=true;
    
    
    function proinit(){
    	
         	 var pro = document.querySelector(".pro");
         	    pro.style.backgroundImage = "";
         		$(".bor").css('opacity', '1');
         		document.querySelector(".imginit").classList.add("ndisp");
    			document.querySelector(".filebox").classList.remove("ndisp");
    			document.querySelector(".probox").classList.add("z");
        }
        
  
    $(document).ready(function() {
        let error = false; 
        
        
        document.querySelector(".rbtn").addEventListener("click",function(){
        	document.querySelector(".confirm").classList.remove("ndisp");
    
            $(".confirmbox").stop().animate({
                opacity: 1
            }, 500);
        });
        document.querySelector(".yes").addEventListener("click",function(){
        	document.querySelector(".confirm").classList.add("ndisp");
        	uploadFile();
        });
        document.querySelector(".no").addEventListener("click",function(){
     
            document.querySelector(".confirm").classList.add("ndisp");
        });
        
        document.querySelector(".imginit").addEventListener("click",function(){
        	proinit();
        })
        //이미지 초기화
        
        if(${profile}==1){
        	let url = "/res/profile/"+document.querySelector("#email").value;
			var pro = document.querySelector(".pro");
			pro.style.backgroundImage = "url('"+url+"')";
			$(".bor").css('opacity', '0');
			document.querySelector(".imginit").classList.remove("ndisp");
			document.querySelector(".filebox").classList.add("ndisp");
			document.querySelector(".probox").classList.remove("z");
        }
        
        let am ="<sec:authentication property="principal.member.aboutMe"/>";
        if(am!="" || am=="null"){
        	 var ab = document.querySelector("#abtinput");
        	 
        	 ab.innerHTML=am;
        }
                
        
        let nameRegExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/;
        let nameinput = document.querySelector("#nameinput");
        let namechk = false;
        nameinput.addEventListener("focusout",function(){
        	if(document.querySelector("#userName").value!=nameinput.value){
        		if(nameRegExp.test(nameinput.value)){
            		let fd = new FormData();
                    fd.append("name",nameinput.value);
                       
                       var request = $.ajax({
                          url: "/namechk.do",
                          method: "POST",
                          processData:false,
                          contentType:false,
                          beforeSend: function(xhr){
                        	xhr.setRequestHeader(csrf_name,csrf_token);  
                          },
                          data:fd ,
                          dataType: "html"
                        });

                        request.done(function( msg ) {
                        	console.log(msg);
                            //msg0 정상 ,1 있음
                            if(msg==0){
                           	 document.querySelectorAll(".error")[0].style.color="#73FF73"
                           	 input(document.querySelectorAll(".error")[0],"OK!");
                                ajax_nm=true;
                            }else if(msg>0){
                           	 document.querySelectorAll(".error")[0].style.color=""
                           	 input(document.querySelectorAll(".error")[0],"FAIL!, ALREADY EXISTS");
                                ajax_nm=false;
                                
                            }
                        });

                        request.fail(function( jqXHR, textStatus ) {
                       	 document.querySelectorAll(".error")[0].style.color=""
                       	 input(document.querySelectorAll(".error")[0],"FAIL!,TRY AGAIN!!");
                       	ajax_nm=false;
                        });
            	}else{
            		 document.querySelectorAll(".error")[0].style.color=""
                     input(document.querySelectorAll(".error")[0],"WORNG FORMAT!!");
            		 ajax_nm=false;
            	}
        		
        		
        	}else{
        		document.querySelectorAll(".error")[0].style.color="#73FF73"
                  input(document.querySelectorAll(".error")[0],"");
        	}
        	
         
        });
  
       
        let pwdRegExp = /(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/;
        let pwdinput = document.querySelector("#pwdinput");
        let pwdcinput = document.querySelector("#pwdcinput");
        
        pwdinput.addEventListener("focusout",function(){
        	if(pwdinput.value!=""){
        		if(pwdRegExp.test(pwdinput.value)){
            		document.querySelectorAll(".error")[1].style.color="#73FF73"
                  	 input(document.querySelectorAll(".error")[1],"OK!");
            		if(pwdinput.value==pwdcinput.value){
            			ajax_pwd=true;
            		}else{
            			ajax_pwd=false;
            		}
                }else{
                	ajax_pwd=false;
                	document.querySelectorAll(".error")[1].style.color=""
                    input(document.querySelectorAll(".error")[1],"WORNG FORMAT!!");
                }
        	}else{
        		if(pwdinput.value==pwdcinput.value){
        			ajax_pwd=true;
        		}else{
        			ajax_pwd=false;
        		}
        	}
            
        });
        pwdcinput.addEventListener("focusout",function(){
        	if(pwdinput.value!=""){
        		  let pcc = (this.value==pwdinput.value);
                  if(pcc&&pwdRegExp.test(pwdcinput.value)){
                	  	ajax_pwd=true;
                  		document.querySelectorAll(".error")[2].style.color="#73FF73"
                       	input(document.querySelectorAll(".error")[2],"OK!");
                  }else{
                	  ajax_pwd=false;
                  	document.querySelectorAll(".error")[2].style.color=""
                          input(document.querySelectorAll(".error")[2],"TRY AGAIN!!!");
                  }
        	}else{
        		if(pwdinput.value==pwdcinput.value){
        			ajax_pwd=true;
        		}else{
        			ajax_pwd=false;
        		}
        	}
        });


        let ta = document.querySelector("#abtinput");

        ta.addEventListener("keyup", function() {
            if (ta.value.length > 200) {
                alert("200자로 제한");
                ta.value = ta.value.substr(0, 200);
                document.querySelector(".pagec").innerText = ta.value.length + "/200";
            }
        })

        ta.addEventListener("keydown", function() {
            document.querySelector(".pagec").innerText = ta.value.length + "/200";

        })

        $(function() {
            // 파일 드롭 다운
            fileDropDown();
        });



        if (!error) $(".lodingback").hide();
    });


    // 등록 가능한 파일 사이즈 MB
    
   
	
	
    document.querySelector(".file").addEventListener('change', function() {
        file = this.files[0];
        selectFile(file);
    });
    // 파일 드롭 다운
    function fileDropDown() {
        var box = $(".box")
        var dropZone = $("#dropZone");
        //Drag기능 
        dropZone.on('dragenter', function(e) {
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            box.css('background-color', 'rgb(255,0,0)');
        });
        dropZone.on('dragleave', function(e) {
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            box.css('background-color', 'rgb(66,66,66)');
        });
        dropZone.on('dragover', function(e) {
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            box.css('background-color', 'rgb(255,0,0)');
        });
        dropZone.on('drop', function(e) {
            e.preventDefault();
            // 드롭다운 영역 css
            box.css('background-color', 'rgb(66,66,66)');

            file = e.originalEvent.dataTransfer.files[0];
            if (file != null) {
                if (file.length < 1) {
                    alert("폴더 업로드 불가");
                    return;
                }

                selectFile(file);

            } else {
                alert("ERROR");
            }
        });
    }

    // 파일 선택시
    function selectFile(fileObject) {
        var file = fileObject;
    
        if (file != null) {
            // 파일 이름
            var fileName = file.name;
            var fileNameArr = fileName.split("\.");
            // 확장자
            var ext = fileNameArr[fileNameArr.length - 1];
            // 파일 사이즈(단위 :MB)
            var fileSize = file.size / 1024 / 1024;

            if ($.inArray(ext.toLowerCase(), ['jpg', 'png', 'gif', 'bmp']) >= 0) {
                var pro = document.querySelector(".pro");
                pro.style.backgroundImage = "url('" + URL.createObjectURL(file) + "')";
                document.querySelector(".imginit").classList.remove("ndisp");
    			document.querySelector(".filebox").classList.add("ndisp");
    	        $(".bor").css('opacity', '0');
    	        document.querySelector(".probox").classList.remove("z");
            } else if (fileSize > uploadSize) {
                // 파일 사이즈 체크
                alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
            } else {
                alert("등록 불가 확장자");


            }

        } else {
            alert("ERROR");
        }
    }


    // 파일 등록
    function uploadFile() {
       if(ajax_pwd&&ajax_nm){
    	   var formData = new FormData();
           if (file != null) {
               formData.append('mfile', file);
               formData.append("profile","1");
           }else{
        	   if(document.querySelector(".pro").style.backgroundImage==""){
        		   formData.append("profile","0");
        	   }else{
        		   formData.append("profile","1");
        	   }
           }
           formData.append("email",document.querySelector("#email").value);
           formData.append("name",document.querySelector("#nameinput").value);
           formData.append("aboutMe",document.querySelector("textarea").value);
           
           formData.append("pwd",document.querySelector("#pwdinput").value);
           $(".lodingback").show();
       	  var request = $.ajax({
                 url: "/profile.do",
                 processData:false,
                 contentType:false,
                 beforeSend: function(xhr){
               	xhr.setRequestHeader(csrf_name,csrf_token);  
                 },
                 method: "POST",
                 data: formData,
                 dataType: "html"
               });

               request.done(function( msg ) {
            	   $(".lodingback").hide();
            	   if(msg ==-1){
            		   alert("Error")
            	   }else{
            		   alert("Please Try Again The Login for Changing Your Details")
            		   
            		   var request2 = $.ajax({
                           url: "/logout",
                           beforeSend: function(xhr){
                         	xhr.setRequestHeader(csrf_name,csrf_token);  
                           },
                           method: "POST",
                         });
            		   request2.done(function( msg ) {
            			   location.href="http://www.applabo.xyz";
            			   
            			   
            		   });
            	   }
            	   
               });

               request.fail(function( jqXHR, textStatus ) {
  
               });
       }
       
            
    }
    

</script>

</html>
