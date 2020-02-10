////////////////커피팝업 시작/////////////////////
$(".coffeeDetail").click(function(){
	var id=$(this).attr("param");
	console.log(id);
	loadDetailPopup(id);
});

$(".detailPoupClose button").click(function(){
	$(".detailPopupItem").empty();
	$("#modal").removeClass("active");
});

async function loadDetailPopup(id){
	
	let response=await fetch("/coffee/detail/"+id)
	let detail=await response.json();
	
	let detailBox= makeDetailBox(detail);
	$("#modal .detailPopupItem").append(detailBox);
	
	$("#modal").addClass("active");
}

function makeDetailBox(detail){
	let detailBox=`<form action="/mypage/coffeeSave/${detail.id}" method="post" style="text-align:center;">`
	detailBox+=`<img src="${detail.image}" style="width:250px; height:250px; margin:0 auto;">`
	detailBox+=`<hr><input type="hidden" name="name" value="${detail.name}">`
	detailBox+=`<input type="hidden" name="price" value="${detail.price}">`
	detailBox+=`<div style="font-weight:bolder; font-size:15px;">${detail.name}</div>`
	detailBox+=`<div style="margin-top:10px;">${detail.price}원&ensp;`
	detailBox+=`<button style="width:80px; height:30px; border:1px solid #777; border-radius: 3px; margin:15px 0; background-color: #fff; margin-left:12px;">내 상품 등록</button></div><hr>`
	detailBox+=`</form>`
	return detailBox;
}
////////////////커피팝업 끝/////////////////////

////////////////음료팝업 시작/////////////////////
$(".drinkDetail").click(function(){
	var id=$(this).attr("param");
	console.log(id);
	loadDetailPopup2(id);
});

$(".detailPoupClose button").click(function(){
	$(".detailPopupItem").empty();
	$("#modal").removeClass("active");
});

async function loadDetailPopup2(id){
	
	let response=await fetch("/menu/detail/"+id)
	let detail=await response.json();
	
	let detailBox= makeDetailBox2(detail);
	$("#modal .detailPopupItem").append(detailBox);
	
	$("#modal").addClass("active");
}

function makeDetailBox2(detail){
	let detailBox=`<form action="/mypage/bevSave/${detail.id}" method="post" style="text-align:center;">`
	detailBox+=`<img src="${detail.image}" style="width:250px; height:250px; margin:0 auto;"><hr><input type="hidden" name="name" value="${detail.name}">`
	detailBox+=`<input type="hidden" name="price" value="${detail.price}">`
	detailBox+=`<div style="font-weight:bolder; font-size:15px;">${detail.name}</div><div style="margin-top:10px;">${detail.price}원&ensp;<button style="width:80px; height:30px; border:1px solid #777; border-radius: 3px; margin:15px 0; background-color: #fff; margin-left:12px;">내상품 등록</button></div><hr>`

	return detailBox;
}
////////////////음료팝업 끝/////////////////////

////////////////카드팝업 시작/////////////////////
$(".cardDetail").click(function(){
	var id=$(this).attr("param");
	console.log(id);
	loadDetailPopup3(id);
});

$(".detailPoupClose button").click(function(){
	$(".detailPopupItem").empty();
	$("#modal").removeClass("active");
});

async function loadDetailPopup3(id){
	
	let response=await fetch("/menu/card/detail/"+id)
	let detail=await response.json();
	
	let detailBox= makeDetailBox3(detail);
	$("#modal .detailPopupItem").append(detailBox);
	
	$("#modal").addClass("active");
}

function makeDetailBox3(detail){
	let detailBox=`<form action="/mypage/cardSave/${detail.id}" method="post" style="text-align:center;">`
	detailBox+=`<input type="hidden" name="image" value="${detail.image}"><img src="${detail.image}" style="width:250px; height:250px; margin:0 auto;"><hr>`
	detailBox+=`<input type="hidden" name="name" value="${detail.name}"><div style="font-weight:bolder; font-size:15px;">${detail.name}`
	detailBox+=`&ensp;<button style="width:80px; height:30px; border:1px solid #777; border-radius: 3px; margin:15px 0; background-color: #fff; margin-left:12px;">내카드 등록</button></div><hr></form>`
	return detailBox;
}
////////////////카드팝업 끝/////////////////////

////////////////내게어울리는커피 팝업 시작/////////////////////
$(".favorite").click(function(){
	var id=$(this).attr("param");
	console.log(id);
	loadDetailPopup4(id);
});

$(".detailPoupClose button").click(function(){
	$(".detailPopupItem").empty();
	$("#modal").removeClass("active");
});

async function loadDetailPopup4(id){
	
	let response=await fetch("/coffee/detail/"+id)
	let detail=await response.json();
	
	let detailBox= makeDetailBox4(detail);
	$("#modal .detailPopupItem").append(detailBox);
	
	$("#modal").addClass("active");
}

function makeDetailBox4(detail){
	let detailBox=`<form action="/mypage/coffeeSave/${detail.id}" method="post" style="text-align:center;">`
		detailBox+=`<img src="${detail.image}" style="width:250px; height:250px; margin:0 auto;">`
		detailBox+=`<hr><input type="hidden" name="name" value="${detail.name}">`
		detailBox+=`<input type="hidden" name="price" value="${detail.price}">`
		detailBox+=`<div style="font-weight:bolder; font-size:15px;">${detail.name}</div>`
		detailBox+=`<div style="margin-top:10px;">${detail.price}원&ensp;`
		detailBox+=`<button style="width:80px; height:30px; border:1px solid #777; border-radius: 3px; margin:15px 0; background-color: #fff; margin-left:12px;">내상품 등록</button></div><hr>`
		detailBox+=`</form>`
	return detailBox;
}

////////////////내게어울리는커피 팝업 끝/////////////////////