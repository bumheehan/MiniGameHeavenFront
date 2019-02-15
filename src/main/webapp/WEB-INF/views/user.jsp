<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css">
</head>

<body>

    <%@ include file="header.html" %>
    
    <div class="lodingback"><img src="${pageContext.request.contextPath}/resources/res/loading.gif" alt="" class="loading"></div>
    <div class="user_box">
        <div class="logintxt">PROFILE</div>
        <div class="prof_box">
            <div class="pic_box">

                <div class="box">
                    <div class="probox">
                        <div class="pro"></div>
                    </div>
                    <div class="dropZone" id="dropZone">
                        <div class="bor">DRAG<br />AND<br />DROP</div>
                    </div>
                    <div class="filebox">
                        <input type="file" name="fileinput" class="file">
                        <label for="" class="filetxt">File Selector</label>
                    </div>

                </div>

            </div>
            <div class="info_box">
                <div>

                    <div class="inputitem">
                        <label for="">NAME:\></label>
                        <input id="nameinput" autocapitalize="off" autocomplete="off" autocorrect="off" class="p_input" maxlength="32" movefocus="true" name="name" placeholder="NAME" send="true" />

                    </div>
                    <div class="inputitem">
                        <label for="">PWD:\></label>
                        <input id="pwdinput" autocapitalize="off" autocomplete="off" autocorrect="off" class="p_input" maxlength="32" movefocus="true" name="pwd" placeholder="PASSWORD" send="true" />

                    </div>
                    <div class="inputitem">
                        <label for="">PWDCHK:\></label>
                        <input id="pwdcinput" autocapitalize="off" autocomplete="off" autocorrect="off" class="p_input" maxlength="32" movefocus="true" name="pwd" placeholder="PASSWORD CHECK" send="true" />

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
                        <textarea id="abtinput" class="t_input" name="abt" placeholder="Introduce Yourself" cols="54" rows="7" style="resize: none;"></textarea>

                    </div>
                    <button class="rbtn">SUBMIT</button>
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

    $(document).ready(function() {
        let error = false;



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
        $(".bor").css('opacity', '0');

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
                $(".bor").css('opacity', '0');

            } else {
                alert("ERROR");
            }
        });
    }

    // 파일 선택시
    function selectFile(fileObject) {
        var file = null;

        if (fileObject != null) {
            // 파일 Drag 이용하여 등록시
            file = fileObject;
        } else {
            // 직접 파일 등록시
            //files =
        }

        // 다중파일 등록
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

        var formData = new FormData(form);
        if (file != null) {
            formData.append('file', file);
        }
        formData.append("username");



    }
    

</script>

</html>
