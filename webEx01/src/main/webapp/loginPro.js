// 타이틀 누르면 링크이동 => 본 페이지로 이동
document.querySelector('#title').addEventListener('click', e => {
	location.href = 'login.jsp';
});

// 들어오자마자 쿠키 확인
checkCookie();

// 회원가입 버튼 링크
document.querySelector(".regist").addEventListener('click', e => {
	location.href = "join_agree.jsp";
});

function checkVal(form) {
	const id = document.querySelector('#id').value;
	const pw = document.querySelector('#pw').value;
	const message = document.querySelector('#message');

	const date = new Date();
	date.setTime(date.getTime + (1000 * 60 * 5)); // 파기시간 5분
	if (id !== "" && pw !== "") {
		// 쿠키 저장
		if (form.remember.checked === true) {
			document.cookie = `${id}=${pw}; expire=${date.toUTCString()}; path=/`;
			console.log('쿠키 저장 완료!');
			alert('쿠키 저장 완료!');
		}

		alert('로그인 성공!'); // id,pw 검증 기능 없음 
		message.innerHTML = '';
	}
	else {
		message.innerHTML = '아이디 또는 패스워드가 입력되지 않았습니다';
	}
}

// 쿠키 있으면 id에 셋팅
function checkCookie() {
	const id = document.querySelector('#id');
	const pw = document.querySelector('#pw');
	
	const getId = document.cookie.split('=');
	if (getId[0] !== "") {
		console.log(`[쿠키데이터] id: ${getId[0]} pw:${getId[1]}`);
		id.value = `${getId[0]}`;
		pw.value = `${getId[1]}`;
		console.log('쿠키 불러오기 완료');
	}
	else {
		console.log('쿠키없음');
	}
}