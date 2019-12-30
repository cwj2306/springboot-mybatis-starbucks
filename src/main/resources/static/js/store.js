/**
 * 카카오 map API 자바스크립트 
 */

var container = document.getElementById('map');
var options = {
	center : new kakao.maps.LatLng(37.566860, 126.978686),
	level : 3
};

var map = new kakao.maps.Map(container, options);



//마커를 담을 배열입니다
var markers = [];

//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 퀵검색 상태인지 판별하는 변수
let quickSearch = true;

// DB에 있는 mycafe 목록 들고오기
let mycafe_list = []; // 비로그인, db연결 실패, 등록한 매장이 없는 경우 모두 빈 리스트임

fetch("http://localhost:8080/store_map/mycafe",{
	method:'GET',
}).then(function(response){
	return response.text();
}).then(function(result){
	
	if(result != 'not login' && result != 'fail'){
		mycafe_list = JSON.parse(result);
	}
	
});

// 현재 지도를 기준으로 검색함
searchPlaces();



// 현재 지도의 중심을 기준으로 스타벅스 검색하는 함수
function searchPlaces() {
	if(quickSearch){
		var keyword = '스타벅스';
	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    let searchBound = map.getBounds();
	    let searchLatLng = map.getCenter();
	    let searchOption = {
	    		bounds: searchBound, // 현재 보여지는 범위 내에서 검색
	    		location: searchLatLng , // 거리순으로 정렬하기 위해 필요함
	    		sort: kakao.maps.services.SortBy.DISTANCE // 검색결과를 거리순으로(지도 중심 기준) 정렬
	    };
	    
	    ps.keywordSearch( keyword, placesSearchCB, searchOption); 
	}
}



//키워드 검색을 요청하는 함수입니다
function searchPlacesKeyword() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    quickSearch = false;
    ps.keywordSearch( keyword, placesSearchCB); 
}



// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
	
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);
        
        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}



// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), // 검색 결과를 참고하여 지도 범위 재설정 할 때 필요함 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    if(!quickSearch){
    	map.setBounds(bounds);    	
    }
}



// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg"></span>' +
                '<div class="info">';
    
    // My매장 에 있는지 비교
    if(mycafe_list.length>0){
    	let flag = false;
    	mycafe_list.forEach(function(element){
    		if(element.name == places.place_name){
    			flag = true;
    		}
    	});
    	
    	if(flag){
    		itemStr += '<h5><img alt="" src="/img/store/icon_fav_on.png" onclick="save_my_cafe(this,'+index+')" style="margin-right:5px;">' + places.place_name + '</h5>';    		
    	}else{
        	itemStr += '<h5><img alt="" src="/img/store/icon_fav_off.png" onclick="save_my_cafe(this,'+index+')" style="margin-right:5px;">' + places.place_name + '</h5>';
    	}
        	
    }else{
    	itemStr += '<h5><img alt="" src="/img/store/icon_fav_off.png" onclick="save_my_cafe(this,'+index+')" style="margin-right:5px;">' + places.place_name + '</h5>';    	
    }
    
    
    if (places.road_address_name) {
        itemStr += '<span>' + places.road_address_name + '</span>' +
                    '<span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '<span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '<span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}



// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
//		var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
//		imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
//		imgOptions =  {
//            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
//            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
//            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
//        },
		
		var imageSrc = '/img/store/marker_star.png', 
    		imageSize = new kakao.maps.Size(38, 60), 
        
    		markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
    		marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}



// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}



// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}



// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}



 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}



//마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'dragend', function() {        
    
	searchPlaces();
    
});


// 나만의 매장 등록 AJAX
function save_my_cafe(el, index){
	
	let par_el = el.parentNode.parentNode;
	
	const formData = new FormData();
	formData.append('name', el.parentNode.textContent);
	formData.append('address', par_el.querySelector('span').textContent);
	formData.append('tel', par_el.querySelector('.tel').textContent);
	formData.append('lat', markers[index].getPosition().getLat());
	formData.append('lng', markers[index].getPosition().getLng());
	
	if(el.getAttribute('src').indexOf('off') != -1){ // off -> on (관심매장에 등록)

		// Ajax
		fetch("http://localhost:8080/store_map/save",{
			method:'POST',
			body: formData
		}).then(function(response){
			return response.text();
		}).then(function(result){
			
			if(result=="ok"){
				el.setAttribute('src','/img/store/icon_fav_on.png');	
				mycafe_list.push({
					name: el.parentNode.textContent
				});
			}else{
				alert(result);
			}
			
		});
		
	}else{// on -> off (관심매장에서 삭제)
		
		// Ajax
		fetch("http://localhost:8080/store_map/delete",{
			method:'POST',
			body: formData
		}).then(function(response){
			return response.text();
		}).then(function(result){
			
			if(result=="ok"){
				el.setAttribute('src','/img/store/icon_fav_off.png');
				
				let remove_index = 500;
				mycafe_list.forEach(function(element, index){
					if(el.parentNode.textContent == element.name){
						remove_index = index;
					}
				});
				mycafe_list.splice(remove_index,1);
				
			}else{
				alert(result);
			}
			
		});
		
	}
	
}


// 퀵 검색 탭
function quick(el){
	quickSearch = true;
	searchPlaces();
	
	el.className = 'on';
	el.nextSibling.nextSibling.className = '';
	
	let e1 = document.querySelector('#menu_wrap .option');
	e1.style.display = '';
	let e2 = document.querySelector('#placesList');
	e2.style.display = '';
	let e3 = document.querySelector('#pagination');
	e3.style.display = '';

}


// My매장 탭
function my(el){
	quickSearch = false;
	
	el.className = 'on';
	el.previousSibling.previousSibling.className = '';
	
	let e1 = document.querySelector('#menu_wrap .option');
	e1.style.display = 'none';
	
	let e2 = document.querySelector('#placesList');
	let e3 = document.querySelector('#pagination');
	
	fetch("http://localhost:8080/store_map/mycafe",{
		method:'GET',
	}).then(function(response){
		return response.text();
	}).then(function(result){
		
		if(result=='not login'){
			
			e2.innerHTML = '<div style="text-align: center;margin-top: 20px;font-weight: bolder;">로그인을 하시면<br/>My 매장의 정보를 받으실 수 있습니다.</div>';
			e3.style.display = 'none';
			
		}else if(result=='fail'){
			
			e2.innerHTML = '<div style="text-align: center;margin-top: 20px;font-weight: bolder;">정보를 불러올 수 없습니다.</div>';
			e3.style.display = 'none';
			
		}else{
			let mycafes = JSON.parse(result);

			let data = [];
			let status = 'OK';
			let pagination = {};
			
			mycafes.forEach(function(element){
				
				let data_item = {
					place_name: element.name,
					address_name: element.address,
					road_address_name: '',
					phone: element.tel,
					x: element.lng,
					y: element.lat
				};
				data.push(data_item);
				
			});
			
			if(data.length > 0){
				placesSearchCB(data, status, pagination)	
			}else{
				e2.innerHTML = '<div style="text-align: center;margin-top: 20px;font-weight: bolder;">등록한 매장이 없습니다.</div>';
				e3.style.display = 'none';
			}
		}
		
	});
	
}


