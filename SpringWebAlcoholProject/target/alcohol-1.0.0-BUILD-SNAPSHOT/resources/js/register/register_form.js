let isEmailValid;
function email_check(event) {
    isEmailValid = true;
    let input_user_email = this.value;
    let check_user_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

    if (!check_user_email.test(input_user_email)) {
        isEmailValid = false;
    }
    if (isEmailValid) {
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
    } else {
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
        event.stopPropagation();
    }
} // end of email_check()

// email(ID) validity
document.querySelector("#user1_email").addEventListener("input", email_check);

let isPwdValid;
function pwd_check() {
    isPwdValid = true;
    let input_user_pwd = this.value;
    let check_user_pwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}/;

    if (!check_user_pwd.test(input_user_pwd)) {
        isPwdValid = false;
    }

    if (isPwdValid) {
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
    } else {
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
    }
} // end of pwd_check()

// pwd validity
document.querySelector("#user1_pwd").addEventListener("input", pwd_check);

let isPwdCheckValid;
function pwd_check_check() {
    isPwdCheckValid = true;
    let input_user_pwd_check = this.value;
    let input_user_pwd = document.getElementById("user1_pwd").value;

    if (input_user_pwd_check != input_user_pwd) {
        isPwdCheckValid = false;
    }

    if (isPwdCheckValid) {
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
    } else {
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
    }
} // end of pwd_check_check()

// pwd_check validity
document.querySelector("#user_pwd_check").addEventListener("input", pwd_check_check);

let isNameValid;
function name_check() {
    isNameValid = true;
    let input_user_name = this.value;
    let check_user_name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
    if (!check_user_name.test(input_user_name)) {
        isNameValid = false;
    }

    if (isNameValid) {
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
    } else {
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
    }

} // end of name_check()

// user_name validity
document.querySelector("#user1_name").addEventListener("input", name_check);

let isBirthDate;
function birthdate_check() {
    isBirthDate = true;
    let input_user_birthdate = this.value;
    let check_user_birthdate = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
    if (!check_user_birthdate.test(input_user_birthdate)) {
        isBirthDate = false;
    }

    if (isBirthDate) {
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
    } else {
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
    }
} // end of birthdate_check()

// user_birthdate validity
document.querySelector("#user1_birthdate").addEventListener("input", birthdate_check);

function send(f){
    const forms = document.querySelectorAll('.needs-validation');

    Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
            }

            // form.classList.add()
        }, false)
    })

    f.action = "register_detail_form.do";
    f.method = "post";
    f.submit();

} // end of send()






