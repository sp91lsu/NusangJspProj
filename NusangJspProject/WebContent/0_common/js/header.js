function sendNum(number){
	var result = confirm("검색 반경을 "+number+"km 로 설정하시겠습니까?");
	
	if(result){
		location.href='/myinfo/distance?num='+number;
	}else{
		
	}
	
}