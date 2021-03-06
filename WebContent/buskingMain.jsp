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
    <style type="text/css">
    
    #markerImage{
    	text-align: center;	
    }
  	#main-container{
  		width:100% !important;
  	}
  	.wrapper{
  		width:80%;
  		text-align: center;
  		margin:0 auto;
  	}
  	.map-wrapper #map{
  		width:100%;
  		overflow:hidden;
  		margin-top:30px;
  	}
  	#submit-page{
  		margin-left:10%;
  	}
  	#main-section{
  		position:relative;
  		overflow:hidden;
  	}
  	.map-wrapper .grid{
  		top:0;
  		left:0;
  	}
  	#main-section > .map-wrapper .grid .offset-col-9 .idle{
 		margin-left : 150px !important;
  	
  	}
  	#main-section > .map-wrapper .grid .offset-col-9 .idle > #map{
  		position : absolute;
  	}
  	#bandName{
  		padding-bottom: 5px;
  	}
  	
  	#first_div {
        margin-right: -130px;
     }
     
     #search{
        margin-bottom: -10px !important;
     }
     #reset{
        margin-bottom: -10px !important;
     }
     img.img{
     	display: inline-block;
     }
    </style>
    
    <title>SQUARIZE - BUSKING</title>
	
</head>

<body id="page-top" class="fullscreen-map has-map">

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
                                <li role="presentation"><a href="#updateSQmember" aria-controls="updateSQmember" role="tab" data-toggle="tab"  data-transition-parent="#updateSQmember" id="tab_updateSQmember">정보수정</a></li>
                            	<s:if test='#session.isArtist == "N"'>
                            		<li role="presentation"><a href="#makeArtist" aria-controls="makeArtist" role="tab" data-toggle="tab"  data-transition-parent="#makeArtist" id="tab_makeArtist">Make Artist</a></li>
                            	</s:if>
                            </s:else>
                            </ul>
                            <!-- 각각 탭안에 있는 내용물들 -->
                            <!-- 로그인 -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane" id="sign-in">
                                    <form role="form" method="post" id="form-sign-in">
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="text" class="form-control" id="sign-in-id" name="sign-in-id" placeholder="ID">
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
                                    <form role="form" method="post" id="form-register" action="registerSQmember?fromWhere=busking">
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
                                            	<option>락</option>
                                            	<option>발라드</option>
                                            	<option>재즈</option>
                                            	<option>힙합</option>
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
                                
                                <!--회원정보 수정  -->
                                <div role="tabpanel" class="tab-pane" id="updateSQmember">
                                    <form role="form" method="post" id="form-update" action="updateSQmember.action?fromWhere=busking" enctype="multipart/form-data">
                                        <div class="form-group animate move_from_bottom_short" id="idInput">
                                            <input type="text" class="form-control" id="update-id" name="sq_member.sq_member_id" readonly>
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="text" class="form-control" id="update-name" name="sq_member.sq_member_name" readonly>
                                        </div>
                                        <!--end .form-group-->
                                        
                                        <div class="form-group">
                                            <select id="update_favorite" size="3" name="sq_member.sq_member_favorite">
                                            	<option>선호장르</option>
                                            	<option>락</option>
                                            	<option>발라드</option>
                                            	<option>재즈</option>
                                            	<option>힙합</option>
                                            </select>
                                        </div>
                                        <!--end .form-group-->
                                        
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="email" class="form-control" id="update-email" name="sq_member.sq_member_email" readonly>
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="password" class="form-control" id="update-password" name="update-password" placeholder="password">
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="password" class="form-control" id="update-confirm-password" name="update-confirm-password" placeholder="confirm-password">
                                        </div>
                                        <!--end .form-group-->
                                        <s:if test='#session.isArtist == "Y"'>
	                                        <div class="form-group animate move_from_bottom_short" id="phoneInput">
	                                            <input type="text" class="form-control" id="update-artist-phone" name="sq_artist.sq_artist_phone" >
	                                        </div>
	                                        <div class="form-group animate move_from_bottom_short" id="phoneInput">
	                                            <textarea class="form-control" id="update-artist-intro" name="sq_artist.sq_artist_intro"  rows="8"></textarea>
	                                        </div>
	                                        <div class="form-group animate move_from_bottom_short" id="photoInput">
	                                            <input type="file" class="form-control" id="update-artist-photo" name="upload">
	                                        </div>
                                        </s:if>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <button type="button" class="btn btn-primary" id="update_btn">update</button>
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
<%--                                 <s:if test='#session.isArtist == "N"'> --%>
	                                <div role="tabpanel" class="tab-pane" id="makeArtist">
	                                	<form role="form" method="post" id="form-makeArtist" action="addArtist?fromWhere=busking" enctype="multipart/form-data">
	                                        <div class="form-group animate move_from_bottom_short" id="phoneInput">
	                                            <input type="text" class="form-control" id="add-artist-phone" name="sq_artist.sq_artist_phone" placeholder="PHONE (JUST NUMBER)">
	                                        </div>
	                                        <div class="form-group animate move_from_bottom_short" id="phoneInput">
	                                            <textarea class="form-control" id="add-artist-intro" name="sq_artist.sq_artist_intro" placeholder="INTRODUCE YOURSELF" rows="8"></textarea>
	                                        </div>
	                                        <div class="form-group animate move_from_bottom_short" id="photoInput">
	                                            <input type="file" class="form-control" id="add-artist-photo" name="upload" placeholder="PHOTO">
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
                    	<li><a href="#user-area" id="update" data-toggle="collapse" aria-expanded="false" data-tab="#" aria-controls="user-area">${sessionScope.loginId } 님 환영합니다!</a></li>
                        <li><a href="#" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" id="main_logout">logout</a></li>
                        <s:if test='#session.isArtist == "N"'>
	                        <li><a href="#user-area" class="promoted" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" data-tab="#makeArtist" data-transition-parent="#header" id="main_makeArtist">make artist</a></li>
	                    </s:if>
                    </s:else>
                    </ul>
                </nav>
                <!--end Secondary navigation-->
                <nav class="main">
                    <div class="brand">
                        <a href="index.action">
                            
	                            <img class="smallLogo" src="img/smalllogo.png">
                           
                        </a>Busking
                    </div>
                    <ul>
                        <li>
                            <a href="toBuskingMain.action" class="has-child">홈</a>
                            <ul>
                                <li><a href="toBuskingMain.action">버스킹</a></li>
                                <li><a href="toSeekingMain.action">구인글</a></li>
                                <li><a href="toRentMain.action">대관글</a></li>
                            </ul>
                        </li>
                        <s:if test='#session.isArtist == "Y"'>
	                        <li>
	                            <a href="#" class="has-child">마이페이지</a>
	                            <ul>
	                                <li><a href="toPortfolio.action?fromWhere=busking" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true" id="portfolio_menu">My Portfolio</a></li>
	                            </ul>
	                        </li>
                        </s:if>
                        <!-- 추가 메뉴 필요하면 아래 주석달린 li태그 참고해서 만드세요 -->
<!--                         <li><a href="toPortfolio.action" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true" id="portfolio_menu">My Portfolio</a></li> -->
<!--                         <li><a href="persons_e.action" data-expand-width="col-6" data-transition-parent=".content-loader" data-external="true">Agents</a></li> -->
<!--                         <li><a href="faq_e.action" data-expand-width="col-6" data-transition-parent=".content-loader" data-external="true">FAQ</a></li> -->
<!--                         <li><a href="contact_e.action" data-expand-width="col-6" data-transition-parent=".content-loader" data-external="true">Contact</a></li> -->
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
                <s:if test='#session.isArtist == "Y"'>
                <a href="toAddBusking.action" class="submit-button" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true"><i><img src="assets/img/plus.png" alt=""></i></a>
           		</s:if>
            </div>
        </div>
    </header>
    <!--end Header-->

        <div class="search collapse" id="search-collapse"> <!-- 여기 class에서 in 을 뺏더니 접혀 있음. 나중에 문제 생기면 in 넣어야하는지 의심 -->
            <div class="container">
                <form class="main-search" role="form" method="post" action="#">
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                             <div class="form-group">
                                <label for="type">Genre</label><br>
<!--                                 <input type="text" class="animate" id="type"> -->
                                <select class="animate" id="type">
                                	<option>선호장르</option>
                                	<option>락</option>
                                	<option>발라드</option>
                                	<option>재즈</option>
                                	<option>힙합</option>
                                </select>
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
                        
                        <div class="col-md-2 col-sm-2">
                             <div class="form-group">
                                <label for="type">Band</label><br>
                             	<input type="text" class="animate" id="bandName">
                             </div>
                        </div>
<!--                             /.form-group -->
                        
<!--                           <div class="col-md-3 col-sm-3"> -->
<!--                             <div class="form-group abc"> -->
<!--                             	 <br> -->
<!--                             <a href="#search-collapse" id="search" class="btn btn-default btn-sm show-filter" data-toggle="collapse" aria-expanded="false" aria-controls="search-collapse">검색</a> -->
<!--                             </div> -->
<!-- 		                   </div> -->
		                            
<!--                           <div class="col-md-3 col-sm-3"> -->
<!--                             <div class="form-group abc"> -->
<!--                             <a href="#search-collapse" id="reset" class="btn btn-default btn-sm show-filter" data-toggle="collapse" aria-expanded="false" aria-controls="search-collapse">Reset</a> -->
<!--                             </div> -->
<!--                           </div> -->
<!-- <!--                             /.form-group -->
						<div class="col-md-2 col-sm-2" id="first_div">
                            <div class="form-group">
                                <br>
                            <a href="#search-collapse" id="search" class="btn btn-default btn-sm show-filter" data-toggle="" aria-expanded="false" aria-controls="search-collapse">Search</a>
                            </div>
<!--                             /.form-group -->
                        </div>
                        <div class="col-md-2 col-sm-2">
                            <div class="form-group">
                                <br>
                            <a href="#search-collapse" id="reset" class="btn btn-default btn-sm show-filter" data-toggle="collapse" aria-expanded="false" aria-controls="search-collapse">Reset</a>
                            </div>
<!--                             /.form-group -->
                        </div>

                    </div>
                    <!--/.row-->
                </form>
                <!-- /.main-search -->
            </div>
            <!--end .container-->
        </div>
        <!--end .search-->
    <div class="page-content">

        <div class="content-inner" id="some">
            <div id="main-container">
	            <div class="wrapper">
	            	<br>
					<div id="markerImage">
							<img src="assets/img/marker_blue.png"> 3일전
							<img src="assets/img/marker_red.png"> 1일전
							<img src="assets/img/marker_green.png"> 라이브
					</div>
	            </div>
	            <div id="main-section">
	            	<div class="wrapper">
		                <div class="content-loader" id="b-content-loader">
		                    <div class="content fade_in animate">
		                        <a href="#" class="close" id="close"><img src="assets/img/close.png" alt=""></a>
		<!--                         external content goes here -->
		                    </div>
		                </div>
		                <!--end Content Loader-->
	            	</div>
			        <div class="map-wrapper grid" id="changingPage">
			            <div class="map" id="map"></div>
			            <!--end .map-->
			        </div>
	            </div>
            </div>
		        <!--end .map-wrapper-->
        </div>


    </div>
    
    
    
    
    <!--end Page Content-->
</div>
<div class="loadingpage loading">
	<div class="loading-img"></div>	
</div>

		 <script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
         <script type="text/javascript" src="assets/js/sq_member.js"></script>
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
                     
         <script type="text/javascript" src="assets/js/functions.js"></script>

<!--[if lte IE 9]>
<script type="text/javascript" src="assets/js/ie-scripts.js"></script>
<![endif]-->

<script type="text/javascript">


   var _latitude = 36.265778;
   var _longitude = 127.884858;
																//     var jsonPath = 'assets/json/items.json';
																    
																//     $.getJSON(jsonPath)
																//      .done(function(json) {
																//          createHomepageGoogleMap(_latitude,_longitude,json);
																         
																//          alert(json.data[0].latitude);
																         
																//      })
																//      .fail(function( jqxhr, textStatus, error ) {
																//          console.log(error);
																//      });
																   
																   
																//    var searchResult;

   $(function(){
   		//select box를 클릭했을 때 실행
	   $('.submit-button').click(function(){
		   var margin=$('#b-content-loader').width();
		 /*  $('.map-wrapper').stop().animate({
			  left:margin+"px",
			  top:"0"
		   },500); */
		   /* $('.map-wrapper').addClass("idle"); */
		   /* $('.map-wrapper').removeClass("idle"); */
		  /*  
		   $('.map-wrapper').removeClass("grid"); */
		   $('#map').css('display','none');
		   
	   });
		   var top=$('#header').height();
		   $('.page-content').css('margin-top',top+'px');
		   
	   //회원가입/정보수정/로그인시 고정된 헤더 relative로 아래 안움직이게
	   $(".secondary #main-menu").click(function(){
		   if($('#user-area').hasClass('in')){
			   var height=$(window).height();
			   $('body').css('overflow','hidden');
		   }
	   });
	   
	 //로그아웃
		$("ul#main_menu").on("click", "a#main_logout", function(){
			location.href = "logoutSQmember.action?fromWhere=busking";
		});
	 
	   $("#type").change(function(){
		   var genre = $('#type option:selected()').val();
		   var item = {"genre": genre};		   
		   
		   if(genre == '선호장르'){
			   $.ajax({
				      url : "toBuskingList"
				      , method : "post"
				      , dataType : "json"
				      , success : function(resp){
				         var list = resp.buskingArraylist;
				         var jsonArray = new Array();
				          $.each(list, function(index, item){
				            jsonArray.push(JSON.parse(item));
				         }); 
				         var finalJson = {"data" : jsonArray};
				         createHomepageGoogleMap(_latitude,_longitude,finalJson);
				      }
				      , error : function(){
				         alert("실패");
				      } 
				   });
		   }else{
			   $.ajax({
				      url : "toSearchList"
				      , method : "post"
				      , data : item
				      , dataType : "json"
				      , success : function(resp){
				         var list = resp.buskingArraylist;
				         var jsonArray = new Array();
				          $.each(list, function(index, item){
				            jsonArray.push(JSON.parse(item));
				         }); 
				         var finalJson = {"data" : jsonArray};      //data : {   [   {  }, {   }   ]   }
				         createHomepageGoogleMap(_latitude,_longitude,finalJson);
				      }
				      , error : function(){
				         alert("실패");
				      } 
			   });
		   }
	   });
	   
		 //밴드명을 적었을 때 실행
	   $("#search").click(function(){
		   var bandName = $('#bandName').val();
		   var item = {"bandName": bandName};	
		   $.ajax({
			      url : "toSearchBand"
			      , method : "post"
			      , data : item
			      , dataType : "json"
			      , success : function(resp){
			         var list = resp.buskingArraylist;
			         var jsonArray = new Array();
			          $.each(list, function(index, item){
			            jsonArray.push(JSON.parse(item));
			         }); 
			         var finalJson = {"data" : jsonArray};
			         createHomepageGoogleMap(_latitude,_longitude,finalJson);
			      }
			      , error : function(){
			         alert("실패");
			      } 
			   });
	   });
	   
		 //초기화를 클릭했을 때 실행
	   $("#reset").click(function(){
		   $.ajax({
			      url : "toBuskingList"
			      , method : "post"
			      , dataType : "json"
			      , success : function(resp){
			         var list = resp.buskingArraylist;
			         var jsonArray = new Array();
			          $.each(list, function(index, item){
			            jsonArray.push(JSON.parse(item));
			         }); 
			         var finalJson = {"data" : jsonArray};
			         createHomepageGoogleMap(_latitude,_longitude,finalJson);
			      }
			      , error : function(){
			         alert("실패");
			      } 
			   });
	   });
		 
	   $('#close').click(function(){
		   $('#map').css('display','block');
	   });
 	}); // $(function())
   
 	
   //페이지가 시작되자마자 실행
   $.ajax({
      url : "toBuskingList"
      , method : "post"
      , dataType : "json"
      , success : function(resp){
         
         var list = resp.buskingArraylist;
         
         var jsonArray = new Array();
         
          $.each(list, function(index, item){
//             jsonArray.push(eval("(" + item + ")"));
            jsonArray.push(JSON.parse(item));
         }); 
//           var data = resp.source;
//          var jjj = JSON.parse(data);
//          var array = [jjj];

         var finalJson = {"data" : jsonArray};      //data : {   [   {  }, {   }   ]   }
                                       //            marker  gallery
//          alert(finalJson.data[0]);
//          alert(JSON.stringify(finalJson));
         
         createHomepageGoogleMap(_latitude,_longitude,finalJson);
      }
      , error : function(){
         alert("실패");
      } 
   });
    // Load JSON data and create Google Map
</script>
</body>
</html>