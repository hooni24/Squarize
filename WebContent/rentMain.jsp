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
    	a.search_icon{
	    	margin-bottom: -15px;
	    	border-radius: 35px;
	    	margin-left: 87%;
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
	    				if(resp.loginId != ''){
	    				
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
	    				}else {
	    					alert("비밀번호가 틀렸습니다");
	    				}
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
    			
   			    // 정규표현식으로 한글만 선택하도록 만듭니다.
   			    var languageCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
   			    // 입력한 ID와 정규표현식을 비교하여 한글 여부를 판단합니다.
   			    // test외에도 search ,exec , match등을 사용할 수 있습니다.
   			    if (languageCheck.test(id.val())) {
   			        alert("ID에 한글이 포함되어 있습니다.");
   			        return false;
   			    }else if(id.val().length<4 || id.val().length>8){
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
    					alert("이메일을 확인하시고 인증 URL을 눌러주세요");
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
    		
    		var visible = true;
    		//돋보기 있다없다
    		$("a#filter").on("click", function(){
    			if(visible){
    				$("a.search_icon").addClass("hidden");
    			}else {
    				$("a.search_icon").removeClass("hidden");
    			}
    			visible = !visible;
    		});
    		
    		//게시글 검색
    		$("a.search_icon").on("click", function(){
    			var genre = $("select#genre").val();
    			var concert_date_begin = $("input#concert_date_begin").val();
    			var concert_date_end = $("input#concert_date_end").val();
    			var region = $("input#location").val();
    			var range = $("input#range").val().split("k")[0];
    			
    			if(region.length < 1){
    				alert("지역을 반드시 입력하세요");
    				return false;
    			}
    			
    			$.ajax({
    				url : "https://maps.googleapis.com/maps/api/geocode/json?address="+region+"&key=AIzaSyAcZEsXq59r_WkhHw_uyjJsbE_zJvOspz8"
    				, method : "post"
    				, dataType : "json"
    				, success : function(resp){
    					var lat = resp.results[0].geometry.location.lat;
    					var lng = resp.results[0].geometry.location.lng;
    					
    					//form에서 submit 하는거
    					$("input#lat_hidden").val(lat);
    					$("input#lng_hidden").val(lng);
    					$("input#range_hidden").val(range);
    					$("form#form_search")[0].submit();
    					
    					
    					//ajax로 다녀와서 뿌리기
//     					var items = {
//     							"rent.sq_rent_genre" : genre
//     							, "rent.sq_rent_concert_date" : concert_date_begin
//     							, "rent.sq_rent_limit" : concert_date_end
//     							, "rent.sq_rent_lat" : lat
//     							, "rent.sq_rent_lng" : lng
//     							, "range" : range
//     					};
    					
//     					$.ajax({
//     						url : "searchRent.action"	//redirect해서 뿌리는걸로 해 보자.. db에서는 제대로 가져오는데 rentList가 계속 5개임
//     						, method : "post"
//     						, data : items
//     						, dataType : "json"
//     						, success : function(re){
//     							alert("성공");
//     							var searched = re.rentList;
//     							$.each(searched, function(index, item){
//     								alert(item.sq_rent_id);
//     							});
//     						}
//     						, error : function(){
//     							alert("실패");
//     						}
//     					});
    				}
    			});
    		});
    		
    	});	//$(function(){})
    	
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
                            <a href="toRentMain.action" class="has-child">홈</a>
                            <ul>
                                <li><a href="toSeekingMain.action">구인글</a></li>
                                <li><a href="toRentMain.action">대관글</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="has-child">마이페이지</a>
                            <ul>
                                <li><a href="toPortfolio.action" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true" id="portfolio_menu">My Portfolio</a></li>
                                <li><a href="getAllMyRent.action">내가 올린 글</a></li>
		                        <li><a href="rentApplySituation.action" id="rent_apply_situation">내 지원현황</a></li>
                            </ul>
                        </li>
<!--                         <li><a href="toPortfolio.action" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true" id="portfolio_menu">My Portfolio</a></li> -->
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
                <a class="btn btn-default btn-sm show-filter search_icon" ><input type="image" src="assets/img/search.png"></a>
                <a href="#search-collapse" class="btn btn-default btn-sm show-filter" data-toggle="collapse" aria-expanded="false" aria-controls="search-collapse" id="filter">Search Filter</a>
                <a href="toAddRent.action" class="submit-button" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true"><i><img src="assets/img/plus.png" alt=""></i></a>
            </div>
        </div>
    </header>
    <!--end Header-->

    <div class="page-content">
        <div class="search collapse in" id="search-collapse">
            <div class="container">
                <form class="main-search" role="form" method="post" action="searchRentRedirect" id="form_search">
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label for="type">장르</label>
                                <select name="rent.sq_rent_genre" id="genre" class="animate setWidth" data-transition-parent=".dropdown-menu">
                                    <option>락</option>
                                    <option>발라드</option>
                                    <option>재즈</option>
                                    <option>힙합</option>
                                </select>
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <!--/.col-md-3 col-sm-3-->
                        <div class="col-md-3 col-sm-3">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label for="concert_date_begin">공연날짜</label>
                                        <div class="input-group counter">
                                            <input type="date" class="form-control" id="concert_date_begin" name="rent.sq_rent_concert_date">
                                        </div><!-- /input-group -->
                                    </div>
                                    <!-- /.form-group -->
                                </div>
                                <!--/.col-md-3-->
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label for="concert_date_end">&nbsp;</label>
                                        <div class="input-group counter">
                                            <input type="date" class="form-control" id="concert_date_end" name="rent.sq_rent_limit">
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
                                <label for="location">지역</label>
                                <div class="input-group location">
                                    <input type="text" class="form-control" id="location" placeholder="지역을 입력하세요">
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
                                <label>반경</label>
                                <div class="ui-slider" id="price-slider" data-value-min="3" data-value-max="15" data-value-type="price" data-currency="km" data-currency-placement="after">
                                    <div class="values clearfix">
                                        <input class="value-max" id="range" readonly>
                                    </div>
                                    <div class="element"></div>
                                </div>
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <!--/.col-md-3 col-sm-3-->
                    </div>
                    <!--/.row-->
                    
                    <input type="hidden" name="rent.sq_rent_lat" id="lat_hidden">
                    <input type="hidden" name="rent.sq_rent_lng" id="lng_hidden">
                    <input type="hidden" name="range" id="range_hidden">
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
		            <a href="toRentDetail.action?rent.sq_rent_id=${sq_rent_id }&rent.sq_rent_genre=${sq_rent_genre}" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
		                <div class="inner">
		                    <div class="image">
		                        <div class="price average-color"><span>${sq_member_id }</span></div>
		                        <s:if test="sq_rent_photo != ''">
			                        <img src="assets/downloadIMG/rent/${sq_rent_photo }" alt="">
		                        </s:if>
		                        <s:else>
			                        <img src="assets/img/items/1.jpg" alt="">
		                        </s:else>
		                        
		                    </div>
		                    <div class="item-content">
		                        <header class="average-color">
		                            <h2>밴드명 : ${sq_rent_band_name }</h2>
		                            <h3>공연일 : ${fn:substring(sq_rent_concert_date, 0, 11) }</h3>
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