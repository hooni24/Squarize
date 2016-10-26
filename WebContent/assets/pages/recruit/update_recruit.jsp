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
   	<script>
   	$(function(){
   		$.ajax({
   			method:'get'
   			,url:'recruit_update'
   			,
   		});
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
	    map.setCenter(pos);
	   	});
   	</script>
</head>


<body>
    

<div id="submit-page">
    <div class="inner">
        <h1 id="temp">구인정보수정</h1>
        <form role="form" method="post" id="form" action="updateSQrecruit" enctype="multipart/form-data">
            <article class="animate move_from_bottom_short">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group form-group-lg">
                            <input type="text" class="form-control" id="title" name="sq_recruit.sq_recruit_title">
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
                         <textarea class="form-control" rows="4" id="info" name="sq_recruit.sq_recruit_info"></textarea>
                    </div>
                </div>
            </article>
                                       	
            <article>
	            <div class="row">
		            <div class="col-md-4">
		                <h3 class="right_">사진 업로드</h3>
		           	</div>
		            <div class="col-md-4">
		                <input type="file" id="recruit-pic" name="sq_recruit.sq_recruit_photo" value='${sq_recruit.sq_recruit_photo}'>
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
                <input type="hidden" id="lat_" name="sq_recruit.sq_recruit_latitude" value="sq_recruit.sq_recruit_latitude">
                <input type="hidden" id="lng_" name="sq_recruit.sq_recruit_longitude" value="sq_recruit.sq_recruit_longitude">
                <input type="hidden" id="region_" name="sq_recruit.sq_recruit_location" value="sq_recruit.sq_recruit_location">
            </article>
            
           
            <article class="center">
                
                <div class="form-group">
                    <button type="button" class="btn btn-circle btn-primary btn-xl" id="submits">확인</button>
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