(function() {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp11398251'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	$("#buyBtn").click(testBuyProduct);

	
	function testBuyProduct(){
		$("#pm_merchant_uid").val("merach");
		$("#pm_imp_uid").val("uiduid");
		$("#pm_paid_amount").val(123123);
		document.createPostForm.submit();
	}
	
	
	function buyProduct() {

		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : uuidv4(),
			name : '주문명:판매게시글 등록',
			amount : 100,
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;


				alert(msg);
				
				$("#pm_merchant_uid").val(rsp.merchant_uid);
				$("#pm_imp_uid").val(rsp.imp_uid);
				$("#pm_paid_amount").val(rsp.paid_amount);
				document.createPostForm.submit();
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}

		});

	}

	// 랜덤 uuid생성
	function uuidv4() {
		return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,
				function(c) {
					var r = Math.random() * 16 | 0, v = c == 'x' ? r
							: (r & 0x3 | 0x8);
					return v.toString(16);
				});
	}

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
				"reason" : "결제 환불", // 환불사유
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

	/*
	 * var cancelBtn = document.getElementById("cancelPay");
	 * console.log("환불버튼"); cancelBtn.addEventListener("click", cancelPay);
	 */
})();
