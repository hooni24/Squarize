<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html lang="en-US">
	<head>
	    <meta charset="UTF-8"/>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	    <link href="../../fonts/font-awesome.css" rel="stylesheet" type="text/css">
	    <link href='http://fonts.googleapis.com/css?family=Roboto:700,400,300' rel='stylesheet' type='text/css'>
	    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	    <link href="../css/style.css" rel="stylesheet" type="text/css">
	    <link href="../../css/style.css" rel="stylesheet" type="text/css">
	
	    <style>
	        #map-simple { min-height: 240px; }
	        #content{
	        	cursor:default;
	        }
	        table{
	        	text-align: center;
	        	width:100%;
	        	border: 1px solid rgba(0,0,0,0.8);
	        	position:relative;
	        }
	        table *{
	        	position:relative;
	        }
	        th{
	        	text-align: center;
	        	background-color:rgba(0,0,0,0.2);
	        }
	        #toTitle{
	        text-align: center;
	        font-weight: bold;
	        margin: 0 auto;
	        }
	        .title{
	        	font-weight: bold;
	        }
	        dd#part_tag{
	        	z-index:999;
	        }
	    </style>
		<script src="../../js/sq_recruit.js"></script>
		<script type="text/javascript" src="assets/js/infobox.js"></script>
		<script type="text/javascript" src="assets/js/richmarker-compiled.js"></script>
		<script type="text/javascript">
			$(function(){
				
				var sq_recruit_id = $('#sq_recruit_id').val();
		    	$('a#applyThisRecruit').on('click', function(){	/* 지원하기 버튼 눌렀을 때 */
					$.ajax({
		    			url : 'insertApply'
		    			, method : 'POST'
		    			, data : {"sq_recruit_artist.sq_recruit_id":sq_recruit_id}
		    			, dataType : 'json'
		    			, success : function(response){
		    				// 지원여부 확인
		    				var result = response.result;
		    				if(result == 0){
		    					alert("이미 지원하였습니다.");
		    				} else if(result == -1) {
		    					alert("제출할 포트폴리오를 먼저 작성해주세요.");
		    					$('#portfolio_menu').trigger('click');
		    				} else {
		    					alert("지원 처리되었습니다.");
		    					$('a#close').trigger('click');
		    				}
		    			}
		    		});
				});
				
				$('a#cancelThisRecruit').on('click',function(){ /* 지원하기 취소 */
					$.ajax({
						url : 'deleteApply'
						, method : 'POST'
						, data : {"sq_recruit_artist.sq_recruit_id":sq_recruit_id}
						, dataType : 'json'
						, success : function(response) {
							//지원한 적 있었는지 확인할 것.
							var result = response.result;
							if(result == -1) {
								alert("지원한 적이 없습니다.");
							} else if (result == 0) {
								alert("취소 실패. 나중에 다시 시도해주세요.");
								$('a#close').trigger('click');
							} else {
								alert("취소되었습니다.");
								$('a#close').trigger('click');
							}
						}
					});
				});
				
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
								
				 				$("#form").submit();
							}//if(valid)
						}//success펑션
					});//ajax
				});	//submit클릭 on
				
				
				
				$('#update-btn').click(function(){
					var marker;
					var title_value=$('#title1').text();
					var limit_date=$('#limitDate').text();
					var info=$('#content').val();
					$('#title1').html("<input type='text' name='sq_recruit.sq_recruit_title' id='title' value='"+title_value+"'/>");
					$('dd#part_tag').html("<select name='sq_recruit.sq_recruit_part' multiple title='part' id='part'><option>드럼</option><option>키보드</option><option>보컬</option><option>기타</option></select>");                                
					$('dd#genre_tag').html('<select name="sq_recruit.sq_recruit_genre" multiple title="genre" id="genre"><option>락</option><option>발라드</option><option>재즈</option><option>힙합</option></select>');
		            $('dd#limitDate').html('<input type="text" class="form-control" id="limitDate" name="sq_recruit.sq_recruit_date" value="'+limit_date+'">');                    
		            $('textarea#content').removeAttr('readonly'); 
		            $("div#file").append("<input type='file' id='upload' name='upload' >");
		            $('.center a').css('display','none');
		            $('.center').html('<a href="#" class="btn btn-circle btn-default btn-lg detail-btn submit-button" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true" id="update">확인</a>');
		            marker.setDraggable(true);
				});
				$('.center').on('click','#update',function(){
					
					/* var lat = 37.5//marker.position.lat();		//위도경도 얻어옴
					var lng = 37.5//marker.position.lng();
					$("input#lat_").val(lat);				//hidden에 넣음
					$("input#lng_").val(lng);
					
					$.ajax({		//마커 부분 시, 동 으로 region에 저장 
						url: 'https://maps.googleapis.com/maps/api/geocode/json?latlng='+lat+','+lng+'&key=AIzaSyAcZEsXq59r_WkhHw_uyjJsbE_zJvOspz8'
						, method : "post"
						, dataType: "json"
						, success : function(resp){
							var region = resp.results[0].address_components[3].long_name+" "+resp.results[0].address_components[2].long_name;
							$("input#region_").val(region);
			 				
						}//success펑션
					});//ajax */
					if(validCheck()){
						$("#form")[0].submit();
					}
				});
				
				
				$('#applyList').click(function(){
					/* var id=$('#sq_recruit_id').val();
					alert(id); */
					$.ajax({
						method:'post'
						,url:'AllRecruitApply'
						,data:{'sq_recruit.sq_recruit_id':$('#sq_recruit_id').val()}
						,datatype:'json'
						,success:function(send){
							var list=send.sq_apply_list;
							var code2="";
							var count=1;
							/* if(list==null){
								alert("지원자가 없습니다.");
								
							}else{ */ 
								$.each(list,function(index,item){
									var appendThing = '<article class="person list">';
									appendThing += '<div class="left average-color">';
									appendThing += '<figure class="person-image image">';
									if(item.sq_port_file == ""){
										appendThing += '<img src="assets/img/person-01.jpg">';
									}else {
										appendThing += '<img src="assets/downloadIMG/port/'+item.sq_port_file+'">';
									}
									appendThing += '</figure>';
									appendThing += '<aside class="number">'+item.sq_member_name+'</aside>';
									appendThing += '<aside>아이디 : '+item.sq_member_id+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 연락처 : '+item.sq_artist_phone+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 이메일 : '+item.sq_member_email+'</aside>';
									appendThing += '<h3>다루는 악기 - '+item.sq_port_inst+'</h3>';
									appendThing += '<span class="detail title">경력</span><p class="detail control-form" rows="8" readonly>'+item.sq_port_career+'</p><hr/>';
									appendThing += '<div><span class="detail title">자기소개</span><p class="detail control-form" rows="8" readonly>'+item.sq_port_pr+'</p></div></hr>';
									appendThing += '<a href="#result" id="toTitle">목록으로</a>';
									appendThing += '</div>';
									appendThing += '</article>';
									$("div#result").append(appendThing);
									
									
									/* var file="";
									if(item.sq_port_file == ""){
										file='<figure class="person-image image"><img src="assets/img/person-01.jpg"></figure>'
									}else {
										file='<figure class="person-image image"><img src="assets/downloadIMG/port/'+item.sq_port_file+'"></figure>';
									}
									var detailCon="<div><h3>"+item.sq_member_name+"</h3>"+file+"</td><p>email 주소 : "+item.sq_member_email+"<br/><hr/>"+item.sq_port_pr+"<hr/><p><span>"+item.sq_port_inst+"<span></div>";
									var detail="<tr rowspan='5' id=retail"+count+" style='display: none' style='display: relative'><td colspan='4'>"+detailCon+"</td></tr>"
		
									code2+="<tr><input type='hidden' id='sq_member_id' value='"+item.sq_member_id+"'/><td>"+count+"</td><td>"+item.sq_member_name+"</td><td>"+item.sq_artist_phone+"</td><td><a href='#' id='detail'>상세보기</a></td></tr>"+detail;
									count++; */
								});
							
							/* alert(code2);
							var code1="<table><tr><th>번호</th><th>지원자 이름</th><th>연락처</th><th>상세보기</th></tr>"+code2+"</table>";
							$(code1).appendTo('#table');
									alert(1); */
						}
					});
				});
				
							/* /* $('#table').on('click','#detail',function(){
								$.ajax({
									method:'post'
									,url:
								});
							}); */ 
				
		    	//위치을 찍어줄 위경도를 갖고 온다.
				//지도에 마커를 찍는다.
				var _latitude = $('#sq_recruit_lat').val();
			    var _longitude = $('#sq_recruit_lng').val();
			    
			    var draggableMarker = false;
			    var scrollwheel = true;
			    var element = document.querySelector('body');	//body
				
			    if( hasClass(element, 'external') ){	//hasClass():아래에 선언돼 있음. false
			        var head = document.getElementsByTagName('head')[0];	// 가장 처음 나오는 head태그를 갖고 옴.
			        var script = document.createElement('script');	//script 요소를 만듦.
			        script.type = 'text/javascript';	//script 의 속성을 정해줌.
			        script.src = "../../js/external.js";	
			        head.appendChild(script);	//script를 첫번째 head태그의 자식으로 붙임.
			    }
			    else {
			        simpleMap(_latitude, _longitude,draggableMarker, scrollwheel);	// funcitons.js의 simpleMap을 실행.
			    }
			
			    function hasClass(element, cls) {
			    	return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
			    }
			    
			    
			    
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
	</head>
	
<!-- **********************************************************여기부터 바디********************************************************* -->	
	<body class="external">
	<!-- *****구인 상세 정보 시작 DIV ***** -->
	<%-- 
	<s:if test="#session.loginId == null">
		<a id="toArtistLogin">로그인이 필요한 페이지입니다.</a>	<!-- interceptor -->
	</s:if>
	 --%>
	<s:if test="sq_recruit_artist == null">
		<a id="toArtistLogin">해당 글은 삭제되었습니다.</a>	<!-- trigger로 실행할 것. -->
	</s:if>
	<s:else>
	<div id="item-detail" class="content-container">
	    <div class="row">
	        <div class="col-md-8">
	            <div class="inner">
	                <form id="form" action="updateSQrecruit" method="post" enctype="multipart/form-data">
		                <article class="animate move_from_bottom_short">
		                    <div class="gallery">
		                        <div class="image">
		                        	<s:if test="#session.loginId != null && sq_recruit_artist.sq_recruit_photo != null">
		                         	   <img src="assets/downloadIMG/recruit/${sq_recruit_artist.sq_recruit_photo}" alt="">
		                        	</s:if>
		                        	<s:else>
		                        		<img src="assets/img/default-item.png" alt="">
		                        	</s:else>
		                        	
		                        </div>
		                    </div>
		                </article>
	                	<article class="animate move_from_bottom_short">
	                		<div id="file"></div>
		                	<input type="hidden" name="sq_recruit.sq_recruit_id" id="sq_recruit_id" value=${sq_recruit_artist.sq_recruit_id}>
		                    <h1 id="title1">${sq_recruit_artist.sq_recruit_title}</h1>
		                    <h2><i class="fa fa-map-marker"></i>${sq_recruit_artist.sq_recruit_location}</h2>
		                    <figure class="price average-color"><span>${sq_recruit_artist.sq_member_id}</span></figure>
		                    <p><textarea id="content" class="form-control" readonly="readonly">${sq_recruit_artist.sq_recruit_info}</textarea></p>
		                    <input type="hidden" id="sq_recruit_id" name="sq_recruit_apply_id" value="${sq_recruit_artist.sq_recruit_id}"/>
		                    <input type="hidden" id="sq_recruit_lat" value="${sq_recruit_artist.sq_recruit_latitude}" />
		                    <input type="hidden" id="sq_recruit_lng" value="${sq_recruit_artist.sq_recruit_longitude}" />
		                </article>
	               		 <!--end Description-->
	                
	                <article class="sidebar">
	                    <div class="person animate move_from_bottom_short">
	                        <div class="inner average-color">
                            	<s:if test="sq_recruit_artist.sq_artist_photo != null">
		                            <figure class="person-image">
		                                <img src="assets/downloadIMG/artist/${sq_recruit_artist.sq_artist_photo}" alt="">
		                            </figure>
	                           	</s:if>
	                            <header>${sq_recruit_artist.sq_member_name}</header>
	                            <a href="tel:${sq_recruit_artist.sq_artist_phone}">${sq_recruit_artist.sq_artist_phone}</a>
	                            <a href="mailto:${sq_recruit_artist.sq_member_email}">${sq_recruit_artist.sq_member_email}</a>
	                            <hr>
	                            <a href="#person-detail" class="link" data-toggle="collapse" aria-expanded="false" aria-controls="person-detail">상세정보</a>
	                        </div>
	                        <div class="collapse" id="person-detail">
	                            <div class="details">
	                                <p>
		                            	<s:if test="sq_recruit_artist.sq_artist_intro != null">
		                                	${sq_recruit_artist.sq_artist_intro}
		                                </s:if>
		                                <s:else>
		                                	등록된 인사말이 없습니다.
		                                </s:else>
	                                </p>
	                                
	                                <h3>Contact Me</h3>
	                                <form role="form" method="post" class="clearfix">
	                                    <div class="form-group">
	                                        <input type="text" class="form-control" id="person-name" name="sq_artist.sq_member_name" placeholder="Name">
	                                    </div>
	                                    <div class="form-group">
	                                        <input type="email" class="form-control" id="person-email" name="sq_artist.sq_member_email" placeholder="Email">
	                                    </div>
	                                    <div class="form-group">
	                                        <textarea class="form-control" rows="2" placeholder="Message"></textarea>
	                                    </div>
	                                    <div class="form-group">
	                                        <button type="submit" class="btn btn-link dark pull-right">전송</button>
	                                    </div>
	                                </form>
	
	                            </div>
	                            <!--end .details-->
	                        </div>
	                        <!--end .collapse-->
	                    </div>
	                 <!--end .person-->
	                    <div class="block animate move_from_bottom_short">
	                        <dl>
	                            <dt>구인 파트</dt>
	                            <dd id="part_tag">${sq_recruit_artist.sq_recruit_part}</dd>
	                            <dt>연주 장르</dt>
	                            <dd id="genre_tag">${sq_recruit_artist.sq_recruit_genre}</dd>
	                            <dt>모집마감</dt>
	                            <%-- <dd>165m<sup>2</sup></dd> --%>
	                            <dd id="limitDate">${sq_recruit_artist.sq_recruit_date}</dd>
	                            <dt>등록 날짜</dt>
	                            <dd>${sq_recruit_artist.sq_recruit_input_date}</dd>
	                        </dl>
	                    </div>
	                </article>
	                <!--end Sidebar-->
	                
	          		<!--end Features-->
			
					<!-- 지도에 위치 표시  -->
	                <article>
	                    <h3>Map</h3>
	                    <div id="map-simple"></div>	<!-- idle클래스 추가 -->
	                </article>
	                <!--end Map-->
	                		
                </form>
	                	                
	                <!-- 아티스트로 로그인한 상태에서 로그인아이디와 글쓴 아이디가 같을 경우 지원자 리스트를 볼 수 있는 버튼을 추가. -->
	                <s:if test="#session.loginId != null && #session.loginId == sq_recruit_artist.sq_member_id">
		                <article class="center" id="test">
		                    <a id="applyList" class="btn btn-circle btn-default btn-lg"  >지원자목록</a>
		                    <a id="update-btn" class="btn btn-circle btn-default btn-lg">수정</a>
		                    <a href="deleteSQrecruit?sq_recruit.sq_recruit_id=${sq_recruit_artist.sq_recruit_id}" class="btn btn-circle btn-default btn-lg">삭제</a>
		                </article>
	                </s:if>
	                
	                 <s:if test="#session.loginId != null && #session.loginId == sq_recruit_artist.sq_member_id">
	                 	<div id="table"></div>
	                 	<div id="result"></div>
	                 </s:if>
	                
	                <!-- 아티스트로 로그인한 상태에서 로그인 아이디가 글쓴 아이디가 아닐 경우 지원할 수 있는 버튼/ 지원했던 지원자는 취소버튼 추가. -->
	                <s:elseif test="#session.loginId != null && #session.loginId != sq_recruit_artist.sq_member_id">
	                	<article class="center" id="test">
		                    <a id="applyThisRecruit" class="btn btn-circle btn-default btn-lg">지원하기</a>
		                    <a id="cancelThisRecruit" class="btn btn-circle btn-default btn-lg">지원취소</a>
		                </article>
	                </s:elseif>
	                
	                
	                <!-- 아티스트 로그인하지 않은 상태에서는 이 페이지에 접근 불가(인터셉터) -->
	                
	            </div>
	        </div>
	        <!--end .col-md-8-->
	    </div>
	    <!--end .row-->
	</div>
	<!--end #item-detail-->
	</s:else>	
	</body>
</html>