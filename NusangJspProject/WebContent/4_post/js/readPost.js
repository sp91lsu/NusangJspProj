(function() {

	$(buy_reservationBtn).click(function() {
		console.log("buy_reservationBtn")
		$.ajax({

			url : "/post/buy_reservation",
			type : "POST",
			data : {
				reser_price : $(reser_price).val(),
				reser_postno : $(reser_postno).val()
			},
			success : function(data) {

				if (data == 1) {
					alert("구매신청이 완료되었습니다.");
				} else {
					alert("구매신청에 실패하였습니다.");
				}

				
			}

		})

	})

})()

function chkDelete(postno) {
	location.href='<%= ConAsist.SERVLET_DELETEPOST %>?postno='+postno;
}