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
	let detailBox=`<form action="/mypage/coffeeSave/${detail.id}" method="post">`
	detailBox+=`<img src="${detail.image}"><input type="hidden" name="name" value="${detail.name}">`
	detailBox+=`<div>${detail.name}</div>${detail.price}원 <button>내상품 등록</button></form>`

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
	let detailBox=`<form action="/mypage/bevSave/${detail.id}" method="post">`
	detailBox+=`<img src="${detail.image}"><input type="hidden" name="name" value="${detail.name}">`
	detailBox+=`<div>${detail.name}</div><div>${detail.price}원</div><button>내상품 등록</button>`

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
	let detailBox=`<form action="/mypage/cardSave/${detail.id}" method="post">`
	detailBox+=`<input type="hidden" name="image" value="${detail.image}"><img src="${detail.image}">`
	detailBox+=`<input type="hidden" name="name" value="${detail.name}"><div>${detail.name}</div>`
	detailBox+=`<button>내카드 등록</button></form>`
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
	let detailBox=`<form action="/mypage/coffeeSave/${detail.id}" method="post">`
	detailBox+=`<img src="${detail.image}"><input type="hidden" name="name" value="${detail.name}">`
	detailBox+=`<div>${detail.name}</div>${detail.price}원 <button>내상품 등록</button></form>`

	return detailBox;
}
////////////////내게어울리는커피 팝업 끝/////////////////////