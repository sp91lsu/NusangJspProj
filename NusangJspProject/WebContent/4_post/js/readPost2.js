



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

/*(function(){
	$('#resvBtn')
	.click(
		function(){ 
			$(this).parent().siblings().children('button').attr('disabled','disabled');
			$(this).html('예약됨');
			$(this).parent().append()
			}
	);
	alert('시작');
	$('#resvList li').each(function() {
		var moneyValue = $('input').val();
		var moneyResult = get_korean_money(moneyValue);
		$('span').html(moneyResult);
	})
})()*/
