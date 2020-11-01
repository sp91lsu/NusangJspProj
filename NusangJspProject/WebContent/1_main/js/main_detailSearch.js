$(function(){
	var h1 = $("#searchBar").css("height");
	var int_h1 = parseInt(h1);
	var h1px = int_h1+10+"px";
	
	$("#detailSearch-pop").css("top",h1px);
});


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

