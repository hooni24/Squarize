/**
 * 
 */

$(function(){
	// Try HTML5 geolocation.
	/*var marker;		//submit할때 마커좌표 얻기위해 전역변수로 설정
	if (navigator.geolocation) {	//gps사용 가능 브라우져이면
  		navigator.geolocation.getCurrentPosition(function(position) {	//현재 위치 좌표 얻어와서 함수실행
	    	var pos = {
			      		lat: position.coords.latitude,				//현재좌표값 json생성
			      		lng: position.coords.longitude
		    		};
			var myOptions = {
					    		zoom: 15,							//지도옵션 json생성
						    	center: pos,
						    	mapTypeId: google.maps.MapTypeId.ROADMAP
							};
			var map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);		//div#map-canvas에 지도 붙임 
	
			var infoWindow = new google.maps.InfoWindow({map: map});		//지도에 메세지창 생성
		    infoWindow.setPosition(pos);									//현재 위치로 메세지창 이동
		    infoWindow.setContent('드래그해서 정확한 위치로 이동하세요');								//메세지창 메세지 입력
		    
		    var image = {
				            url : "assets/img/marker.png", //마커이미지 
				            size : new google.maps.Size(67, 57), //마커사이즈
				            origin : new google.maps.Point(0, 0),
				            anchor : new google.maps.Point(43, 77)
				        }; //마커로 사용할 이미지 정의
		    
		    marker = new google.maps.Marker({
											    	position: pos,			//현재위치에 드래그가능한 마커 생성
										     		map: map,
										     		draggable: true,
										     		icon: image
										 		}); 
		    map.setCenter(pos);											//지도 현재위치로 center설정
	  	}, function() {
	  		alert("위치정보 사용에 동의하지 않으면 등록할 수 없습니다.");
//		  		location.href = "toRentMain.action";
	    	handleLocationError(true, infoWindow, map.getCenter());
	  	});
	} else {
	  	// Browser doesn't support Geolocation
	  	alert("위치정보 사용이 불가능한 브라우저입니다.\nGoogle Chrome을 이용하세요.");
  		handleLocationError(false, infoWindow, map.getCenter());
	}//if(navigator~)
*/	
	$("button .sq_submit").on("click", function(){
		alert("hi");
		var lat = marker.position.lat();		//위도경도 얻어옴
		var lng = marker.position.lng();
		$("input#lat_").val(lat);				//hidden에 넣음
		$("input#lng_").val(lng);
		
		$.ajax({		//마커 부분 시, 동 으로 region에 저장 
			url: 'https://maps.googleapis.com/maps/api/geocode/json?latlng='+lat+','+lng+'&key=AIzaSyAcZEsXq59r_WkhHw_uyjJsbE_zJvOspz8'
			, method : "post"
			, dataType: "json"
			, success : function(resp){//resp:
				var region = resp.results[0].address_components[3].long_name+" "+resp.results[0].address_components[2].long_name;
				$("input#region_").val(region);
				
				var valid = validCheck();
				if(valid){
					var band_name = $("input#band_name").val();
					var info = $("textarea#info").val();
					var concert_date = $("input#concert_date").val();
					var limit = $("input#limit").val();
					var photo = $("#upload").val();
					
					$("input#real_concert_date").val(concert_date);
					$("input#real_limit").val(limit);
	 				$("#forms")[0].submit();
				}//if(valid)
			}//success펑션
		});//ajax
	});	//submit클릭 on
		
	
	//로그아웃
	$("ul#main_menu").on("click", "a#main_logout", function(){
		location.href = "logoutSQmember.action?fromWhere=seeking";
	});
});

	function validCheck(){
		var band_name = $("input#band_name");
		var info = $("textarea#info");
		var concert_date = $("input#concert_date");
		var limit = $("input#limit");
		
		if(band_name.val().length < 1){
			alert("밴드명을 입력하세요");
			return false;
		}else if(info.val().length < 1){
			alert("대관 관련 정보를 입력하세요");
			return false;
		}else if(concert_date.val().length < 1){
			alert("공연 예정일을 입력하세요");
			return false;
		}else if(limit.val().length < 1){
			alert("모집 마감일을 입력하세요");
			return false;
		}else if(concert_date.val() <= limit.val()){
			alert("모집 마감일은 공연예정일보다 최소 하루 이전이어야 합니다.")
			return false;
		}
		return true;
	}

