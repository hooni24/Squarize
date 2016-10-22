<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

    <title>SQUARIZE - RENT</title>
    
    <style>
    	.hidden{
    		display : none;
    	}
    </style>
    
    <script src="assets/js/jquery-2.1.0.min.js"></script>
    <script>
    	$(function(){
    		//로그인 ajax
    		$("button#sign-in-submit").on("click", function(){
    			var id = $("input#sign-in-id").val();
    			var pw = $("input#sign-in-pw").val();
    			var loginItem = {"sq_member_id" : id, "sq_member_pw": pw};
    			
	    		$.ajax({
	    			url : "loginSQmember"
	    			, method : "post"
	    			, data : loginItem
	    			, dataType : "json"
	    			, success : function(resp){
	    				$(".close").trigger("click");
	    				$("#main_login").addClass("hidden");
	    				$("#main_register").addClass("hidden");
	    				
	    				var welcome = '<li><a href="#" data-toggle="collapse" aria-expanded="false" aria-controls="user-area">'+resp.loginId+' 님 환영합니다!</a></li>';
	    				$("ul#main_menu").append(welcome);
	    				
	    				var logout = '<li><a href="#" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" id="main_logout">logout</a></li>';
	    				$("ul#main_menu").append(logout);

	    				if(resp.isArtist == 'N'){
		    				var makeArtist = '<li><a href="#user-area" class="promoted" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" data-tab="#makeArtist" data-transition-parent="#header" id="main_makeArtist">make artist</a></li>';
		    				$("ul#main_menu").append(makeArtist);
	    				}
	    				
	    				$("#tab_login").addClass("hidden");
	    				$("#tab_register").addClass("hidden");
	    				
	    				var tab_makeArtist = '<li role="presentation"><a href="#makeArtist" aria-controls="makeArtist" role="tab" data-toggle="tab"  data-transition-parent="#makeArtist" id="tab_makeArtist">Make Artist</a></li>';
	    				$("ul#tab_menu").append(tab_makeArtist);
	    				$("a#tab_makeArtist").trigger("click");
	    			}
	    			, error : function(){
	    				alert("실패");
	    			}
	    		});
    		});
    		
    		//로그아웃
    		$("ul#main_menu").on("click", "a#main_logout", function(){
    			location.href = "logoutSQmember.action?fromWhere=rent";
    		});
    		
    		//회원가입
    		$("button#register_btn").on("click", function(){
    			var id=$('#register-id');
    			var name=$('#register-name');
    			var favorite=$('#register_favorite');
    			var email=$('#register-email');
    			var pw=$('#register-password');
    			var pwConfirm=$('#register-confirm-password');
    			
    			if(id.val().length<4 || id.val().length>8){
    				alert("아이디는 4~8자로 입력해주세요");
    				id.focus();
    				return false;
    			}
    			if(idError=="t"){
    				alert("사용중인 아이디입니다. 다시 확인해주십시오");
    				id.focus();
    				return false;
    			}
    			if(name.val().length<2 || name.val().length>5){
    				alert("이름은 2~4자로 입력해주세요");
    				name.focus();
    				return false;
    			}
    			if(email.val().length<4 || email.val().length>20){
    				alert("이메일은 도메인포함 정확히 입력해주세요");
    				email.focus();
    				return false;
    			}
    			if(pw.val().length<4 || pw.val().length>8){
    				alert("비밀번호는 4~8자로 입력하여주세요");
    				pw.focus();
    				return false;
    			}
    			if(pw.val() != pwConfirm.val()){
    				alert("비밀번호를 확인하여주십시오");
    				pw.focus();
    				return false;
    			}
    			if(favorite.val()=="선호장르"){
    				alert("선호장르를 선택하여주십시오");
    				return false;
    			}
    			
    			var registerItem = {
    					'sq_member.sq_member_id' : id.val()
    					,'sq_member.sq_member_pw' : pw.val()
    					,'sq_member.sq_member_name' : name.val()
    					,'sq_member.sq_member_email' : email.val()
    					,'sq_member.sq_member_favorite' : favorite.val()
    					};
    			
    			$.ajax({
    				method : 'post'
    				,url : 'registerSQmember'
    				,data : registerItem
    				,success : function(){
    					alert("회원가입이 완료되었습니다. 로그인하여 주십시오");
    					$('#register-id').val("");
    					$('#register-name').val("");
    					$('#register-email').val("");
    					$('#register-password').val("");
    					$('#register-confirm-password').val("");
    					$('#register_favorite option:eq("선호장르")').attr('selected','selected');
    					$('#id-check').html(' ');
    					$('#id-check').css('color','black');
    					$('#register-id').css('color','black');
    					$('a#tab_login').trigger('click');
    				}
    				,error:function(){
    					alert("회원가입실패");
    				}
    			});
    		});
    		
    		//아이디 실시간 체크
    		$('#register-id').on('focusout',function(){
				var checkId=$('#register-id').val();
				
				if(checkId.length>3 && checkId.length<9){
					$.ajax({
						method:'post'
						,url:'idCheck'
						,data:{"sq_member_id":checkId}
						,success:function(send){
							if(checkId==""||checkId==null){
								$('#id-check').html(" ");
							}else if(send.sq_member!=null){
								idError="t";
								if(idError=="t"){
									$('#id-check').html("사용중인 아이디입니다.");
									$('#id-check').css('color','red');
									$('#register-id').css('color','red');
								}
							}else if(send.sq_member==null){
								$('#id-check').html("사용가능한 아이디입니다.");
								idError="f";
								$('#id-check').css('color','blue');
								$('#register-id').css('color','blue');
							} 
						}
						,error : function(){
							alert("error");
						}
					});
				}else {
					$('#id-check').html("아이디는 4~8자로 입력해주세요.");
					$('#id-check').css('color','red');
					$('#register-id').css('color','red');
				}
			});
    		
    		//아티스트 업그레이드
    		$("button#makeArtist_submit").on("click", function(){
    			var phone = $("input#add-artist-phone").val();
    			var intro = $("textarea#add-artist-intro").val();
    			var file = $("input#add-artist-photo").val();
    			var fileLength = file.length;
    			var ext = file.substring(fileLength-3, fileLength);	//확장자
    			
    			if(isNaN(phone)){
    				alert("전화번호는 숫자만 입력하세요");
    				return false;
    			}else if(fileLength < 1){
    				alert("사진을 반드시 업로드해주세요");
    				return false;
    			}else if(!(ext == "png" || ext == "PNG" || ext == "jpg" || ext == "JPG")){
    				alert("사진은 png나 jpg 파일만 업로드 가능합니다");
    				return false;
    			}else if(intro.length < 1){
    				alert("자기소개를 반드시 입력해 주세요");
    				return false;
    			}else {
	    			$("form#form-makeArtist")[0].submit();
    			}
    		});
    		
    		
    		
    	});
    	
    </script>
    
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
	                                	<form role="form" method="post" id="form-makeArtist" action="addArtist?fromWhere=rent" enctype="multipart/form-data">
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
<%--                                 </s:if> --%>
                                
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
                <a href="toAddRent.action" class="submit-button" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true"><i><img src="assets/img/plus.png" alt=""></i></a>
            </div>
        </div>
    </header>
    <!--end Header-->

    <div class="page-content">
        <div class="search collapse in" id="search-collapse">
            <div class="container">
                <form class="main-search" role="form" method="post" action="#">
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label for="type">Property Type</label>
                                <select name="type" multiple title="All" id="type" class="animate" data-transition-parent=".dropdown-menu">
                                    <option value="1">Apartment</option>
                                    <option value="2">Condominium</option>
                                    <option value="3">Cottage</option>
                                    <option value="4">Flat</option>
                                    <option value="5">House</option>
                                    <option value="6">Construction Site</option>
                                </select>
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <!--/.col-md-3 col-sm-3-->
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
                                <!--/.col-md-3-->
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
                                <!--/.col-md-3-->
                            </div>
                            <!-- .row -->
                        </div>
                        <!-- col-md-3 col-sm-3 -->
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
                        <!-- col-md-3 col-sm-3 -->
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label>Price</label>
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
                        <!--/.col-md-3 col-sm-3-->
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
        
       	<div class="masonry grid full-width animate">
	        <s:iterator value="rentList" var="rent">
		        <div class="item move_from_bottom idle">
		            <a href="toRentDetail.action?rent.sq_rent_id=${sq_rent_id }" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
		                <div class="inner">
		                    <div class="image">
		                        <div class="price average-color"><span>${sq_member_id }</span></div>
		                        <s:if test="sq_rent_photo != null">
			                        <img src="assets/downloadIMG/rent/${sq_rent_photo }" alt="">
		                        </s:if>
		                        <s:else>
			                        <img src="assets/img/items/1.jpg" alt="">
		                        </s:else>
		                        
		                    </div>
		                    <div class="item-content">
		                        <header class="average-color">
		                            <h2>${rent.sq_rent_band_name }</h2>
		                            <h3>${fn:substring(rent.sq_rent_concert_date, 0, 11) }</h3>
		                        </header>
		                        <footer>
		                            <dl>
		                                <dt>게시물 번호</dt>
		                                <dd>${sq_rent_id }</dd>
		                                <dt>지역</dt>
			                            <dd>${sq_rent_region }</dd>
			                            <dt>장르</dt>
			                            <dd>${sq_rent_genre }</dd>
			                            <dt>총 공연시간</dt>
			                            <dd>${sq_rent_running_time } 시간</dd>
			                            <dt>모집팀 수</dt>
			                            <dd>${sq_rent_team_count } 팀</dd>
		                            </dl>
		                        </footer>
		                    </div>
		                    <!--end .item-content -->
		                </div>
		                <!--end .inner -->
		            </a>
		        </div>
		        <!--end .item move_from_bottom idle  -->
	        </s:iterator>
	    </div>
	    <!--end .masonry grid full-width animate -->
    </div>
    <!--end Page Content-->
</div>
<!-- end Page Wrapper -->

<div id="loading"></div>

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

<!--[if lte IE 9]>
<script type="text/javascript" src="assets/js/ie-scripts.js"></script>
<![endif]-->

</body>
</html>