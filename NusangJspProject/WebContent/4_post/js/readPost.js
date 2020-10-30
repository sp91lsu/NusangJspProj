(function() {

	$("#buy_reservationBtn").click(function() {
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

$('#resvBtn')
.click(
	function(){ 
		$(this).parent().siblings().children('button').attr('disabled','disabled');
		$(this).html('예약됨');
		$(this).parent().append()
		}
);

function get_korean_money(strNo){
   strNo = strNo.replace(/[^0-9.]/g, "");

   var arr = ['','만','억','조','경']
   var nNo = parseInt(strNo);
   var i = 0;
   var n = 0;
   var retNo = "";

  while (nNo > 1) {
    n = (nNo % 10000);
    if (n > 0) {
      if (retNo == ""){
         retNo = n + arr[i];
      }
      else {
         retNo = n.toString() + arr[i] + " " + retNo;
      }
    }
  nNo  = (nNo  / 10000);
  i = i + 1;
  }
  if (retNo == "") {
    retNo = "0";
  }
  return retNo;
 }

