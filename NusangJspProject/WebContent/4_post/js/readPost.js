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

})()

function chkDelete(postno) {
	location.href = '/post/deletePost?postno=' + postno;
}
