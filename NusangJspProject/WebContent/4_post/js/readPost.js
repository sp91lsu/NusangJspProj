(function() {

	var modal;

	$("#buy_reservationBtn_submit").click(function() {
		console.log("buy_reservationBtn_submit");

		modal = $('#modal_reservation');
		$(modal).modal("show");
	})

	var modalreserY = $('#modal_reservation #modalY');
	$(modalreserY)
			.click(
					function(e) {

						$(modal).modal('hide').data('bs.modal', null);

						$('#modal_reservation')
								.on(
										'hidden.bs.modal',
										function() {
											$
													.ajax({

														url : "/post/buy_reservation",
														type : "POST",
														data : {
															reser_price : $(
																	"#reser_price")
																	.val(),
															reser_postno : $(
																	"#postno")
																	.val()
														},
														success : function(data) {

															if (data == 1) {
																alert("구매신청이 완료되었습니다.");
																location.href = "/post/readPost?postno="
																		+ $(
																				"#postno")
																				.val();
															} else {
																alert("구매신청에 실패하였습니다.");
															}

														}

													})
										})
					});

	$("#delete_reservation").click(function() {

		modal = $('#modal_delete_reservation');

		$(modal).modal("show");

	});

	var modalY_delete_reser = $('#modal_delete_reservation #modalY');
	$(modalY_delete_reser).click(
			function(e) {

				$.ajax({

					url : "/post/delete_reservation",
					type : "POST",
					data : {
						reserno : $("#delete_reservation").val(),
						postno : $("#postno").val()
					},
					success : function(data) {

						if (data == 1) {
							alert("예약 취소가 완료되었습니다.");
							location.href = "/post/readPost?postno="
									+ $("#postno").val();
						} else {
							alert("예약 취소에 실패하였습니다.");
						}

					}

				})

				$(modal).modal('hide').data('bs.modal', null);
			});

	var sendUrl;
	var toggleWatch;
	console.log($("#isWatchPost").val());
	console.log($("#isWatchPost").val());
	console.log($("#isWatchPost").val());
	function toggleWatchList(isWatchlist) {
		if (isWatchlist == true) {
			console.log("찜하기상태")
			sendUrl = "post/delete_watchlist"
			$("#heart_icon").attr('class', 'fas fa-heart');
			$("#heart_icon").css("color", "red");
			toggleWatch = true;
		} else {
			console.log("찜하기X")
			sendUrl = "post/set_watchlist"
			$("#heart_icon").attr('class', 'far fa-heart');
			$("#heart_icon").css("color", "black");
			toggleWatch = false;
		}
	}

	toggleWatchList($("#isWatchPost").val() == "true");
	var watchCnt = Number($("#watchCnt").val());
	$("#heart_icon").click(function() {

		$.ajax({

			url : sendUrl,
			type : "POST",
			data : {
				postno : $("#postno").val()
			},
			success : function(data) {

				var jData = JSON.parse(data);
				console.log(data);

				if (jData.result > 0) {
					if (toggleWatch == true) {
						toggleWatchList(false);
						watchCnt -= 1;
					} else {
						alert("관심목록에 추가되었습니다.");
						watchCnt += 1;
						toggleWatchList(true);
					}
					$("#post_interest").text("관심 [" + watchCnt + "]");
				} else {
					alert("관심목록 수정 실패.");
				}

			}

		})

	})

})()

function chkDelete(postno) {

	var modal = $('#modal_refund');

	$(modal).modal("show");

	var modalY = $('#modal_refund #modalY');
	console.log($(modalY).text());
	$(modalY).click(function(e) {
		$(modal).modal('hide').data('bs.modal', null);
		location.href = '/post/deletePost?postno=' + postno;
	})
}


//가격제시 폼검사(빈칸x)
$("#buy_reservationBtn").click(function(){
	
	 var reser_price = document.getElementById('reser_price').value;
	
	 if(!reser_price){
		alert('제시가격을 입력해 주세요.');
		return;
	} 
	$("#buy_reservationBtn_submit").click();
	 
});