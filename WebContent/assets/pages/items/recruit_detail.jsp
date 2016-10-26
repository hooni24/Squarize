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
	    <link href="../../css/style.css" rel="stylesheet" type="text/css">
	
	
	    <style>
	        #map-simple { min-height: 240px; }
	    </style>
	    
	    <script type="text/javascript">
	    	
	    
	    </script>
	
	    <title>구인 상세 정보</title>
	</head>
	<body class="external">
	
	<div id="item-detail" class="content-container">
	    <div class="row">
	        <div class="col-md-8">
	            <div class="inner">
	                <div class="items-switch">
	                    <a href="getRecruit_detail?sq_recruit.sq_recruit_id=${sq_recruit_id}+1" class=""><img src="assets/img/arrow-left.png"></a>
	                    <a href="getRecruit_detail?sq_recruit.sq_recruit_id=${sq_recruit_id}-1" class=""><img src="assets/img/arrow-right.png"></a>
	                </div>
	                <article class="animate move_from_bottom_short">
	                    <div class="gallery">
	                        <div class="image">
	                        	<s:if test="sq_recruit_artist.sq_recruit_photo == null">
	                        		<img src="assets/img/default-item.png" alt="">
	                        	</s:if>
	                        	<s:else>
	                         	   <img src="${sq_recruit_artist.sq_recruit_photo}" alt="">
	                        	</s:else>
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
	                                	<!-- 인사말 -->
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
		                    <a href="applied_list?sq_recruit_apply.sq_recruit_id=${sq_recruit_artist.sq_recruit_id}" class="btn btn-circle btn-default btn-lg"><i class="fa fa-plus"></i></a>
		                    <a href="recruit_update?sq_recruit_apply.sq_recruit_id=${sq_recruit_artist.sq_recruit_id}" class="btn btn-circle btn-default btn-lg"><i class="fa fa-plus"></i></a>
		                    <a href="recruit_delete?sq_recruit_apply.sq_recruit_id=${sq_recruit_artist.sq_recruit_id}" class="btn btn-circle btn-default btn-lg"><i class="fa fa-plus"></i></a>
		                </article>
	                </s:if>
	                
	                <!-- 아티스트로 로그인한 상태에서 로그인 아이디가 글쓴 아이디가 아닐 경우 지원할 수 있는 버튼추가. -->
	                <s:elseif test="#session.loginId != null && #session.loginId != sq_recruit_artist.sq_member_id">
	                	<article class="center" id="test">
		                    <a id="applyThisRecruit" class="btn btn-circle btn-default btn-lg"><i class="fa fa-plus"></i></a>
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
	
		<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
		<script type="text/javascript" src="assets/js/imagesloaded.pkgd.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery-migrate-1.2.1.min.js"></script>
		<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.color-2.1.2.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.average-color.js"></script>
		<script type="text/javascript" src="assets/js/masonry.pkgd.min.js"></script>
		<script type="text/javascript" src="assets/js/infobox.js"></script>
		<script type="text/javascript" src="assets/js/richmarker-compiled.js"></script>
		<script type="text/javascript" src="assets/js/markerclusterer.js"></script>
		<script type="text/javascript" src="assets/js/smoothscroll.js"></script>
		<script type="text/javascript" src="assets/js/owl.carousel.min.js"></script>
		<script type="text/javascript" src="assets/js/bootstrap-select.js"></script>
		<script type="text/javascript" src="assets/js/icheck.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.nouislider.all.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.inview.min.js"></script>
		<script type="text/javascript" src="assets/js/functions.js"></script>
		<script type="text/javascript" src="assets/js/custom.js"></script>
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyAeZB9L58YYqTQo0pz8Awbw6J_e9jYUcOI&sensor=false&libraries=places"></script>
		<script type="text/javascript" src="assets/js/sq_member.js"></script>
	
		<script type="text/javascript">
	
		//위치을 찍어줄 위경도를 갖고 온다.
		//지도에 마커를 찍는다.
	
			var _latitude = $('#sq_recruit_lat').val();
		    var _longitude = $('#sq_recruit_lng').val();
		    alert(_latitude+","+_longitude);	//나옴...
		    var draggableMarker = false;
		    var scrollwheel = true;
		    var element = document.querySelector('body');	//body
		
		    if( hasClass(element, 'external') ){	//hasClass():아래에 선언돼 있음. body class="external" 임: false
		        var head = document.getElementsByTagName('head')[0];	// 가장 처음 나오는 head태그를 갖고 옴.
		        var script = document.createElement('script');	//script 요소를 만듦.
		        script.type = 'text/javascript';	//script 의 속성을 정해줌.
		        script.src = "../../js/external.js";	
		        head.appendChild(script);	//script를 첫번째 head태그의 자식으로 붙임.
		        alert(head.className);
		    }
		    else {
		        simpleMap(_latitude, _longitude,draggableMarker, scrollwheel);	// funcitons.js의 simpleMap을 실행.
		   //   rating();	//별점메소드 실행
		        averageColor( $('.content-container') );
		    }
		
		    function hasClass(element, cls) {	// return : ' 'external' '.indexOf(' 'external' ') > -1
		        return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
		    }
		    
		    $(function(){
		    	$.ajaxSettings.traditional = true;
		    	var sq_recruit_id = $('#sq_recruit_id').val();
		    	$('#applyThisRecruit').on('click', function(){	/* 지원하기 버튼 눌렀을 때 */
	    			$.ajax({
		    			url : 'checkApplied'
		    			, method : 'POST'
		    			, data : sq_recruit_id
		    			, dataType : 'json'
		    			, success : function(response){
		    				// 지원여부 확인
		    				var applied = response.sq_recruit_apply;
		    				if(applied != null){
		    					alert("이미 지원하였습니다.");
		    				} else {	// 지원한 적이 없다면, 작성된 포트폴리오가 있는지
		    					$.ajax({
		    						url : 'checkPortfolio'
		    						, method : 'POST'
		    						, dataType : 'json'
		    						, success : function(response){
		    							var writtenPort = response.sq_portfolio;
		    							if(writtenPort != null) {	// 작성한 포트폴리오 있음.
		    								window.confirm('정말 지원하시겠습니까?', '지원 완료', '지원 취소');
		    							} else {	// 작성한 포트폴리오가 없으면, 작성 페이지 띄워주기.
		    								alert("제출할 포트폴리오를 먼저 작성해주세요.");
		    								$('#portfolio_menu').trigeer('click');
		    							}
		    							
		    						}
		    					});
		    					
		    				}
		    			}
		    			, error : function(response){
		    				
		    				
		    			}
		    		});
	    		
	    		
	    		});
		    	
		    });
		</script>
	
	
	</body>
</html>