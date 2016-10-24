<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

<html lang="en-US">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="assets/fonts/font-awesome.css" rel="stylesheet"	type="text/css">
<link href='http://fonts.googleapis.com/css?family=Roboto:700,400,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="assets/css/bootstrap-select.min.css" type="text/css">
<link rel="stylesheet" href="assets/css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="assets/css/jquery.nouislider.min.css" type="text/css">
<link rel="stylesheet" href="assets/css/style.css" type="text/css">

<title>SQUARIZE - SEEKING</title>
    <style>
    	.hidden{
    		display : none;
    	}
    </style>
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
                                
                                <!-- 로그아웃 -->
                                <div role="tabpanel" class="tab-pane" id="logout">
                                	<div class="form-group animate move_from_bottom_short">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Name">
                                    </div>
                                </div>
                                
                                <!-- 아티스트 인증 -->
<%--                                 <s:if test='#session.isArtist == "N"'> --%>
	                                <div role="tabpanel" class="tab-pane" id="makeArtist">
	                                	<form role="form" method="post" id="form-makeArtist" action="addArtist?fromWhere=seeking" enctype="multipart/form-data">
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
                    	<li><a href="#" data-toggle="collapse" aria-expanded="false" aria-controls="user-area">${sessionScope.loginId } 님 환영합니다!</a></li>
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
                        <li><a href="toPortfolio.action" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true" id="portfolio_menu">My Portfolio</a></li>
                        <li><a href="rentApplySituation.action" id="rent_apply_situation">내 지원현황</a></li>
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
                <a href="toAddSQrecruit.action" class="submit-button" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true"><i><img src="assets/img/plus.png" alt=""></i></a>
            </div>
        </div>
    </header>
		<!-- 여기서 부터 content -->
		<div class="page-content">
			<div class="search collapse in" id="search-collapse">
				<div class="container">
					<form class="main-search" role="form" method="post" action="#">
						<div class="row">
							<div class="col-md-3 col-sm-3">
								<div class="form-group">
									<label for="type">검색 키워드</label> <select name="type" title="전체"
										id="type" class="animate"
										data-transition-parent=".dropdown-menu">
										<!-- multiple title="전체" : 여러개 선택 가능 -->
										<option value="1">전체</option>
										<option value="2">세션</option>
										<option value="3">장르</option>
										<option value="4">이름</option>
										<!--        
                                    <option value="5">House</option>
                                    <option value="6">Construction Site</option>
                              -->
									</select>
								</div>
								<!-- /.form-group -->
							</div>
							<!--/.col-md-6-->

							<!-- 필요없는 요소 주석처리 -->
							
                        <div class="col-md-3 col-sm-3">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label for="bedrooms">Bedrooms</label>
                                        <div class="input-group counter">
                                            <input type="text" class="form-control" id="bedrooms" name="bedrooms" placeholder="Any">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default minus" type="button"><i class="fa fa-minus"></i></button>
                                            </span>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default plus" type="button"><i class="fa fa-plus"></i></button>
                                            </span>
                                        </div><!-- /input-group -->
                                    </div>
                                    <!-- /.form-group -->
                                </div>
                                <!-- /.col-md-3 -->
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label for="bathrooms">Bathrooms</label>
                                        <div class="input-group counter">
                                            <input type="text" class="form-control" id="bathrooms" name="bathrooms" placeholder="Any">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default minus" type="button"><i class="fa fa-minus"></i></button>
                                            </span>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default plus" type="button"><i class="fa fa-plus"></i></button>
                                            </span>
                                        </div><!-- /input-group -->
                                    </div>
                                    <!-- /.form-group -->
                                </div>
                                <!-- /.col-md-3 -->
                            </div>
                        </div>
                     
							<!-- 필요없는 요소 주석 끝 -->

							<div class="col-md-3 col-sm-3">
								<div class="form-group">
									<label for="location">위치</label>
									<div class="input-group location">
										<input type="text" class="form-control" id="location"
											placeholder="지역명 입력"> <span class="input-group-btn">
											<button class="btn btn-default animate" type="button">
												<i class="fa fa-map-marker geolocation"
													data-toggle="tooltip" data-placement="bottom"
													title="내 위치 선택"></i>
											</button>
										</span>
									</div>
								</div>
								<!-- /.form-group -->
							</div>

							<!-- 반경설정 코드 추가 필요(price 부분 반경으로 변경하기) -->
							<div class="col-md-3 col-sm-3">
								<div class="form-group">
									<label>반경설정</label>
									<!-- <div class="ui-slider" id="price-slider" data-value-min="400" data-value-max="5000" data-value-type="price" data-currency="$" data-currency-placement="before"> -->
									<div class="ui-slider" id="price-slider" data-value-min="100" data-value-max="40000" data-value-type="price" data-currency="$" data-currency-placement="before">
                                    <div class="values clearfix">
                                        <input class="value-min" name="value-min[]" readonly>
                                        <input class="value-max" name="value-max[]" readonly>
                                    </div>
                                    <div class="element"></div>
                                </div>
								</div>
								<!-- /.form-group -->
							</div>
							<!--/.col-md-6-->
							<!-- 반경설정 끝 -->

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
							<a href="#" class="close" id="close"><img
								src="assets/img/close.png" alt=""></a>
							<!--external content goes here-->
						</div>
					</div>
					<!--end Content Loader-->
				</div>
			</div>

			<!-- 구인정보 및 대관정보 썸네일 나열부분 시작 -->
<!-- DB에서 정보 받아와서 돌리면서 추가할 부분 -->
			<div class="masonry grid full-width animate">
				<s:iterator value="sq_recruit_list" var="each_recruit">
					<div class="item move_from_bottom idle">
						<a href="getRecruit_detail?sq_recruit_artist.sq_recruit_id=${sq_recruit_id}" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
	                <div class="inner">
	                    <div class="image">
	                        <div class="price average-color"><span>${sq_member_id}</span></div>
	                        <s:if test="sq_recruit_photo == null">
	                        	<img src="assets/img/main/seeking.jpg">
	                        </s:if>
	                        <s:else>
	                        	<img src="${sq_recruit_photo}" alt=""><!-- 소스에는 사진 -->
	                    	</s:else>
	                    </div>
	                    <div class="item-content">
	                        <header class="average-color">
	                            <h2>${sq_recruit_title}</h2><!-- 제목 -->
	                            <h3>${sq_recruit_part}</h3><!-- 파트 -->
	                        </header>
	                        <footer>
	                            <dl>
	                                <dt>음악 장르</dt>
	                                <dd>${sq_recruit_genre}</dd>
	                                <dt>연주 장소</dt>
	                                <dd>${sq_recruit_location}</dd>
	                                <dt>연주 일시</dt>
	                                <dd>${sq_recruit_date}</dd>
	                                <dt>구인 정보</dt>
	                                <dd>${sq_recruit_info}</dd>
	                            </dl>
	                        </footer>
	                    </div>
	                </div>
	            </a>
	        </div>
        <!--end .item-->
<!-- 요기까지 정보 넣기 -->
        <%-- <div class="item move_from_bottom idle">
            <a href="assets/pages/items/2_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                <div class="inner">
                    <div class="image">
                        <div class=""><span>$49.000</span></div>
                        <img src="assets/img/items/2.jpg" alt="">
                    </div>
                    <div class="item-content">
                        <header class="average-color">
                            <h2>3295 Valley Street</h2>
                            <h3>Collingswood</h3>
                        </header>
                        <footer>
                            <dl>
                                <dt>Bathrooms</dt>
                                <dd>1</dd>
                                <dt>Bedrooms</dt>
                                <dd>2</dd>
                                <dt>Area</dt>
                                <dd>165m<sup>2</sup></dd>
                                <dt>Garages</dt>
                                <dd>1</dd>
                            </dl>
                        </footer>
                    </div>
                </div>
            </a>
        </div>
        <!--end .item-->
 --%>
 	</s:iterator>
        </div>
	<!-- 나열부분 끝 -->
		</div>
		<!--end Page Content-->
	</div>

		<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
		<script type="text/javascript" src="assets/js/sq_member.js"></script>
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

		<script>
		$("ul#main_menu").on("click", "a#main_logout", function(){
			location.href = "logoutSQmember.action?fromWhere=seeking";
		});
		
		</script>

		
		<%-- 
		<script type="text/javascript">
			/* DB정보 입력 */
			$(function(){
				
				$.ajaxSettings.traditional = true;
				$.ajax({
					url : 'getResult_list'
					, dataType : 'json'
					, method : 'POST'
					, success : function(response){
						var sq_recruit_list = response.sq_recruit_list;
						$.each(sq_recruit_list, function(index,recruit_one){
							alert(recruit_one);
							$('.price average-color > span').innerHTML = recruit_one.sq_member_id;
							$('.price average-color ~ img').css('src',recruit_one.sq_recruit_photo);
						});
					
					}
					, error : function(response){
						console.log(response);
					}
				});
			});
		</script>
			 --%>
			
			
			<%-- 
			<div class="masonry grid full-width animate">
				<div class="item move_from_bottom idle">
				<a href="seeking/getRecruit_list" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                <div class="inner">
                    <div class="image">
                        <div class="price average-color"><span></span></div>
                        <img src="" alt="">
                    </div>
                    <div class="item-content">
                        <header class="average-color">
                            <h2></h2>
                            <h3></h3>
                        </header>
                        <footer>
                            <dl>
                                <dt></dt>
                                <dd></dd>
                                <dt></dt>
                                <dd></dd>
                                <dt></dt>
                                <dd></dd>
                                <dt></dt>
                                <dd></dd>
                            </dl>
                        </footer>
                    </div>
                </div>
            </a>
        </div>
         --%> 
		
		
		<!--[if lte IE 9]>
<script type="text/javascript" src="assets/js/ie-scripts.js"></script>
<![endif]-->
	
</body>
</html>