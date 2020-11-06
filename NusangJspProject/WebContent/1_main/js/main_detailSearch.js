$(function(){
	//초기 프론트 세팅
	var h1 = $("#searchBar").css("height");
	var int_h1 = parseInt(h1);
	var h1px = int_h1+10+"px";
	$("#detailSearch-pop").css("top",h1px);
	
	var distance = $("#distance").val();
	$("#dong"+distance).attr("checked","checked");
	
	//함수 세팅
	var isUser = $("#isUser").length;
	$("#searchBtn").click(function(){
		doSearch(isUser);
	});
	
	$("#detailSearchForm").submit(function(){
		doSearch(isUser);
	});
	
	$("#chooseAll").click(function(){
		chooseAll();
	});
	
	$("#closeBtn").click(function(){
		$("#detailSearch-pop").hide();
		
		var cd = $("#caretdown");
		var cu = $("#caretup");
		if(cu.css("display")=="inline-block"){
			cd.css("display","inline-block");
			cu.css("display","none");
		}
	});
	
	$('#searchBar').keypress(function(event){
     if ( event.which == 13 ) {
         $('#searchBtn').click();
         return false;
     }
});
	
});

function doSearch(isUserr){
	var isUser = isUserr;
	var vv = $("#searchBar").val();
	if(vv == ""){
		alert("''에 대한 검색결과가 없습니다. \n검색어를 입력해주세요.");
		return false;
	}
	if(isUser == 0){
		location.href="/search0?searchWord="+vv;
	}else{
		var checkedCates = $("input[name='category']:checked");
		if(checkedCates.length == 0){
			alert("적어도 한 개 이상의 카테고리를 선택해주세요.");
			return false;
		}
		$("#searchWord").val(vv);
		$("#submitBtn").trigger("click");
		
		
	}
}

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

function whenUserNN(){
	
}

