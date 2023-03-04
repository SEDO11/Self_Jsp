/**
 * 세션 종료 코드
 크롬에서는 제대로 동작이 안되니 엣지로 브라우저를 바꿔서 실행바람
 */

let min = 10;
let sec = 0;
let timer;

function startTimer() {
  timer = setInterval(function() {
    console.log(min + "분, " + sec + "초 ");
    if (sec == 0 && min == 0) {
      clearInterval(timer);
      alert('세션이 만료되었습니다.');
      window.location.href = "logout.jsp";
      return;
    }

    if (sec == 0) {
      min--;
      sec = 59;
    } else {
      sec--;
    }

    document.getElementById("timer").innerHTML = "남은 시간: " + (min < 10 ? "0" : "") +  min + " 분 " + (sec < 10 ? "0" : "") + sec + " 초";
  }, 1000);
}

document.getElementById("startButton").addEventListener("click", function() {
  min = 10;
  sec = 0;
  clearInterval(timer);
  startTimer();
});

startTimer();