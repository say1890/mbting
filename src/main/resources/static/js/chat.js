
let username =  document.querySelector("#username").innerHTML;

let roomNum = document.querySelector("#roomNum").innerHTML;

history.replaceState({},null,location.pathname);
// SSE 연결하기
const eventSource = new EventSource(`http://localhost:8080/chat/roomNum/${roomNum}`);
eventSource.onmessage = (event) => {
	const data = JSON.parse(event.data);
	if (data.sender === username) { // 로그인한 유저가 보낸 메시지
		// 파란박스(오른쪽)
		initMyMessage(data);
	} else {
		// 회색박스(왼쪽)
		initYourMessage(data);
	}
	
	let createdAt =  data.createdAt.substring(0,10) // 날짜
	let countMsg = 1;
	

}

// 내가 보낸 메시지
function getSendMsgBox(data) {

	let md = data.createdAt.substring(5, 10)
	let hour = data.createdAt.substring(11, 13) // 시
	
	let convertedHour = hour>12?hour%12:hour
	let minute = data.createdAt.substring(14, 16)
	let division = hour<12 ? "오전 " : "오후 "
	//(11, 16)
	let convertTime = division + convertedHour + ":" + minute  

	return `<div class="sent_msg">
	<p>${data.msg}</p>
	<span class="time_date"> ${convertTime}  </span>
</div>`;
}

// 상대가 보낸 메시지
function getReceiveMsgBox(data) {

	let md = data.createdAt.substring(5, 10)
	let hour = data.createdAt.substring(11, 13) // 시
	let convertedHour = hour>12?hour%12:hour
	let minute = data.createdAt.substring(14, 16)
	let division = hour<12 ? "오전 " : "오후 "
	//(11, 16)
	let convertTime = division + convertedHour + ":" + minute 
	
	
	return `<div class="received_withd_msg">
	
	<p>${data.msg}</p>
	<span class="time_date"> ${convertTime}  </span>
</div>`;
}

// 최초 초기화될 때 1번방 3건이 있으면 3건을 다 가져옴
// addMessage() 함수 호출시 DB에 insert 되고, 그 데이터가 자동으로 흘러들어온다(SSE)
// 파란박스 초기화하기
function initMyMessage(data) {
	let chatBox = document.querySelector("#chat-box");

	let sendBox = document.createElement("div");
	sendBox.className = "outgoing_msg";

	sendBox.innerHTML = getSendMsgBox(data);
	chatBox.append(sendBox);

	document.documentElement.scrollTop = document.body.scrollHeight;
}

// 회색박스 초기화하기
function initYourMessage(data) {
	let chatBox = document.querySelector("#chat-box");

	let receivedBox = document.createElement("div");
	receivedBox.className = "received_msg";

	receivedBox.innerHTML = getReceiveMsgBox(data);
	chatBox.append(receivedBox);

	document.documentElement.scrollTop = document.body.scrollHeight;
}

// AJAX 채팅 메시지를 전송
async function addMessage() {
	let msgInput = document.querySelector("#chat-outgoing-msg");

	let chat = {
		sender: username,
		roomNum: roomNum,
		msg: msgInput.value
	};

	fetch("http://localhost:8080/chat", {
		method: "post", //http post 메서드 (새로운 데이터를 write)
		body: JSON.stringify(chat), // JS -> JSON
		headers: {
			"Content-Type": "application/json; charset=utf-8"
		}
	});

	msgInput.value = "";
}

// 버튼 클릭시 메시지 전송
document.querySelector("#chat-outgoing-button").addEventListener("click", () => {
	addMessage();
});

// 엔터를 치면 메시지 전송
document.querySelector("#chat-outgoing-msg").addEventListener("keydown", (e) => {
	if (e.keyCode === 13) {
		addMessage();
	}
});