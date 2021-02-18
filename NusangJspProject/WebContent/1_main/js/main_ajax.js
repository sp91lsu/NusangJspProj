//비동기 검색 함수
function doSearch_Ajax(isUser,isStart){
	//카테고리 유효성 체크
	var checkedCates = $("input[name='category']:checked");
	if(checkedCates.length == 0){
		alert("적어도 한 개 이상의 카테고리를 선택해주세요.");
		return false;
	}
		
	var keyword = $("#searchBar").val();
	if(keyword.trim() == '') keyword = "";
	var params = null;
	console.log("keyword: "+keyword);
	console.log("isStart: "+isStart);

	//로그인 상태 (새로고침 or 상세검색)
	if(isUser != 0){
		$("#searchWord").val(keyword);
		params = $("#detailSearchForm").serialize();
	//로그아웃 상태
	}else{
		//빈칸으로 검색
		if(keyword == ""){
			if(!isStart){
				alert("검색어를 입력해주세요.");
				params = "searchWord=" + keyword;
				return;
			//초기로딩(or새로고침)
			}else{
				$("#searchWord").val(keyword);
				params = "isStart=true";
			}
		//키워드 검색
		}else{
			params = "searchWord=" + keyword;
		}
	}
	console.log("params: "+params);
	
	//PostList 받아오기
	$.ajax({
		url :  "list.ajax",
		type : "POST",
		data : params,
		success : function(data, status){
			if(status == "success"){
				console.log("list.ajax Success!")				
				console.log(data)				
				pListAjax(data);
			} 
		}
	 });
	
	//필터창 닫기
	$("#caretdown").css("display","inline-block");
	$("#caretup").css("display","none");
	$("#detailSearch-pop").css("display","none");
	
} // end doSearch_Ajax();


//함수 parseJSON(미완성)에 대한 대안책
//postListAjax.jsp에 PostList를 보낸 뒤, 생성된 html -> main.jsp 에 끼워넣기
function pListAjax(jsonObj){
	var str = JSON.stringify(jsonObj);
	$.post(
		"/1_main/postListAjax.jsp",
		"json="+str,
		function(htmlResult){
			console.log("pListAjax_Html_Response Success!")	
			$('#postListSection').html(htmlResult);
		}
	)
}


//미완성
//자바스크립트에 html태그를 한땀한땀 건들어 만드는 기분이들어 미완성으로 두고 다른 방법을 찾음. -dosearch_ajax(이미 만들어져있는 jsp 페이지의 html을 이용하는 방법)
function parseJSON(jsonObj){
	var pList = jsonObj.pList; //AjaxPostListJSON.java - List<Post> list
	var listTag = "";
	//검색결과 없을 때 
	if(pList.length == 0){
		listTag = `<div id="whenPostZero" class="d-flex justify-content-center align-items-center">
						<span>검색결과가 없습니다.</span>				
					</div>`;
	//검색결과 있을 때
	}else{
		//포스트 리스트
		for (var i = 0; i < pList.length; i++) { 
			// pList[i] : <각 포스트 카드 1개>
			
			listTag += `<div id="postCard" style = "margin-bottom: 30px;">`;
			
			//이미지
				//이미지 있을 때
				if(pList[i].post_picture.getList()[0] != ""){
					
					listTag += `<img id="card_img" 
									alt="product image"
									src="/upload/${pList[i].post_picture.getList()[0]}"
									class="rounded-bottom"
									style="height: 150px; margin-bottom: 0px; box-shadow: 0px 0px 7px 1px #EAEAEA;">`;
				//이미지 없을 때
				}else{
					 
					listTag += `<img id="card_img" 
									alt="default image" 
									src="/img/noImg.png"
									class="rounded-bottom"
									style="height: 150px; margin-bottom: 0px; box-shadow: 0px 0px 7px 1px #EAEAEA">`;
				}
			
			//상품정보
			listTag += `<div style="box-shadow: 0px 0px 3px 1px #EAEAEA;">`;
				//제목
				listTag += `<h6 id="card_title" style="padding-top: 20px; padding-bottom: 5px; font-family: 'Noto Sans KR', sans-serif; font-size: 15px; padding-left: 7px;">`;
					//길어서 축소
					if(pList[i].title.length() > 12){
						var sub = substring(post.title,0,12);
						listTag += `${sub}<span style="font-weight: bold">...</span>`;
					//길지 않으면 그대로
					}else{
						listTag += `${pList[i].title}`;
					}
				listTag += `</h6>`;
				//가격
				
			
		} // end for
	}
	
	$("#listTagSection").html(listTag);

} // end parseJSON()


