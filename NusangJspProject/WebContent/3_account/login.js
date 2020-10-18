Kakao.init('1db6aaded4b028f19067fca5394bb829');

// SDK 초기화 여부를 판단합니다.
console.log(Kakao.isInitialized());

function kakaoLogin() {

	Kakao.Auth.authorize({
		redirectUri : 'http://localhost:8787/user/kakaologin'
	});
}
