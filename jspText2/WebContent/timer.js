/**
 * 세션 종료 코드
 */

let minutes = 0;
let seconds = 10;
let timer;

function startTimer() {
	timer = setInterval(function() {
		seconds--;
		if (seconds < 0) {
			minutes--;
			seconds = 59;
		}

		if (minutes == 0 && seconds == 0) {
			clearInterval(timer);
			alert('세션이 만료되었습니다.');
			window.location.href = "logout.jsp";
		}

		document.getElementById("timer").innerHTML = "남은 시간: " + minutes + " 분 " + (seconds < 10 ? "0" : "") + seconds + " 초";
	}, 1000);
}

document.getElementById("startButton").addEventListener("click", function() {
	minutes = 0;
	seconds = 10;
});

startTimer();