<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>SQUARIZE - Main</title>
	<!-- jQuery -->
    <script src="assets/js/jquery-2.1.0.min.js"></script>
    
    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

    <!-- Theme CSS -->
    <link href="css/grayscale.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="assets/css/layout.css" type="text/css">
    
    
    <style type="text/css">
    	div#user-area{
    		margin-left: 70%;
    	}
    	select{
    		width: 100%;
    		color: black;
    		border-radius: 3px;
    		padding: 5px;
    	}
    	select option{
    		font: bold 1.1em 맑은 고딕;
    		padding: 3px;
    		text-align: center;
    	}
    	select option:selected{
    		color: red;
    	}
    	.hidden{
    		display: none;
    	}
    	div.circle{
	    	margin: 10% 20px;
    		width: 200px;
    		height: 200px;
    		display: inline-block;
    		border-radius: 50%;
    		border: 5px solid red;
    		padding: 10px;
    		text-align: center;
    		font: 1.4em Montserrat;
    		padding-top: 9%;
    		cursor: pointer;
    		transition-duration: 0.2s;
    	}
    	div.circle:hover{
    		border-color: yellow;
    		font: 1.8em Montserrat;
    		padding-top: 8%;
    	}
    	body{
    		background-color: white;		/*index 본문 색깔*/
    		color: black;
    	}
    </style>
    
    <script type="text/javascript">
	    $(function(){
	    	//메인메뉴 클릭시 탭부분 띄워주는 트리거들
	    	$("a#main_login").on("click", function(){
	    		$("a#tab_login").trigger("click");
	    	});
	    	$("a#main_register").on("click", function(){
	    		$("a#tab_register").trigger("click");
	    	});
	    	$("a#main_makeArtist").on("click", function(){
	    		$("a#tab_makeArtist").trigger("click");
	    	});
	    	
	    	//링크 이동
	    	$("div.busking_count").on("click", function(){
	    		location.href = "toBuskingMain.action";
	    	});
	    	$("div.seeking_count").on("click", function(){
	    		location.href = "toSeekingMain.action";
	    	});
	    	$("div.rent_count").on("click", function(){
	    		location.href = "toRentMain.action";
	    	});
	    });
    </script>
    
    <script src="js/index-js.js"></script>

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <!-- 여기가 위쪽 메뉴바 -->
        <div class="container">
        <!-- 메뉴바에서 로고 부분 -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">
                   	작은 로고
                </a>
            </div>
            
            <div role="tabpanel" id="tabpanel">
            <div id="user-area" class="accordion-body collapse">
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
                                            <select id="register_favorite" size="4">
                                            	<option selected="selected">락</option>
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
	                                	<form role="form" method="post" id="form-makeArtist" action="addArtist?fromWhere=index" enctype="multipart/form-data">
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
            
            <!-- 메뉴바에 생기는 링크들 -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <li><a class="page-scroll" href="#about">About</a></li>
                    <s:if test="#session.loginId == null">
	                    <li><a href="#user-area" data-toggle="collapse" aria-expanded="false" aria-controls="tabpanel" data-tab="#sign-in" data-transition-parent="#tabpanel" id="main_login">Log In</a></li>
	                    <li><a href="#user-area" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" data-tab="#register" data-transition-parent="#tabpanel" id="main_register">Register</a></li>
                    </s:if>
                    <s:else>
                    	<s:if test='#session.isArtist == "N"'>
		                    <li><a href="#user-area" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" data-tab="register" data-transition-parent="#tabpanel" id="main_makeArtist">Make Artist</a></li>
		                </s:if>
	                    <li><a class="page-scroll" href="logoutSQmember.action">Log Out</a></li>
	                    <li><a class="page-scroll" href="toBuskingMain.action">Busking</a></li>
	                    <li><a class="page-scroll" href="toSeekingMain.action">Seeking</a></li>
	                    <li><a class="page-scroll" href="toRentMain.action">Rent</a></li>
                   	</s:else>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- 인트로 -->
    <header class="intro">
        <div class="intro-body">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h1 class="brand-heading">#불통 #정크랫 #취화선 #절레절레</h1>
                        <p class="intro-text">밴드와 버스커를 위한 최고의 사이트</p>
                        <a href="#about" class="btn btn-circle page-scroll">
                            <i class="fa fa-angle-double-down animated"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- About Section -->
    <section id="about" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>About SQUARIZE</h2>
                <p>
                	우리는 감성적인 메인 페이지를 가지고 있습니다.<br>
                	반갑습니다. 즐기세요.<br>
                	우리는 당신을 위한 많은 것을 준비했습니다.<br>
                	여러곳을 탐험해 보세요!<br>
                	즐거운 모험이 당신을 기다립니다!!<br>
                	자, 시작해볼까요?
                </p>
                <div class="count">
	                <div class="circle busking_count">
	                	${count.busking }<br>
	                	FOR Busking
	                </div>
	                <div class="circle seeking_count">
	                	${count.seeking }<br>
	                	FOR Recruit
	                </div>
	                <div class="circle rent_count">
	                	${count.rent }<br>
	                	FOR Rent
	                </div>
	            </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container text-center">
        	<p></p>
        </div>
    </footer>

	<div class="loadingpage loading">
		<div class="loading-img"></div>	
	</div>
	
    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/grayscale.min.js"></script>
    

</body>
</html>
