
$('.star span').click(function() {
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
        return false;
    });


function showPointLayer() {
    let c=document.getElementById("pointLayer");
    if(c) {
        if(c.style.display !="block") {
            c.style.display="block";
        }

        else {
            c.style.display="none";
        }
    }
}

 function checklogin(loginURL, id) {
        if (gaia.commentWrite.user_login_info == 0) {//유저로그인
            if (confirm("로그인 하시겠습니까?")) {
                top.location = loginURL + escape(parent.document.location.href);
            } else {
                document.getElementById(id).value = '';
                document.getElementById(id).blur();
            }
        }
    }



