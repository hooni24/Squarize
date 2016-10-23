<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style type="text/css">
    	.right_{text-aligh:right;}
        </style>
</head>


<body>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAcZEsXq59r_WkhHw_uyjJsbE_zJvOspz8"></script>
    <script>
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
</script>

<div id="submit-page">
    <div class="inner">
        <h1 id="temp">구인정보등록</h1>
        <form role="form" method="post" id="form" action="insertSQrecruit" enctype="multipart/form-data">
            <article class="animate move_from_bottom_short">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group form-group-lg">
                            <input type="text" class="form-control" id="title" name="sq_recruit.sq_recruit_title" placeholder="Title">
                        </div>
                    </div>
                    
                    <div class="col-md-8">
                        <div class="form-group">
                            	작성자   <s:property value='#session.loginId'/>
                        </div>
                    </div>
                   	<div class="col-md-8">
                        <div class="form-group">
                            <input type="text" class="form-control" id="limitDate" name="sq_recruit.sq_recruit_date" placeholder="모집마감일 : YYYY/MM/DD">
                        </div>
                         <textarea class="form-control" rows="4" id="info" name="sq_recruit.sq_recruit_info" placeholder="소개"></textarea>
                    </div>
                </div>
            </article>
                                       	
            <article>
	            <div class="row">
		            <div class="col-md-4">
		                <h3 class="right_">사진 업로드</h3>
		           	</div>
		            <div class="col-md-4">
		                <input type="file" id="recruit-pic" name="sq_recruit.sq_recruit_photo" >
		           	</div>
		        </div>
            </article>
            <!--end Description-->

            <article class="animate move_from_bottom_short">
                <h3>파트/장르</h3>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                             <select name="sq_recruit.sq_recruit_part" multiple title="part" id="part">
                                <option>기타</option>
                                <option>드럼</option>
                                <option>키보드</option>
                                <option>보컬</option>
                            </select>
                        </div>
                        <!-- end .form-group -->
                    </div>
                    <!--end .col-md-4-->
                    <div class="col-md-4">
                        <div class="form-group">
                            <select name="sq_recruit.sq_recruit_genre" multiple title="genre" id="genre">
                                <option>락</option>
                                <option>발라드</option>
                                <option>재즈</option>
                                <option>힙합</option>
                            </select>
                        </div>
                        <!-- end .form-group -->
                    </div>
                    <!--end .col-md-4-->
                </div>
                </article>
            
            <article class="animate move_from_bottom_short">
                <h3>지도</h3>
                <div id="map-canvas" style="width: 100%; height: 400px;"></div>
                <input type="hidden" id="lat_" name="sq_recruit.sq_recruit_latitude">
                <input type="hidden" id="lng_" name="sq_recruit.sq_recruit_longitude">
                <input type="hidden" id="region_" name="sq_recruit.sq_recruit_location">
            </article>
            
           
            <article class="center">
                
                <div class="form-group">
                    <button type="button" class="btn btn-circle btn-primary btn-xl" id="submits"><i class="fa fa-check"></i></button>
                </div>
                <!--end .form-group-->
            </article>
            
        </form>
    </div>
    <!--end .row-->
</div>
<!--end #item-detail-->



</body>
</html>