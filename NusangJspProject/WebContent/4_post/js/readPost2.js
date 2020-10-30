(function() {

	$(document)
			.ready(
					function() {

						$(".cancel_reser")
								.click(
										function() {

											$
													.ajax({

														url : "/post/cancel_reservation",
														type : "POST",
														data : {
															"reserno" : $(this)
																	.val(),
														},
														success : function(data) {

															if (data > 0) {
																alert('구매 예약이 취소되었습니다.');
																location.href = "/post/readPost?postno="
																		+ $(
																				"#postno")
																				.val();
															} else {
																alert('예약 취소실패.');
															}

														}

													})
										})

						$(".resvBtn")
								.click(
										function() {

											$
													.ajax({

														url : "/post/setReservation",
														type : "POST",
														data : {
															"reserno" : $(this)
																	.val(),
															"postno" : $(
																	"#postno")
																	.val()
														},
														success : function(data) {
															if (data > 0) {
																alert('구매자로 등록되었습니다.');
																location.href = "/post/readPost?postno="
																		+ $(
																				"#postno")
																				.val();
															} else {
																alert('구매자등록 실패.');
															}

														}

													})

											/*
											 * $(this).html("예약됨");
											 * $(this).parent().append("<button>예약취소</button>");
											 */

											$("#button11").delay(500).trigger(
													"click");
											$(this).parent().siblings()
													.children("button").attr(
															"disabled",
															"disabled");

										});

						$("#resvList li").each(function() {
							var moneyValue = $(this).children('input').val();
							var moneyResult = numberToKorean(moneyValue);
							$(this).children("span").html(moneyResult);
						});

						$("#button11").click(function() {
							$("#resvList").slideDown();
						});

						function abc() {
							$("#resvList").slideDown();
						}

					})
	function numberToKorean(number) {
		var inputNumber = number < 0 ? false : number;
		var unitWords = [ '', '만', '억', '조', '경' ];
		var splitUnit = 10000;
		var splitCount = unitWords.length;
		var resultArray = [];
		var resultString = '';

		for (var i = 0; i < splitCount; i++) {
			var unitResult = (inputNumber % Math.pow(splitUnit, i + 1))
					/ Math.pow(splitUnit, i);
			unitResult = Math.floor(unitResult);
			if (unitResult > 0) {
				resultArray[i] = unitResult;
			}
		}

		for (var i = 0; i < resultArray.length; i++) {
			if (!resultArray[i])
				continue;
			resultString = String(resultArray[i]) + unitWords[i] + resultString;
		}

		return resultString;
	}
})()
