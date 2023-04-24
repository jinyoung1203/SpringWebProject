$(document).ready(function (){
    // $("#modalBtn").hide();
    $("#modalBtn").trigger('click');
});



function user_login(f){
    alert("login() 실행됨");
    let user_email = f.user_email.value.trim();
    let user_pwd = f.user_pwd.value.trim();
    alert(user_email);
    alert(user_pwd);

    let url = "user_login.do";
    let param = "user_email=" + encodeURIComponent(user_email) + "&user_pwd=" + encodeURIComponent(user_pwd);
    sendRequest(url, param, resultFn, "post");

} // end of login

function resultFn(){
    if(xhr.readyState == 4 && xhr.status == 200){
        var result = xhr.responseText;
        var check;
        if(result == '로그인 성공'){
            check = 3;
        } else if(result == '비밀번호 불일치'){
            check = 4;
        } else{
            check = 5;
        }

        location.href = "login.do?check=" + check;
    }
} // end of resultFn()