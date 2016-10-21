<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="assets/fonts/font-awesome.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Roboto:700,400,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="assets/css/bootstrap-select.min.css" type="text/css">
    <link rel="stylesheet" href="assets/css/owl.carousel.css" type="text/css">
    <link rel="stylesheet" href="assets/css/jquery.nouislider.min.css" type="text/css">
    <link rel="stylesheet" href="assets/css/style.css" type="text/css">
    <link rel="stylesheet" href="assets/css/layout.css" type="text/css">
	<style>
    	.hidden{
    		display : none;
    	}
    </style>
    <title>SQUARIZE - BUSKING</title>

</head>

<body id="page-top" class="has-map">

<div id="page-wrapper">
    <div class="collapse has-tabs" id="user-area">
        <div class="container">
            <div class="inner">
                <a href="#" class="close" data-close-parent="#user-area"><img src="assets/img/close.png" alt=""></a>
                <div class="row">
                    <div class="col-md-3 col-md-offset-9">
                        <div role="tabpanel">
                            <!-- Nav tabs -->
                            <ul class="nav nav-pills" role="tablist" id="tab_menu">
                            <!-- 여기부터 3개는 새로 생킨 탭에 있는 탭 제목 -->
                            <s:if test="#session.loginId == null">
                                <li role="presentation"><a href="#sign-in" aria-controls="sign-in" role="tab" data-toggle="tab" data-transition-parent="#sign-in" id="tab_login">Login</a></li>
                                <li role="presentation"><a href="#register" aria-controls="register" role="tab" data-toggle="tab"  data-transition-parent="#register" id="tab_register">Register</a></li>
                            </s:if>
                            <s:else>
                                <li role="presentation"><a href="#makeArtist" aria-controls="makeArtist" role="tab" data-toggle="tab"  data-transition-parent="#makeArtist" id="tab_makeArtist">Make Artist</a></li>
                            </s:else>
                            </ul>
                            <!-- 각각 탭안에 있는 내용물들 -->
                            <!-- 로그인 -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane" id="sign-in">
                                    <form role="form" method="post" id="form-sign-in">
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="text" class="form-control" id="sign-in-id" name="id" placeholder="ID">
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="password" class="form-control" id="sign-in-pw" name="pw" placeholder="PW">
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <button type="button" class="btn btn-primary" id="sign-in-submit">Log In</button>
                                        </div>
                                        <!--end .form-group-->
                                    </form>
                                </div>
                                
                            <!-- 회원가입 -->
                                <div role="tabpanel" class="tab-pane" id="register">
                                    <form role="form" method="post" id="form-register" action="registerSQmember?fromWhere=rent">
                                        <div class="form-group animate move_from_bottom_short" id="idInput">
                                            <input type="text" class="form-control" id="register-id" name="register-id" placeholder="ID">
                                           	<span id="id-check"></span>
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="text" class="form-control" id="register-name" name="register-name" placeholder="Name">
                                        </div>
                                        <!--end .form-group-->
                                        
                                        <div class="form-group">
                                            <select id="register_favorite" size="3">
                                            	<option>선호장르</option>
                                            	<option value="rock">락</option>
                                            	<option value="ballad">발라드</option>
                                            	<option value="jazz">재즈</option>
                                            	<option value="hiphop">힙합</option>
                                            </select>
                                        </div>
                                        <!--end .form-group-->
                                        
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="email" class="form-control" id="register-email" name="register-email" placeholder="Email">
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="password" class="form-control" id="register-password" name="register-password" placeholder="Password">
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="password" class="form-control" id="register-confirm-password" name="register-confirm-password" placeholder="Confirm Password">
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <button type="button" class="btn btn-primary" id="register_btn">Register</button>
                                        </div>
                                        <!--end .form-group-->
                                    </form>
                                </div>
                                
                                <!-- 로그아웃 -->
                                <div role="tabpanel" class="tab-pane" id="logout">
                                	<div class="form-group animate move_from_bottom_short">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Name">
                                    </div>
                                </div>
                                
                                <!-- 아티스트 인증 -->
                                <div role="tabpanel" class="tab-pane" id="makeArtist">
                                	<form role="form" method="post" id="form-register" action="addArtist?fromWhere=rent">
                                        <div class="form-group animate move_from_bottom_short" id="phoneInput">
                                            <input type="text" class="form-control" id="add-artist-phone" name="add-artist-phone" placeholder="PHONE">
                                        </div>
                                        <div class="form-group animate move_from_bottom_short" id="photoInput">
                                            <input type="file" class="form-control" id="add-artist-photo" name="add-artist-photo" placeholder="PHOTO">
                                        </div>
                                        <div class="form-group animate move_from_bottom_short">
                                            <button type="button" class="btn btn-primary" id="makeArtist_submit">Make Artist</button>
                                        </div>
                                    </form>
                                </div>
                                
                                
                            </div>
                        </div>
                    </div>
                    <!--end .col-md-3-->
                </div>
                <!--end .row-->
            </div>
            <!--end .container-->
        </div>
        <!--end .inner-->
    </div>
    <!--end User area-->
    <header class="animate" id="header">
        <div class="container">
            <div class="header-inner">
                <nav class="secondary">
                    <ul id="main_menu">
                    <!-- 메인페이지에 보이는 메뉴들 -->
                    <s:if test="#session.loginId == null">
                        <li><a href="#user-area" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" data-tab="#sign-in" data-transition-parent="#header" id="main_login">logIn</a></li>
                        <li><a href="#user-area" class="promoted" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" data-tab="#register" data-transition-parent="#header" id="main_register">Register</a></li>
                    </s:if>
                    <s:else>
                        <li><a href="#" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" id="main_logout">logout</a></li>
                        <li><a href="#user-area" class="promoted" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" data-tab="#makeArtist" data-transition-parent="#header" id="main_makeArtist">make artist</a></li>
                    </s:else>
                    </ul>
                </nav>
                <!--end Secondary navigation-->
                <nav class="main">
                    <div class="brand">
                        <a href="index.action">
                            <img src="assets/img/logo.png" alt="brand">
                        </a>
                    </div>
                    <ul>
                        <li>
                            <a href="#" class="has-child">Home</a>
                            <ul>
                                <li><a href="toSeekingMain.action">구인글</a></li>
                                <li><a href="toRentMain.action">대관글</a></li>
                                <li><a href="#">Something 3</a></li>
                                <li><a href="#">Something 4</a></li>
                            </ul>
                        </li>
                        <li><a href="toPortfolio.action" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true">My Portfolio</a></li>
                        <li><a href="persons_e.action" data-expand-width="col-6" data-transition-parent=".content-loader" data-external="true">Agents</a></li>
                        <li><a href="faq_e.action" data-expand-width="col-6" data-transition-parent=".content-loader" data-external="true">FAQ</a></li>
                        <li><a href="contact_e.action" data-expand-width="col-6" data-transition-parent=".content-loader" data-external="true">Contact</a></li>
                    </ul>
                    <div class="toggle-nav">
                        <div class="dots">
                            <i class="fa fa-circle"></i>
                            <i class="fa fa-circle"></i>
                            <i class="fa fa-circle"></i>
                        </div>
                    </div>
                </nav>
                <!--end Main navigation-->
            </div>
            <!--end .header-inner-->
        </div>
        <!--end .container-->
        <div class="container">
            <div class="submit-container">
                <a href="#search-collapse" class="btn btn-default btn-sm show-filter" data-toggle="collapse" aria-expanded="false" aria-controls="search-collapse">Search Filter</a>
                <a href="toAddRent.action" class="submit-button" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true"><i><img src="assets/img/plus.png" alt=""></i></a>
            </div>
        </div>
    </header>
    <!--end Header-->

    <div class="page-content">
        <div class="search collapse" id="search-collapse"> <!-- 여기 class에서 in 을 뺏더니 접혀 있음. 나중에 문제 생기면 in 넣어야하는지 의심 -->
            <div class="container">
                <form class="main-search" role="form" method="post" action="#">
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label for="type">Genre</label><br>
                                <input type="text" class="animate" id="type">
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <!--/.col-md-6-->
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label for="location">Location</label>
                                <div class="input-group location">
                                    <input type="text" class="form-control" id="location" placeholder="Enter Location">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default animate" type="button"><i class="fa fa-map-marker geolocation" data-toggle="tooltip" data-placement="bottom" title="Find my position"></i></button>
                                    </span>
                                </div>
                            </div>
                            <!-- /.form-group -->
                        </div>
                    </div>
                    <!--/.row-->
                </form>
                <!-- /.main-search -->
            </div>
            <!--end .container-->
        </div>
        <!--end .search-->

        <div class="content-inner">
            <div class="container" id="main-container">
                <div class="content-loader">
                    <div class="content fade_in animate">
                        <a href="#" class="close" id="close"><img src="assets/img/close.png" alt=""></a>
                        <!--external content goes here-->
                    </div>
                </div>
                <!--end Content Loader-->
            </div>
        </div>

        <div class="map-wrapper grid">
            <div class="map" id="map"></div>
            <!--end .map-->
        </div>
        <!--end .map-wrapper-->

    </div>
    <!--end Page Content-->
</div>

			<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
			<script type="text/javascript" src="assets/js/imagesloaded.pkgd.min.js"></script>
			<script type="text/javascript" src="assets/js/jquery-migrate-1.2.1.min.js"></script>
			<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
			<script type="text/javascript" src="assets/js/jquery.color-2.1.2.min.js"></script>
			<script type="text/javascript" src="assets/js/jquery.average-color.js"></script>
			<script type="text/javascript" src="assets/js/masonry.pkgd.min.js"></script>
			<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyAeZB9L58YYqTQo0pz8Awbw6J_e9jYUcOI&sensor=false&libraries=places"></script>
			<script type="text/javascript" src="assets/js/infobox.js"></script>
			<script type="text/javascript" src="assets/js/richmarker-compiled.js"></script>
			
			<script type="text/javascript" src="assets/js/markerclusterer.js"></script>
			<script type="text/javascript" src="assets/js/smoothscroll.js"></script>
			<script type="text/javascript" src="assets/js/owl.carousel.min.js"></script>
			<script type="text/javascript" src="assets/js/bootstrap-select.js"></script>
			<script type="text/javascript" src="assets/js/icheck.min.js"></script>
			
			<script type="text/javascript" src="assets/js/jquery.nouislider.all.min.js"></script>
			<script type="text/javascript" src="assets/js/jquery.inview.min.js"></script>
			<script type="text/javascript" src="assets/js/custom.js"></script>
		
							
			<script type="text/javascript" src="assets/js/imsi.js"></script>
			<script type="text/javascript" src="assets/js/functions.js"></script>
			

<!--[if lte IE 9]>
<script type="text/javascript" src="assets/js/ie-scripts.js"></script>
<![endif]-->

<script>
	var _latitude = 37.5564059;
	var _longitude = 126.9259563;
    var jsonPath = 'assets/json/items.json';
    	  $(function(){
    		  $.ajaxSettings.traditional = true;
			    var data;
		//	    var list;
		//	    var list = "{ 'data':" + data + "}";
    		  
    		$.ajax({
    			method : "get",
    			url : "toBuskingList",
    			dataType : "JSON",
    			success : function(resp){
    				data = resp.buskingList;
    				
    				/*  alert(JSON.stringify(data)); */
    				 
    				 var list = JSON.stringify(data);
/*     			$.each(data, function(index,d){
    					alert(d[index].SQ_MEMBER_ID);
    					
    				}); */
    				var test =
   					{
    					data:[
	    						{
		    						"id": "1",
		    						"title": "밤을 잊은 그대에게 -베이스세션",
		    						"location": "홍대입구",
		    						"latitude": "37.5564059",
		    						"longitude": "126.9259563",
		    						"url": "assets/pages/items/1_e.html",
		    						"genre": "헤비메탈",
		    						"type_icon": "",
		    						"rating": "4",
		    						"gallery": [
		    							"assets/img/items/1.jpg",
		    							"assets/img/items/2.jpg",
		    							"assets/img/items/3.jpg"
		    						],
		    						"price": "$2500",
		    						"overview": {
		    							"bedrooms": "2",
		    							"bathrooms": "2",
		    							"rooms": "4",
		    							"garages": "1",
		    							"area": "240"
		    						},
		    						"description": "Curabitur odio nibh, luctus non pulvinar a, ultricies ac diam. Donec neque massa, viverra interdum eros ut, imperdiet pellentesque mauris. Proin sit amet scelerisque risus. Donec semper semper erat ut mollis. Curabitur suscipit, justo eu dignissim lacinia, ante sapien pharetra duin consectetur eros augue sed ex. Donec a odio rutrum, hendrerit sapien vitae, euismod arcu."
	    						}
    						]
    				};
    				
    				
    				
// 				     $.getJSON(jsonPath)
// 				            .done(function(json) {
// 				            	alert(resp.buskingList);
// 				                createHomepageGoogleMap(_latitude,_longitude,json);
// 				            })
// 				            .fail(function( jqxhr, textStatus, error ) {
// 				                console.log(error);
// 				            });

					$.ajax({
						"url" : "toBuskingList"
						, "method" : "post"
						, "success" : function(resp){
							var data = resp.buskingList
							
				                createHomepageGoogleMap(_latitude,_longitude, data);
						}
					});
					
    			}
    		});
    	});
    
    // Load JSON data and create Google Map

</script>

</body>
</html>