/* 이미지추가 관련 스크립트 */
var i = 0;
var deleteBtn = $("<button type='button' style = 'margin-top:-3px;' class = 'btn btn-danger btn-sm' id='deleteBtn' onclick='cntdown(this)'>삭제</button>")
var btnChk;
var isSet;
var imgDiv;

$("#btnAdd")
		.click(
				function() {

					imgDiv = $("<div><input type='file' style = 'background:#BDBDBD' id='upfile"
							+ i + "' name='upfile" + i + "'/></div>")

					btnChk = document.getElementById('upfile' + (i - 1)); // 0
					if (i == 0) {
						$("#files").append(imgDiv);
						imgDiv.append(deleteBtn);
						i++;
					} else if (i < 5 && i != 0 && btnChk.value != "") {

						deleteBtn = $(deleteBtn).detach();
						$("#files").append(imgDiv);
						imgDiv.append(deleteBtn);
						i++;
					} else {
						btnChk = document.getElementById('upfile' + (i - 2)); // 0
					}

					console.log('현제:' + i);
				});
function cntdown(me) {
	$(me).parent().remove();

	i--;
	console.log('현제:' + i);
	btnChk = document.getElementById('upfile' + (i - 1))
	console.log("추가해야 하는 삭제 버튼 위치" + (i - 1))
	$(btnChk).closest("div").append(deleteBtn)

}

	
	//createPost 유효성 검사
	$("#buyBtn").click(function(){

	 	var title = createPostForm.title.value;
	 	var productName = createPostForm.productName.value;
		var category = createPostForm.category.value;
		var price = createPostForm.price.value;
		var bodytext = createPostForm.bodytext.value;
	
		if(!title){
			alert('제목을 입력해 주세요.');
			return;
		} else if(!productName){
			alert('상품명을 입력해 주세요.' );
			return;
		} else if(!category){
			alert('카테고리를 입력해 주세요.' );
			return;
		} else if(!price){
			alert('가격을 입력해 주세요.' );
			return;
		} else if(!bodytext){
			alert('내용을 입력해 주세요.' );
			return;
		}
		
		document.createPostForm.submit();
	});