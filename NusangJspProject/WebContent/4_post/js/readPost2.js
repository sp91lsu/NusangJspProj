(function() {

	$(".cancel_reser").click(
			function() {

				$.ajax({

					url : "/post/cancel_reservation",
					type : "POST",
					data : {
						"reserno" : $(this).val(),
						"postno" : $("#postno").val()
					},
					success : function(data) {

						if (data > 0) {
							alert('구매 예약이 취소되었습니다.');
							location.href = "/post/readPost?postno="
									+ $("#postno").val()
						} else {
							alert('예약 취소실패.');
						}

					}

				})
			})

	$(".resvBtn").click(
			function() {

				$.ajax({

					url : "/post/setReservation",
					type : "POST",
					data : {
						"reserno" : $(this).val(),
						"postno" : $("#postno").val()
					},
					success : function(data) {
						if (data > 0) {
							alert('구매자로 등록되었습니다.');
							location.href = "/post/readPost?postno="
									+ $("#postno").val();
						} else {
							alert('구매자가 구매를 취소하였습니다.');
							location.reload();
						}

					}

				})

				/*
				 * $(this).html("예약됨"); $(this).parent().append("<button>예약취소</button>");
				 */

				$("#button11").delay(500).trigger("click");
				$(this).parent().siblings().children("button").attr("disabled",
						"disabled");

			});

	var modal;
	var modalY = $('#modal_sell #modalY');

	$(modalY).click(
			function(e) {

				// 여기에서 예를 눌렀을 떄
				$.ajax({

					url : "/post/sell_post",
					type : "POST",
					data : {
						"reserno" : $("#sellPostBtn").val(),
						"postno" : $("#postno").val()
					},
					success : function(data) {

						if (data > 0) {
							alert('판매가 완료되었습니다.');
							location.href = "/post/readPost?postno="
									+ $("#postno").val()
						} else {
							alert('구매자가 구매를 취소하였습니다.');
							location.reload();
						}

					}

				})
				$(modal).modal('hide').data('bs.modal', null);
			});
	$("#sellPostBtn").click(function() {
		modal = $('#modal_sell');
		$(modal).modal("show");

	})

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


/* 우측 고정 영역 */
/*
$(function(){
	window.onscroll = function() {myFunction()}
	
	var navbar = $('.navbar');
	var strH0 = navbar.css.height;
	console.log(strH0);
	
	var h0 = strH0.slice(0,-2);
	var fixed_mt = $("#fixed").css("margin-top");
	var sticky = fixed_mt;
	
	console.log("navbar height: "+ h0);
	console.log("fixed margin_top: "+ fixed_mt);
	console.log(" ");
	
	function myFunction(){
		 console.log("window.pageYOffset: "+window.pageYOffset)
		 console.log("sticky: "+sticky)
		 console.log(" ")
		 if(window.pageYOffset >= sticky){
		    navbar.classList.add("sticky");
		  } else {
		    navbar.classList.remove("sticky");
		  }
	}
	
});
*/
