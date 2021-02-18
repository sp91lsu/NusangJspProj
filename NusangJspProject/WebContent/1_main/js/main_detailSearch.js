//document ready
$(function(){
	//초기 프론트 세팅
	var h1 = $("#searchBar").css("height");
	var int_h1 = parseInt(h1);
	var h1px = int_h1+10+"px";
	$("#detailSearch-pop").css("top",h1px);
	
	var distance = $("#distance").val();
	$("#dong"+distance).attr("checked","checked");
	
	//초기 포스트 리스트(근방10km 최신순 모두) 불러오기
	var isStart = "true"; //초기로딩(or새로고침) 여부
	var isUser = $("#isUser").length; //로그인 여부
	doSearch_Ajax(isUser,isStart);
	
	//프론트 요소에 함수 세팅
	isStart = "false";
		//찾기버튼 -> doSearch_Ajax
	$("#searchBtn").click(function(){
		doSearch_Ajax(isUser,isStart);
	});
		//검색버튼 -> doSearch_Ajax
	$("#submitBtn").click(function(){
		doSearch_Ajax(isUser,isStart);
	});
		//검색바에서 엔터 -> doSearch_Ajax
	$('#searchBar').keypress(function(event){
     if ( event.which == 13 ) {
         $('#searchBtn').click();
         return false;
		}
     });
		//필터창 ChkBox 모두선택시 동작
	$("#chooseAll").click(function(){
		chooseAll();
	});
		//필터창 X버튼 클릭시 동작
	$("#closeBtn").click(function(){
		$("#detailSearch-pop").hide();
		
		var cd = $("#caretdown");
		var cu = $("#caretup");
		if(cu.css("display")=="inline-block"){
			cd.css("display","inline-block");
			cu.css("display","none");
		}
	});
});



//필터 버튼 클릭시 캐럿모양 변화,필터창 on/off
function doDisplay(){
	var cd = $("#caretdown");
	var cu = $("#caretup");
	var pop = $("#detailSearch-pop");
	if(cu.css("display")=="none"){
		cd.css("display","none");
		cu.css("display","inline-block");
		pop.css("display","block");
	}else{
		cd.css("display","inline-block");
		cu.css("display","none");
		pop.css("display","none");
	}
}


//모두선택 클릭시 모든 카테고리 체크박스 체크/체크해제
function chooseAll(){
	var allBtn = $("#chooseAll");
	var categories = $("input[name='category']");
	
	if(allBtn.is(":checked") == false) {
		console.log("선택->해제");
		categories.prop("checked",false);
	}else{
		console.log("해제->선택");
		categories.prop("checked",true);
	}
}

/*//검색함수 : 검색어와 검색조건들을 서버로 보냄.
function doSearch(isUserr){
	var isUser = isUserr;
	var keyword = $("#searchBar").val();

	//미로그인시 단순키워드검색
	if(isUser == 0){
		location.href="/search0?searchWord="+keyword;
	}
	//로그인시 필터적용 검색
	else{
		var checkedCates = $("input[name='category']:checked");
		if(checkedCates.length == 0){
			alert("적어도 한 개 이상의 카테고리를 선택해주세요.");
			return false;
		}
		$("#searchWord").val(keyword);
		$("#submitBtn").trigger("click");
	}
	
	$('#postListSection').load("/1_main/main2.jsp #postListSection");
	
	location.href="/1_main/main.jsp";
}

function doSearch2(isUserr){
	var isUser = isUserr;
	var keyword = $("#searchBar").val();

	//미로그인시 단순키워드검색
	if(isUser == 0){
		location.href="/search0?searchWord="+keyword;
	}
	//로그인시 필터적용 검색
	else{
		var checkedCates = $("input[name='category']:checked");
		if(checkedCates.length == 0){
			alert("적어도 한 개 이상의 카테고리를 선택해주세요.");
			return false;
		}
		$("#searchWord").val(keyword);
		$("#submitBtn").trigger("click");
	}
	
	
}*/
