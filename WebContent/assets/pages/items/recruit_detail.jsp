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
                
                <!-- 
                <article class="animate move_from_bottom_short">
                    <h3>Features</h3>
                    <ul class="bullets">
                        <li>Air Conditioning</li>
                        <li>Balcony</li>
                        <li>Bedding</li>
                        <li>Cable TV</li>
                        <li>Dishwasher</li>
                        <li>Family Room</li>
                        <li>Fireplace</li>
                        <li>Grill</li>
                        <li>Outdoor Kitchen</li>
                        <li>Sauna</li>
                        <li>Landscaping</li>
                    </ul>
                </article>
                 -->
                
                <!--end Features-->
                <article>
                    <h3>Map</h3>
                    <div id="map-simple"></div>	<!-- idle클래스 추가 -->
                </article>
                <!--end Map-->
                
                <!-- 
                <article>
                    <h3>Reviews</h3>
                    <div class="review block">
                        <figure class="person-image">
                            <img src="assets/img/person-01.jpg" alt="">
                        </figure>
                        <header>Catherine Brown</header>
                        <div class="rating" data-rating="4"></div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vestibulum,
                            sem ut sollicitudin consectetur, augue diam ornare massa, ac vehicula leo
                            turpis eget purus. Nunc pellentesque vestibulum mauris, eget suscipit mauris
                            imperdiet vel. Nulla et massa metus.
                        </p>
                    </div>
                </article>
                <!--end Reviews-->
              <!--  
                <article class="center" id="test">
                    <a href="#" class="btn btn-circle btn-default btn-lg"><i class="fa fa-plus"></i></a>
                </article>
              --> 
                <!--end Add Review-->
            </div>
        </div>
        <!--end .col-md-8-->
    </div>
    <!--end .row-->
</div>
<!--end #item-detail-->
		<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
		<script type="text/javascript" src="assets/js/sq_member.js"></script>
		<script type="text/javascript" src="assets/js/sq_recruit.js"></script>
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
		<script type="text/javascript" src="assets/js/sq_recruit.js"></script>

<script type="text/javascript">

//위치을 찍어줄 위경도를 갖고 온다.
//지도에 마커를 찍는다.

	var _latitude = document.getElementById("sq_recruit_lat").value;
    var _longitude = document.getElementById("sq_recruit_lng").value;
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
        rating();	//rating()메소드 실행
        averageColor( $('.content-container') );
    }

    function hasClass(element, cls) {	// return : ' 'external' '.indexOf(' 'external' ') > -1
        return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
    }

</script>


</body>
</html>