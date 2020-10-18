(function() {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp11398251'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	// card(신용카드)
	// trans(실시간계좌이체)
	// vbank(가상계좌)
	// phone(휴대폰소액결제)
	// samsung(삼성페이 / 이니시스, KCP 전용)
	// kpay(KPay앱 직접호출 / 이니시스 전용)
	// kakaopay(카카오페이 직접호출 / 이니시스, KCP, 나이스페이먼츠 전용)
	// payco(페이코 직접호출 / 이니시스, KCP 전용)
	// lpay(LPAY 직접호출 / 이니시스 전용)
	// ssgpay(SSG페이 직접호출 / 이니시스 전용)
	// tosspay(토스간편결제 직접호출 / 이니시스 전용)
	// cultureland(문화상품권 / 이니시스, LGU+, KCP 전용)
	// smartculture(스마트문상 / 이니시스, LGU+, KCP 전용)
	// happymoney(해피머니 / 이니시스, KCP 전용)

	// IMP.request_pay({
	// pg : 'inicis', // version 1.1.0부터 지원.
	// pay_method : 'card',
	// merchant_uid : '따이따잇',
	// name : '주문명:결제테스트',
	// amount : 100,
	// buyer_email : 'iamport@siot.do',
	// buyer_name : '구매자이름',
	// buyer_tel : '010-1234-5678',
	// buyer_addr : '서울특별시 강남구 삼성동',
	// buyer_postcode : '123-456',
	// m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	// }, function(rsp) {
	// if (rsp.success) {
	// var msg = '결제가 완료되었습니다.';
	// msg += '고유ID : ' + rsp.imp_uid;
	// msg += '상점 거래ID : ' + rsp.merchant_uid;
	// msg += '결제 금액 : ' + rsp.paid_amount;
	// msg += '카드 승인번호 : ' + rsp.apply_num;
	// } else {
	// var msg = '결제에 실패하였습니다.';
	// msg += '에러내용 : ' + rsp.error_msg;
	// }
	// alert(msg);
	// });

	// 환불
	function cancelPay() {

		console.log("환불하기");
		jQuery.ajax({
			"url" : "/payment/refund",
			"type" : "POST",
			"contentType" : "application/json",
			"charset" : "utf-8",
			"data" : JSON.stringify({
				"merchant_uid" : "merchant_1602958478736", // 주문번호
				"cancel_request_amount" : 100, // 환불금액
				"reason" : "테스트 결제 환불", // 환불사유
			// "refund_holder" : "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
			// "refund_bank" : "88", // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(ex.
			// // KG이니시스의
			// // 경우 신한은행은 88번)
			// "refund_account" : "56211105948400", // [가상계좌 환불시 필수입력] 환불
			// 수령계좌
			// 번호
			}),
			"dataType" : "json",
			success : function(data) {
				// 서버로부터 정상적으로 응답이 왔을 때 실행
				console.log("응답 성공 " + data);
			},
			error : function(err) {
				// 서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
				console.log("응답 실패 " + err);
			}

		});
	}

	var cancelBtn = document.getElementById("cancelPay");
	console.log("환불버튼");
	cancelBtn.addEventListener("click", cancelPay);
})();
