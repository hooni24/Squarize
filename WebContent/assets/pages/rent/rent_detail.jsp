<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<style>
        #map-simple { min-height: 240px; }
		textarea.taSetting[readonly]{
			resize: vertical;
			background-color: transparent;
			cursor: default;
			border: none;
		}
		textarea.detail[readonly]{
			resize: vertical;
			background-color: transparent;
			cursor: default;
			border: none;
			width: 100%;
		}
		span.detail{
			font: bold 1.2em 맑은 고딕;
			margin-bottom: 10%;
		}
		textarea.taSetting{
			resize: vertical;
			background-color: transparent;
			cursor: text;
		}
		a#realUpdate{
			display: none;
		}
		a#toTitle{
			font: bold 1.2em 맑은 고딕;
			color: black;
		}
		a.hidden{
			display: none;
		}
		div#img_ib{
			display: inline-block;
			cursor: pointer;
		}
		article.person{
			transition-duration: 0.4s;
		}
		article.person:hover{
			background-color: #e6fff2;
		}
		div.vert{
			font: bold 2em 맑은 고딕;
		}
		div#detail_apply{
			font: 1.4em 맑은 고딕;
		}
		textarea#apply_ta{
			background-color: transparent;
			border: none;
			margin: 8% 0;
			border-bottom: 1px solid black;
			width: 80%;
			height: 150px;
		}
		span#span_title{
			font-weight: bold;
		}
		a.img_a{
			display: inline-block;
			width: 14%;
			height: auto;
			cursor: pointer;
		}
	</style>
	
	<script>
		$(function(){
			//삭제
			$("a#delete").on("click", function(){
				var selected = confirm("정말 삭제하시겠습니까?");
				if(selected){
					var rent_id = $("input#hidden").val();
					location.href="deleteRent.action?rent.sq_rent_id="+rent_id;
				}
			});
			
			//수정폼으로 변환
			$("a#update").on("click", function(){
				$("h1#band_name").html("<input type='text' id='band_name' name='rent.sq_rent_band_name' value='${rent.sq_rent_band_name }'>");
				$("h2#concert_date").html('공연 예정일 <input type="date" id="concert_date" name="rent.sq_rent_concert_date">');
				$("h2#limit").html("지원 마감일 <input type='date' id='limit' name='rent.sq_rent_limit'>");
				$("textarea#ta").removeAttr("readonly");
				$("div#file").append("<input type='file' id='upload' name='upload' >");
				$(this).css("display", "none");
				$("a#seeApply").css("display", "none");
				$("a#delete").css("display", "none");
				$("a#realUpdate").css("display", "inline-block");
				
				$("dd#genre").html('<select name="rent.sq_rent_genre"><option>락</option><option>발라드</option><option>재즈</option><option>힙합</option></select>');
				$("dd#running_time").html('<select name="rent.sq_rent_running_time"><option>1</option><option>2</option><option>3</option></select>');
				$("dd#team_count").html('<select name="rent.sq_rent_team_count"><option>1</option><option>2</option><option>3</option></select>');
				marker.setDraggable(true);
			});
			
			//진짜 수정
			$("a#realUpdate").on("click", function(){
				var lat = marker.position.lat();		//위도경도 얻어옴
				var lng = marker.position.lng();
				$("input#lat_").val(lat);				//hidden에 넣음
				$("input#lng_").val(lng);
				
				$.ajax({		//마커 부분 시, 동 으로 region에 저장 
					url: 'https://maps.googleapis.com/maps/api/geocode/json?latlng='+lat+','+lng+'&key=AIzaSyAcZEsXq59r_WkhHw_uyjJsbE_zJvOspz8'
					, method : "post"
					, dataType: "json"
					, success : function(resp){
						var region = resp.results[0].address_components[3].long_name+" "+resp.results[0].address_components[2].long_name;
						$("input#region_").val(region);
		 				$("#form")[0].submit();
					}//success펑션
				});//ajax
			});
			
			//지원하기버튼 클릭
			$("a#rent_apply").on("click", function(){
				var rent_id = $("input#rent_id_hidden").val();
				
				$.ajax({	//지원여부 확인
					url : "checkRentApply?rent.sq_rent_id="+rent_id
					, method : "post"
					, dataType : "json"
					, success : function(resp){
						if(resp.rent_apply != null){
							alert("이미 지원했습니다.");
						}else {
			 				$.ajax({		//포트폴리오 있는지 확인
			 					url : "checkPortfolio"
			 					, method : "post"
			 					, dataType : "json"
			 					, success : function(resp){
			 						if(resp.sq_portfolio != null){	//포트폴리오 있으면
			 							$.ajax({
			 								url : "rentApply?rent.sq_rent_id="+rent_id
			 								, method : "post"
			 								, success : function(){
			 									alert("지원 완료!");
			 								}
			 							});
			 						}else {
			 							alert("포트폴리오를 먼저 등록해 주세요");
			 							$("a#portfolio_menu").trigger("click");
			 						}
			 					}
		 					});
						}
					}
				});
			});
			
			//지원취소버튼 클릭
			$("a#rent_apply_cancel").on("click", function(){
				var con = confirm("정말 취소하시겠습니까?");
				if(con){
					var id = $("input#hidden").val();
					location.href = "rentApplyCancel.action?rent.sq_rent_id="+id;
				}
			});
			
			
			//지원자 보기 버튼 클릭
			$("a#seeApply").on("click", function(){
				var rent_id = $("input#rent_id_hidden").val();
				$(this).addClass("hidden");
				
				$.ajax({
					url : "seeRentApply?rent.sq_rent_id="+rent_id
					, method : "post"
					, dataType : "json"
					, success : function(resp){
						var humanList = resp.humanList;
						var title = '<h1>지원자 목록</h1><div id="persons-list" class="content-container"><div class="inner">';
						$("div#result").append(title);

							$.each(humanList, function(index, item){
								var appendThing = 	'<div id="big"><article class="person list">'
												+		'<input type="hidden" value="'+item.sq_port_id+'">'
												+		'<div id="img_ib">'
												+			'<figure class="person-image image">';
												if(item.sq_port_file != ""){
													appendThing += '<img src="assets/downloadIMG/port/'+item.sq_port_file+'">';
												}else {
													appendThing += '<img src="assets/img/person-01.jpg">';
												}
									appendThing	+=			'</figure>'
												
												+		'</div>'
												+		'<div id="img_ib" class="vert closed">'
												+			'<br><span id="apply_title">'
												+				'<div id="img_ib"><figure class="person-image image">';
												
												if(item.sq_port_inst == '기타'){
													appendThing +='<img src="assets/img/items/guitar.png">'
												}else if(item.sq_port_inst == '드럼'){
													appendThing +='<img src="assets/img/items/drum.png">'
												}else if(item.sq_port_inst == '키보드'){
													appendThing +='<img src="assets/img/items/keyboard.png">'
												}else if(item.sq_port_inst == '보컬'){
													appendThing +='<img src="assets/img/items/mic.png">'
												}
												
									appendThing +=				'</figure></div>'
												+				'&nbsp;&nbsp;&nbsp;이름 : ' + item.sq_member_name 
												+				'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;연락처 : ' + item.sq_artist_phone
												+			'</span>'
												+		'</div>'
												+	'</article></div>';
								$("div#result").append(appendThing);
							});
						$("div#result").append('</div></div>');
						location.href = "#result";
					}
				});
			});
			
			//상세정보 클릭시 아래 붙이는 작업
			$("div#result").on("click", "div#img_ib", function(){
				var isClosed = $(this).hasClass("closed");
				var targetPortId = $(this).parent().children().first().val();
				var detail = "";
				if(isClosed){
					$.ajax({
						url : "getApplyPort.action"
						, method : "post"
						, data : {"sq_portfolio.sq_port_id" : targetPortId}
						, dataType : "json"
						, async: false
						, success : function(resp){
							detail = 	'<div id="detail_apply">'
									+		'<div><span id="span_title">지원자 약력</span>'
									+			'<textarea id="apply_ta" readonly="readonly">' + resp.sq_portfolio.sq_port_career
									+			'</textarea>'
									+		'</div>'
									+		'<div><span id="span_title">자기소개</span>'
									+			'<textarea id="apply_ta" readonly="readonly">' + resp.sq_portfolio.sq_port_pr
									+			'</textarea>'
									+		'</div>'
									+		'<div><span id="span_title">참고자료</span><br><br>';
							var fullname = resp.sq_portfolio.sq_port_media;
							var nameArray = fullname.split(".");
							var ext = nameArray[nameArray.length - 1];
							
							if(ext=="mp3" || ext=="MP3" || ext=="ogg" || ext=="OGG" || ext=="wav" || ext=="WAV"){
								detail +=	'<audio controls>'
										+		'<source src="assets/downloadIMG/port/' + resp.sq_portfolio.sq_port_media + '" type="audio/mpeg">'
										+	'</audio>'
							}else if (ext=="mov" || ext=="MOV" || ext=="wmv" || ext=="WMV" || ext=="mp4" || ext=="MP4" || ext=="AVI" || ext=="avi" || ext=="MPEG" || ext=="mpeg"){
								detail +=	'<video width="600" height="300" controls>'
										+		'<source src="assets/downloadIMG/port/' + resp.sq_portfolio.sq_port_media + '" type="video/mp4">'
										+	'</video>'
							}
									
							detail +=	'</div>'
									+	'</div>';
						}
						, error : function(){
							alert("실패");
						}
					});
					
					$(this).parent().after(detail);
					$(this).removeClass("closed");
				}else {
					$(this).addClass("closed");
					$(this).parent().parent().children().last().remove();
				}
			});
			
			
			
			//이하 지도 그리기 관련
			var lat = $("input#lat_").val();
			var lng = $("input#lng_").val();
			
			var mymap = document.getElementById("map-canvas");
	        var gcenter = [ [ lat, lng, 4 ] ]; //지도의 중앙
	        var latlng = [ [ lat, lng, "여기에요~" ] ]; //마커를 위해 위치 객체 생성(배열가능, 여기서는 경도,위도 순서)
	        var image = {
	            url : "assets/img/marker.png", //마커이미지 
	            size : new google.maps.Size(67, 57), //마커사이즈
	            origin : new google.maps.Point(0, 0),
	            anchor : new google.maps.Point(43, 77)
	        }; //마커로 사용할 이미지 정의
	        
	        var gmap = new google.maps.Map(mymap, {
	            zoom : 15, //줌
	            left : new google.maps.LatLng(latlng[0][0], latlng[0][1]),
	            center : new google.maps.LatLng(gcenter[0][0], gcenter[0][1]),
	            icon : image,
	            mapTypeId : google.maps.MapTypeId.ROADMAP
	        }); //맵타입
	        
	        var marker, i;
	        for (i = 0; i < latlng.length; i++) { //마커를 여러개 찍을때 사용
	            marker = new google.maps.Marker({
	                position : new google.maps.LatLng(latlng[i][0], latlng[i][1]),
	                icon : image,
	                map : gmap,
	                title : latlng[i][2]
	            });
	        }
		});
		
	</script>
    <title></title>
</head>
<body class="external">

<div id="item-detail" class="content-container">
    <div class="row">
        <div class="col-md-8">
            <div class="inner">
                <article class="animate move_from_bottom_short">
                    <div class="gallery">
                        <div class="image">
                        <s:if test="rent.sq_rent_photo != ''">
                            <img src="assets/downloadIMG/rent/${rent.sq_rent_photo }">
                        </s:if>
                        <s:else>
                        	<img src="assets/img/default-item.png">
                        </s:else>
                        </div>
                    </div>
                </article>
                
                <form id="form" action='updateRent.action' method="post" enctype="multipart/form-data">
	                <article class="animate move_from_bottom_short">
	                    <h1 id="band_name">${rent.sq_rent_band_name }</h1><br>
	                    <h2 id="concert_date">${fn:substring(rent.sq_rent_concert_date, 0, 11) } 공연 예정</h2>
	                    <h2 id="limit">${fn:substring(rent.sq_rent_limit, 0, 11) } 지원 마감</h2>
	                    <figure class="price average-color"><span>${rent.sq_member_id }</span></figure><br>
	                    <textarea class="form-control taSetting" id="ta" name="rent.sq_rent_info" rows="12" ReadOnly="readonly">${rent.sq_rent_info }</textarea>
	                    <div id="file"></div>
	                </article>
		                <input type="hidden" value="${rent.sq_rent_id }" id="hidden" name="rent.sq_rent_id">
                
                <!--end Description-->
                
                <article class="sidebar">
                    <div class="person animate move_from_bottom_short">
                        <div class="inner average-color">
                            <figure class="person-image">
                            <s:if test="artist.sq_artist_photo != ''">
                                <img src="assets/downloadIMG/artist/${artist.sq_artist_photo }">
                            </s:if>
                            <s:else>
                            	<img src="assets/img/person-02.jpg">
                            </s:else>
                            </figure>
                            <header>${rent.sq_member_id }</header>
                            <div>${member.sq_member_email }</div>
                            <hr>
                            <a href="#person-detail" class="link" data-toggle="collapse" aria-expanded="false" aria-controls="person-detail">Show Details</a>
                        </div>
                        <div class="collapse" id="person-detail">
                            <div class="details">
                                <textarea class="form-control taSetting" rows="8" ReadOnly="readonly">${artist.sq_artist_intro }</textarea>
                            </div>
                            <!--end .details-->
                        </div>
                        <!--end .collapse-->
                    </div>
                    <!--end .person-->
                    <div class="block animate move_from_bottom_short">
                        <dl>
                            <dt>지역</dt>
                            <dd id="region">${rent.sq_rent_region }</dd>
                            <dt>장르</dt>
                            <dd id="genre">${rent.sq_rent_genre }</dd>
                            <dt>총 공연시간</dt>
                            <dd id="running_time">${rent.sq_rent_running_time } 시간</dd>
                            <dt>모집팀 수</dt>
                            <dd id="team_count">${rent.sq_rent_team_count } 팀</dd>
                        </dl>
                    </div>
                </article>
                
                <article>
                    <h3>지도</h3>
                    <div id="map-canvas" style="width: 100%; height: 400px"></div>
                    <input type="hidden" id="lat_" value="${rent.sq_rent_lat }" name="rent.sq_rent_lat">
                    <input type="hidden" id="lng_" value="${rent.sq_rent_lng }" name="rent.sq_rent_lng">
                    <input type="hidden" id="region_" name="rent.sq_rent_region">
                </article>
                </form>
                
                <input type="hidden" value="${fn:substring(rent.sq_rent_limit, 0, 11) }" id="concert_date_hidden">
                <input type="hidden" value="${fn:substring(rent.sq_rent_limit, 0, 11) }" id="limit_hidden">
                <input type="hidden" value="${rent.sq_rent_id }" id="rent_id_hidden">
                
                <!--end Sidebar-->
                <article class="center" id="test">
                    <s:if test="#session.loginId == rent.sq_member_id ">
                    	<a class="img_a" id="seeApply" class="seeApply"><img src="assets/img/icons/showList.png"></a>&nbsp;&nbsp;&nbsp;
                    	<a class="img_a" id="update"><img src="assets/img/icons/update.png"></a>&nbsp;&nbsp;&nbsp;
                    	<a class="img_a" id="realUpdate"><img src="assets/img/icons/writeContent.png">&nbsp;&nbsp;&nbsp;</a>
                    	<a class="img_a" id="delete"><img src="assets/img/icons/deleteContent.png"></a>
                    </s:if>
                    <s:else>
	                    <s:if test="rent_apply == null">
		                    <a class="img_a" id="rent_apply"><img src="assets/img/icons/apply.png"></a>
	                    </s:if>
	                    <s:else>
		                    <a class="img_a" id="rent_apply_cancel"><img src="assets/img/icons/applyCancel.png"></a>
	                   </s:else>
                    </s:else>
                </article>
                <!--end Add Review-->
                
            </div>
        </div>
        <!--end .col-md-8-->
    </div>
    <!--end .row-->
</div>
<!--end #item-detail-->
<div id="result"></div>


</body>
</html>