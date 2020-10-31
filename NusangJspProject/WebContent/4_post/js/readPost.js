(function() {

	$("#buy_reservationBtn").click(
			function() {
				console.log("buy_reservationBtn")
				$.ajax({

					url : "/post/buy_reservation",
					type : "POST",
					data : {
						reser_price : $("#reser_price").val(),
						reser_postno : $("#postno").val()
					},
					success : function(data) {

						if (data == 1) {
							alert("구매신청이 완료되었습니다.");
							location.href = "/post/readPost?postno="
									+ $("#postno").val();
						} else {
							alert("구매신청에 실패하였습니다.");
						}

					}

				})

			})

	$("#delete_reservation").click(
			function() {
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

			})

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

	$("#heart_icon").click(function() {

		$.ajax({

			url : sendUrl,
			type : "POST",
			data : {
				postno : $("#postno").val()
			},
			success : function(data) {

				if (data > 0) {
					if (toggleWatch == true) {
						toggleWatchList(false);
					} else {
						alert("관심목록에 추가되었습니다.");
						toggleWatchList(true);
					}
				} else {
					alert("관심목록 수정 실패.");
				}

			}

		})

	})
})()

function chkDelete(postno) {
	location.href = '/post/deletePost?postno=' + postno;
}
