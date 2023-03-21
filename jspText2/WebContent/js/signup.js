/**
 * 회원가입 체크 
 */

function isValidEmail(email) {
  // 이메일 형식이 맞는지 검사하는 함수
  const emailRegex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
  return emailRegex.test(email);
}

function signUpCheck() {
  // 이메일, 비밀번호, 이름이 유효한지 검사하는 함수
  const email = document.getElementById("email").value;
  const password = document.getElementById("password").value;
  const passwordCheck = document.getElementById("passwordCheck").value;
  const name = document.getElementById("name").value;

  let isValid = true;

  // 이메일 검사
  if (!isValidEmail(email)) {
    document.getElementById("emailError").innerHTML =
      "올바른 이메일 형식이 아닙니다.";
    isValid = false;
  } else {
    document.getElementById("emailError").innerHTML = "";
  }

  // 비밀번호 검사
  if (password !== passwordCheck) {
    document.getElementById("passwordCheckError").innerHTML =
      "비밀번호가 일치하지 않습니다.";
    isValid = false;
  } else {
    document.getElementById("passwordCheckError").innerHTML = "";
  }

  // 이름 검사
  if (name.length < 2) {
    document.getElementById("nameError").innerHTML =
      "이름은 2자 이상이어야 합니다.";
    isValid = false;
  } else {
    document.getElementById("nameError").innerHTML = "";
  }

  // 회원가입 버튼 활성화/비활성화
  const signUpBtn = document.getElementById("signBtn");
  signUpBtn.disabled = !isValid;
}