/**
 * 
 */
	$(function(){
		// Try HTML5 geolocation.
		var marker;		//submit할때 마커좌표 얻기위해 전역변수로 설정
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
// 		  		location.href = "toRentMain.action";
		    	handleLocationError(true, infoWindow, map.getCenter());
		  	});
		} else {
		  	// Browser doesn't support Geolocation
		  	alert("위치정보 사용이 불가능한 브라우저입니다.\nGoogle Chrome을 이용하세요.");
	  		handleLocationError(false, infoWindow, map.getCenter());
		}//if(navigator~)
		
		$("button#submits").on("click", function(){
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
						alert("hi");
						/* var title = $("input#title").val();
						var part = $("textarea#part").val();
						var limitDate = $("input#limitDate").val();
						var genre = $("input#genre").val();
						var photo = $("#recruit-pic").val();
						var info = $("#info").val(); */
						
						/* $("input#real_concert_date").val(concert_date);
						$("input#real_limit").val(limit); */
		 				$("#form").submit();
						alert("성공");
					}//if(valid)
				}//success펑션
			});//ajax
		});	//submit클릭 on
		
		
	});
		
		function validCheck(){
			var title = $("input#title").val().length;
			var part = $("#part").val();
			var genre = $("#genre").val();
			var limitDate = $("input#limitDate").val().length;
			
			if(title < 1){
				alert("제목을 입력해주세요 ");
				return false;
			}else if(part==null){
				alert("모집하고자 하는 파트 정보를 선택하세요");
				return false;
			}else if(genre==null){
				alert("모집하고자 하는 장르 정보를 선택하세요");
				return false;
			}else if(limitDate!=10){
				alert("날짜 형식은 YYYY/MM/DD입니다")
				return false;
			}
			return true;
		}