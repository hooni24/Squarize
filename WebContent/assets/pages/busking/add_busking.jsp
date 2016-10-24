<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    
    <style>
    	.right_{text-align: right;}
    </style>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAcZEsXq59r_WkhHw_uyjJsbE_zJvOspz8"></script>
<script>
	$(function(){
		// Try HTML5 geolocation.
		var marker;		//submit할때 마커좌표 얻기위해 전역변수로 설정
		if (navigator.geolocation) {	//gps사용 허용이면
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
		  		//서브밋버튼 hiddn으로 만드는거 해야함
		    	handleLocationError(true, infoWindow, map.getCenter());
		  	});
		} else {
		  	// Browser doesn't support Geolocation
		  	alert("위치정보 사용이 불가능한 브라우저입니다.\nGoogle Chrome을 이용하세요.");
	  		handleLocationError(false, infoWindow, map.getCenter());
		}//if(navigator~)
		
		
		//버스킹 저장버튼 눌렀을때
		$("button#submits").on("click", function(){
			alert("Asd");
			var lat = marker.position.lat();		//위도경도 얻어옴(position이 latlng를 갖고 있는 객체)
			var lng = marker.position.lng();
			$("input#lat_").val(lat);				//hidden에 넣음
			$("input#lng_").val(lng);
			
			var valid = validCheck();
			if(valid){
				$("form#busking_form")[0].submit();
			}//if(valid)
		});	//submit클릭 on
	});
		
		function validCheck(){
			var teamname = $("input#teamname");
			var title = $("input#title");
			var description = $("textarea#description");
			var buskingdate = $("input#buskingdate");
			var region = $("input#region");
			
			alert(region.val());
			
			if(teamname.val().length < 1){
				alert("아티스트명을 입력하세요");
				return false;
			}else if(title.val().length < 1){
				alert("버스킹 제목을 입력하세요");
				return false;
			}else if(description.val().length < 1){
				alert("버스킹 상세설명을 입력하세요");
				return false;
			}else if(buskingdate.val().length < 1){
				alert("버스킹 예정일을 입력하세요");
				return false;
			}else if(region.val().length < 1){
				alert("버스킹 장소를 입력하세요");
				return false;
			}
			return true;
		}
</script>
</head>
<body>

<div id="submit-page">
    <div class="inner">
        <h1 id="temp">버스킹 등록</h1>
        <form id="busking_form" action="addBusking" method="post" enctype="multipart/form-data" >
            <article class="animate move_from_bottom_short">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group form-group-lg">
                            <input type="text" class="form-control" id="teamname" name="SQ_busking.teamname" placeholder="아티스트명">
                            <input type="text" class="form-control" id="title" name="SQ_busking.title" placeholder="버스킹 제목">
                        </div>
                    </div>
                </div>
                <!--end .row-->
                <div class="form-group">
                    <textarea class="form-control" rows="8" id="description" placeholder="버스킹 상세 설명" name="SQ_busking.description"></textarea>
                </div>
                <!--end textarea-->
            </article>
            <!--end Description-->
            <article class="animate move_from_bottom_short">
                <h1>세부 정보</h1>
                <div class="row">
	                <div class="col-md-4">
                    	<h3 class="right_">버스킹 예정일</h3>
					</div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <input type="date" class="form-control" id="buskingdate" name="SQ_busking.buskingdate">
                        </div>   
                    </div>
                    <!--end .col-md-4-->
                </div>
                <!--end .row-->
                
                <div class="row">
	                <div class="col-md-4">
	               		<h3 class="right_">버스킹 러닝타임</h3>
	              	</div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <select id="runningtime" name="SQ_busking.runningtime">
                            	<option value="60">60분</option>
                            	<option value="120">120분</option>
                            </select>
                        </div>   
                    </div>
                    <!--end .col-md-4-->
                </div>
                <!--end .row-->
            </article>
            <!--end Overview-->
            
            <div class="row">
            	<div class="col-md-4">
            		<h3 class="right_">장르</h3>
            	</div>
                <div class="col-md-4">
                    <div class="form-group">
                        <select name="SQ_busking.genre">
                        	<option>락</option>
                        	<option>발라드</option>
                        	<option>재즈</option>
                        	<option>힙합</option>
                        </select>
                    </div>
                </div>
                <!--end .col-md-4-->
            </div>
            <!--end .row-->
            
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                    	<h3 class="right_">버스킹 장소</h3>
                    </div>
                </div>
                <!--end .col-md-4-->
                <div class="col-md-4">
                    <div class="form-group">
                    	<input type="text" id="region" name="SQ_busking.location" placeholder="알기쉽게 적어주세요">
                    </div>
                </div>
                <!--end .col-md-4-->
            </div>
            <!--end .row-->
            
            <article>
            <div class="row">
	            <div class="col-md-4">
	                <h3 class="right_">사진 업로드</h3>
	           	</div>
	            <div class="col-md-4">
	                <input type="file" id="upload" name="upload" >
	           	</div>
	        </div>
            </article>
            <!--end Features-->
            
            <article>
                <h3>지도</h3>
                <div id="map-canvas" style="width: 100%; height: 400px"></div>
                <input type="hidden" id="lat_" name="SQ_busking.latitude">
                <input type="hidden" id="lng_" name="SQ_busking.longitude">
            </article>
                
            
            <article class="center">
                
                <div class="form-group">
                    <button type="button" class="btn btn-circle btn-primary btn-xl" id="submits"><i class="fa fa-check"></i></button>
                </div>
                <!--end .form-group-->
            </article>
            <!--end Submit Button-->
            <article class="center">
                <small>By clicking “submit” button you agree with <a href="#" class="link">Terms and Conditions</a></small>
            </article>
            <!--end terms-->
        </form>
    </div>
    <!--end .row-->
</div>
<!--end #item-detail-->

</body>
</html>