$(document).ready(function (){
    // $("#modalBtn").hide();
    $("#modalBtn").trigger('click');
});

document.getElementById("user_email").addEventListener("keyup", function (e){
    if(e.keyCode === 13){
        e.preventDefault();
        document.getElementById("login").click();
    }

}); // enter 감지

document.getElementById("user_pwd").addEventListener("keyup", function (e){
    if(e.keyCode === 13){
        e.preventDefault();
        document.getElementById("login").click();
    }

}); // enter 감지

// 로그인 성공(모달 버튼)
function loginSuccess(){
    let user_email = document.getElementById("modal_email").value;
    // alert(user_email);

    location.href = "loginSuccess.do?user1_email=" + encodeURIComponent(user_email);
} // end of loginSuccess()

// 로그인 시 아이디 미스(모달 버튼)
function mismatch(modal_email, modal_pwd){
    // alert("mismatch()");

    location.href = "loginMismatch.do?modal_email=" + modal_email + "&modal_pwd=" + modal_pwd;
} // end of idMismatch()


