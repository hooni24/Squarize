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
		<link rel="stylesheet" href="assets/css/layout.css" type="text/css">
		
		<title>SQUARIZE - SEEKING</title>
	    <style>
	    	.hidden{
	    		display : none;
	    	}
	    	
	    	#divBtn {
	    		width: auto;
	    	}
	    	
	    	#divSubmitBtn, #for_small_list {
	    		padding-top: 20px;
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
	                                    <form role="form" method="post" id="form-register" action="registerSQmember?fromWhere=seeking">
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
	                                    <form role="form" method="post" id="form-update" action="updateSQmember.action?fromWhere=seeking" enctype="multipart/form-data">
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
	                            <img src="img/smalllogo.png" alt="brand">
	                        </a>
	                    </div>
	                    <ul>
	                        <li>
	                            <a href="toSeekingMain.action" class="has-child">홈</a>
	                            <ul>
	                                <li><a href="toBuskingMain.action">버스킹</a></li>
	                                <li><a href="toSeekingMain.action">구인글</a></li>
	                                <li><a href="toRentMain.action">대관글</a></li>
	                            </ul>
	                        </li>
	
	                        <li>
	                            <a href="#" class="has-child">마이페이지</a>
	                            <ul>
	                                <li><a href="toPortfolio.action?fromWhere=seeking" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true" id="portfolio_menu">My Portfolio</a></li>
	                                <li><a href="#">내가 올린 글</a></li>
			                        <li><a href="#">내 지원현황</a></li>
	                            </ul>
	                        </li>
	                        <!-- 추가 메뉴 필요하면 아래 주석달린 li태그 참고해서 만드세요 -->
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
	                <a href="toAddSQrecruit.action" class="submit-button" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true"><i><img src="assets/img/plus.png" alt=""></i></a>
	            </div>
	        </div>
	    </header>
	    
		<!-- 여기서 부터 content -->
		<div class="page-content">
			<div class="search collapse in" id="search-collapse">
				<div class="container">
					<form id="search_form" class="main-search" role="form" method="post" action="recruit_search_byKeyword">
						<div class="row">
							<div class="col-md-3 col-sm-3">
								<div class="form-group">
									<label for="type">검색 카테고리</label>
									<!-- select - option 을 쓰면, bootstrap 함수가 돌면서 동적로 div-ul-li-a-sapn-i태그의 쌍을 붙이면서 button으로 만듦. -->
									<select name="recruit_search_category" id="recruit_search_category" class="animate"
										data-transition-parent=".dropdown-menu">
										<!-- 원래 id="type" multiple title="전체" : 여러개 선택 가능 -->
										<option>대분류</option>
										<option>파트</option>
										<option>장르</option>
									</select>
								</div>
							</div>
							<!--/.col-md-3 col-sm-3-->
	
	                        <div class="col-md-3 col-sm-3" id="for_small_list">
                            	<div class="form-group">
                                    <label for="type"></label>
                                   
 <!--                                    	숨겨뒀다가 활성화시키기.(jquery에서 동적으로 붙으면, bootstrap class 적용이 안됨.) -->

                                  </div>
                                 <!-- /.form-group -->
	                        </div>
	                        <!-- .col-md-2 col-sm-2 -->
	
							
							<!-- .col-md-3 col-sm-3 -->
							
							<div class="col-md-3 col-sm-3">
								<div class="form-group">
									<label for="location">위치</label>
									<div class="input-group location">
										<input type="text" class="form-control" id="location" placeholder="지역명 입력">
										<span class="input-group-btn">
											<button class="btn btn-default animate" type="button">
												<i class="fa fa-map-marker geolocation"	data-toggle="tooltip" data-placement="bottom"
													title="내 위치 찾기"></i>
											</button>
										</span>
									</div>
								</div>
								<!-- /.form-group -->
							</div>
							<!-- .col-md-3 col-sm-3 -->
	
							<!-- 반경설정 코드 추가 필요(price 부분 반경으로 변경하기) -->
							<div class="col-md-2 col-sm-2">
								<div class="form-group">
									<label>반경설정</label>
									<div class="ui-slider" id="price-slider" data-value-min="3" data-value-max="15" data-value-type="price" data-currency="km" data-currency-placement="after">
                                    <div class="values clearfix">
                                        <input class="value-max" id="range" readonly>
                                    </div>
                                    <div class="element"></div>
                                </div>
								</div>
								<!-- /.form-group -->
							</div>
							<!--/.col-md-6-->
							<!-- 반경설정 끝 -->
							<div class="col-md-3 col-sm-3" id="divBtn">
								<div class="form-group">
									<div class="input-group counter" id="divSubmitBtn">
										<button id="searchBtn" class="form-control">검색</button>	<!-- 검색버튼 -->
                                    </div>
								</div>
								<!-- /.form-group -->
							</div>
						</div>
						<!--/.row-->
						<input type="hidden" id="small_" name="small_keyword">
						<input type="hidden" id="big_" name="big_keyword">
						<input type="hidden" name="sq_recruit.sq_recruit_latitude" id="lat_hidden">
	                    <input type="hidden" name="sq_recruit.sq_recruit_longitude" id="lng_hidden">
	                    <input type="hidden" name="range" id="range_hidden">
					</form>
					<!-- /.main-search -->
				</div>
				<!--.container-->
			</div>
			<!-- .search collapse in 서치메뉴 -->
			
			<div class="content-inner">
				<div class="container" id="main-container">
					<div class="content-loader">
						<div class="content fade_in animate">
							<a href="#" class="close" id="close"><img src="assets/img/close.png" alt=""></a>
							<!--external content goes here-->
						</div>
					</div>
					<!--end Content Loader-->
					<div class="masonry grid animate">
						<s:iterator value="sq_recruit_list" var="each_recruit">
							<div class="item move_from_bottom idle">
								<a href="getRecruit_detail?sq_recruit_artist.sq_recruit_id=${sq_recruit_id}" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
					              	<div class="inner">
					                    <div class="image">
					                        <div class="price average-color"><span>${sq_member_id}</span></div>
					                        <s:if test="sq_recruit_photo == ''">
					                        	<img src="assets/img/main/seeking.jpg">
					                        </s:if>
					                        <s:else>
					                        	<%-- <img src="${sq_recruit_photo}" alt=""><!-- 소스에는 사진 --> --%>
					                    	</s:else>
					                    </div>
					                    <div class="item-content">
					                        <header class="average-color">
					                            <h2>${sq_recruit_title}</h2><!-- 제목 -->
					                            <h3>${sq_recruit_part}</h3><!-- 파트 -->
					                        </header>
					                        <footer>
					                            <dl>
					                                <dt>연주 장르</dt>
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
				                    	<!-- .item-content -->
					                </div>
					                <!-- .inner -->
				           	 	</a>
			       			</div>
			       			<!-- .item move_from_bottom idle -->
							<!-- 요기까지 정보 넣기 -->
		 				</s:iterator>
		  		 	</div>
		  		 	<!-- .masonry grid animate -->
					<!-- 나열부분 끝 -->
				</div>
				<!-- .container -->
			</div>
			<!-- .content-inner -->
		</div>
		<!-- .page-content -->
	</div>
	<!-- #page-wrapper -->
	
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
				location.href = "logoutSQmember.action";
			});
				
			$(function(){
                              			
				$('#for_small_list').on("click", "ul#genre_sel li",function(){
					var selected = $(this).children().children().html();
					$("span#small_genre").text(selected);
					$("input#small_").val(selected);
				});
				
				$('#for_small_list').on("click", "ul#part_sel li",function(){
					var selected = $(this).children().children().html();
					$("span#small_part").text(selected);
					$("input#small_").val(selected);
				});
				
				$("select#recruit_search_category").change(function(){
					var large = $("select#recruit_search_category").val();
					$("input#big_").val(large);
// 					alert($("input#big_").val());
					if (large == "장르") {
 						$("input#big_").val(large);
						$('#for_small_list').html(
                            						'<label for="type" id="hidden_select"></label>'+
// 													'<select id="recruit_search_small" style="display: none;padding-top:20px;">'+
// 	                                 				'<option>소분류</option></select>'+
	                                 				'<div class="btn-group bootstrap-select open">'+
	                                 				'<button type="button" class="btn dropdown-toggle selectpicker btn-default" data-toggle="dropdown" data-id="recruit_search_small" title="소분류" aria-expanded="true">'+
	                                 				'<span class="filter-option pull-left" id="small_genre">소분류</span>&nbsp;<span class="caret"></span></button>'+
	                                 				'<div class="dropdown-menu open idle slide_in" style="max-height: 710px; overflow: hidden; min-height: 0px;">'+
	                                 				'<ul class="dropdown-menu inner selectpicker idle" id="genre_sel" role="menu" style="max-height: 710px; overflow-y: auto; min-height: 0px;">'+
	                                 				'<li rel="0" class="selected">'+
                                     				'<a tabindex="0" class="" style=""><span class="text">락</span><i class="glyphicon glyphicon-ok icon-ok check-mark">'+
                                     				'</i></a></li>'+
                                     				'<li rel="1">'+
                                     				'<a tabindex="1" class="" style=""><span class="text">발라드</span><i class="glyphicon glyphicon-ok icon-ok check-mark">'+
                                     				'</i></a></li>'+
                                     				'<li rel="2">'+
                                     				'<a tabindex="2" class="" style=""><span class="text">재즈</span><i class="glyphicon glyphicon-ok icon-ok check-mark">'+
                                     				'</i></a></li>'+
                                     				'<li rel="3">'+
                                     				'<a tabindex="3" class="" style=""><span class="text">힙합</span><i class="glyphicon glyphicon-ok icon-ok check-mark">'+
                                     				'</i></a></li>'+
	                                 				'</ul></div></div>'+
	                                 				'</div>'
                                    				);
					} else if (large == "파트") {
						$('#for_small_list').html(
                            						'<label for="type" id="hidden_select"></label>'+
	                                 				'<div class="btn-group bootstrap-select open">'+
	                                 				'<button type="button" class="btn dropdown-toggle selectpicker btn-default" data-toggle="dropdown" data-id="recruit_search_small" title="소분류" aria-expanded="true">'+
	                                 				'<span class="filter-option pull-left" id="small_part">소분류</span>&nbsp;<span class="caret"></span></button>'+
	                                 				'<div class="dropdown-menu open idle slide_in" style="max-height: 710px; overflow: hidden; min-height: 0px;">'+
	                                 				'<ul id="part_sel" class="dropdown-menu inner selectpicker idle" role="menu" style="max-height: 710px; overflow-y: auto; min-height: 0px;">'+
	                                 				'<li rel="0" class="selected">'+
                                     				'<a tabindex="0" class="" style=""><span class="text">보컬</span><i class="glyphicon glyphicon-ok icon-ok check-mark">'+
                                     				'</i></a></li>'+
                                     				'<li rel="1" class="selected">'+
                                     				'<a tabindex="1" class="" style=""><span class="text">기타</span><i class="glyphicon glyphicon-ok icon-ok check-mark">'+
                                     				'</i></a></li>'+
                                     				'<li rel="2" class="selected">'+
                                     				'<a tabindex="2" class="" style=""><span class="text">키보드</span><i class="glyphicon glyphicon-ok icon-ok check-mark">'+
                                     				'</i></a></li>'+
                                     				'<li rel="3" class="selected">'+
                                     				'<a tabindex="3" class="" style=""><span class="text">드럼</span><i class="glyphicon glyphicon-ok icon-ok check-mark">'+
                                     				'</i></a></li>'+
	                                 				'</ul></div></div>'+
	                                 				'</div>'
                                    			);
                    } else {
						$('#for_small_list').html(
                            						'<label for="type" id="hidden_select"></label>'+
	                                 				'<div class="btn-group bootstrap-select open">'+
	                                 				'<button type="button" class="btn dropdown-toggle selectpicker btn-default" data-toggle="dropdown" data-id="recruit_search_small" title="소분류" aria-expanded="true">'+
	                                 				'<span class="filter-option pull-left" id="small_part">소분류</span>&nbsp;<span class="caret"></span></button>'+
	                                 				'</div>'
	                                 			);
	               }
			
				});	//검색-대분류->소분류
				
				$('button#searchBtn').on('click', function(){
					var genre = $("select#genre").val();
	    			var region = $("input#location").val();
	    			alert(region);
	    			var range = $("input#range").val().split("k")[0];
	    			alert(range);
    				var lat;
    				var lng;
	    			if(region.length < 1) {
	    				alert("지역을 반드시 입력하세요");
	    				return false;
	    			}
	    			
	    			$.ajax({
	    				url : "https://maps.googleapis.com/maps/api/geocode/json?address="+region+"&key=AIzaSyAcZEsXq59r_WkhHw_uyjJsbE_zJvOspz8"
	    				, method : "post"
	    				, dataType : "json"
	    				, success : function(resp){
				    					lat = resp.results[0].geometry.location.lat;
				    					lng = resp.results[0].geometry.location.lng;
				    					alert(lat);
									}
					});
					$("input#lat_hidden").val(lat);
   					$("input#lng_hidden").val(lng);
   					$("input#range_hidden").val(range);
					$('form#search_form')[0].submit();
				});	
			});
		</script>
	
	</body>
</html>	
