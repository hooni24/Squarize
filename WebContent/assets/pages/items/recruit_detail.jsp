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
	        #applyThisRecruit {
	        	background-image: url("assets/img/success_64px.png");
	        }
	        #cancelThisRecruit {
	        	background-image: url("assets/img/cancel_64px.png");
	        }
	    </style>
		
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyAeZB9L58YYqTQo0pz8Awbw6J_e9jYUcOI&sensor=false&libraries=places"></script>
		<script type="text/javascript" src="assets/js/infobox.js"></script>
		<script type="text/javascript" src="assets/js/richmarker-compiled.js"></script>
		
		<script type="text/javascript">
			$(function(){
				var session = '<s:property value="#session.loginId"/>';
				alert(session);
				var sq_recruit_id = $('#sq_recruit_id').val();
		    	$('#applyThisRecruit').on('click', function(){	/* 지원하기 버튼 눌렀을 때 */
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
		    					
		    				}
		    			}
		    			
		    		});
				
				});
				
				$('#cancelThisRecruit').on('click',function(){
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
								
							} else {
								alert("취소되었습니다.");
								
								
							}
						}
					});
				});
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
			   //   rating();	//별점메소드 실행
			   //	    averageColor( $('.content-container') );
			    }
			
			    function hasClass(element, cls) {
			    	return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
			    }
			});
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
	                <article class="animate move_from_bottom_short">
	                    <div class="gallery">
	                        <div class="image">
	                        	<s:if test="#session.loginId != null && sq_recruit_artist.sq_recruit_photo == null">
	                        		<img src="assets/img/default-item.png" alt="">
	                        	</s:if>
	                        	<s:elseif test="#session.loginId != null && sq_recruit_artist.sq_recruit_photo != null">
	                         	   <img src="${sq_recruit_artist.sq_recruit_photo}" alt="">
	                        	</s:elseif>
	                        </div>
	                    </div>
	                </article>
	                
	                <article class="animate move_from_bottom_short">
	                    <h1>${sq_recruit_artist.sq_recruit_title}</h1>
	                    <h2><i class="fa fa-map-marker"></i>${sq_recruit_artist.sq_recruit_location}</h2>
	                    <figure class="price average-color"><span>${sq_recruit_artist.sq_member_id}</span></figure>
	                    <p>${sq_recruit_artist.sq_recruit_info}</p>
	                    <input type="hidden" id="sq_recruit_id" name="sq_recruit_apply_id" value="${sq_recruit_artist.sq_recruit_id}"/>
	                    <input type="hidden" id="sq_recruit_lat" value="${sq_recruit_artist.sq_recruit_latitude}" />
	                    <input type="hidden" id="sq_recruit_lng" value="${sq_recruit_artist.sq_recruit_longitude}" />
	                </article>
	                <!--end Description-->
	                
	                <article class="sidebar">
	                    <div class="person animate move_from_bottom_short">
	                        <div class="inner average-color">
	                            <figure class="person-image">
	                            	<s:if test="sq_recruit_artist.sq_artist_photo == null">
	                            		<img src="assets/img/person-01.jpg" alt="">
	                            	</s:if>
	                            	<s:else>
	                                	<img src="${sq_recruit_artist.sq_artist_photo}" alt="">
	                            	</s:else>
	                            </figure>
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
	                            <dd>${sq_recruit_artist.sq_recruit_part}</dd>
	                            <dt>연주 장르</dt>
	                            <dd>${sq_recruit_artist.sq_recruit_genre}</dd>
	                            <dt>연주 일시</dt>
	                            <%-- <dd>165m<sup>2</sup></dd> --%>
	                            <dd>${sq_recruit_artist.sq_recruit_date}</dd>
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
	                
	                <!-- 아티스트로 로그인한 상태에서 로그인아이디와 글쓴 아이디가 같을 경우 지원자 리스트를 볼 수 있는 버튼을 추가. -->
	                <s:if test="#session.loginId != null && #session.loginId == sq_recruit_artist.sq_member_id">
		                <article class="center" id="test">
		                    <a id="apply_list" href="applied_list?sq_recruit_apply.sq_recruit_id=${sq_recruit_artist.sq_recruit_id}" class="btn btn-circle btn-default btn-lg"><i class="fa fa-plus"></i></a>
		                    <a id="update_recruit" href="recruit_update?sq_recruit_apply.sq_recruit_id=${sq_recruit_artist.sq_recruit_id}" class="btn btn-circle btn-default btn-lg"><i class="fa fa-plus"></i></a>
		                    <a id="delete_recruit" href="recruit_delete?sq_recruit_apply.sq_recruit_id=${sq_recruit_artist.sq_recruit_id}" class="btn btn-circle btn-default btn-lg"><i class="fa fa-plus"></i></a>
		                </article>
	                </s:if>
	                
	                <!-- 아티스트로 로그인한 상태에서 로그인 아이디가 글쓴 아이디가 아닐 경우 지원할 수 있는 버튼/ 지원했던 지원자는 취소버튼 추가. -->
	                <s:elseif test="#session.loginId != null && #session.loginId != sq_recruit_artist.sq_member_id">
	                	<article class="center" id="test">
		                    <a id="applyThisRecruit" class="btn btn-circle btn-default btn-lg"></a>
		                    <a id="cancelThisRecruit" class="btn btn-circle btn-default btn-lg"></a>
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