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

    <title>SQUARIZE - BUSKING</title>
	
	<style type="text/css">
	    	html{
    		overflow: scroll;
    	}
	</style>
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
                            <ul class="nav nav-pills" role="tablist">
                                <li role="presentation"><a href="#sign-in" aria-controls="sign-in" id="sign_in_btn" role="tab" data-toggle="tab" data-transition-parent="#sign-in">Sign In</a></li>
                                <li role="presentation"><a href="#register" aria-controls="register" role="tab" data-toggle="tab"  data-transition-parent="#register">Register</a></li>
                            </ul>
                              <ul class="nav nav-artist hidden">
                                 <li role="presentation"><a href="#add-artist" aria-controls="add-artist" role="tab" data-toggle="tab"  data-transition-parent=".add-artist-pane">추가인증</a></li>
                              </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                               <div role="tabpanel" class="tab-pane" id="add-artist">
                                  <form action="form" method="post" id="form-add-artist">
                                     <div class="form-group animate move_from_bottom_short" id="phoneInput">
                                            <input type="text" class="form-control" id="add-artist-phone" name="add-artist-phone" placeholder="PHONE">
                                        </div>
                                        <div class="form-group animate move_from_bottom_short" id="photoInput">
                                            <input type="text" class="form-control" id="add-artist-photo" name="add-artist-photo" placeholder="PHOTO">
                                        </div>
                                        
                                  </form>
                               </div>
                                <div role="tabpanel" class="tab-pane" id="sign-in">
                                    <form role="form" method="post" id="form-sign-in">
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="text" class="form-control" id="login-id" name="login-id" placeholder="ID">
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="password" class="form-control" id="login-pw" name="login-pw" placeholder="Password">
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <button type="button" class="btn btn-primary" id="login_btn">Sign In</button>
                                        </div>
                                        <!--end .form-group-->
                                    </form>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="register">
                                   <form role="form" method="post" id="form-register" class="register-pane">
                                        <div class="form-group animate move_from_bottom_short" id="idInput">
                                            <input type="text" class="form-control" id="register-id" name="register-id" placeholder="ID">
                                              <span id="id-check"></span>
                                        </div>
                                        <!--end .form-group-->
                                         <div class="form-group animate move_from_bottom_short">
                                            <input type="text" class="form-control" id="register-name" name="register-name" placeholder="Name">
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
                                            <select id="register_favorite" class="select">
                                               <option>선호장르</option>
                                               <option>발라드</option>
                                               <option>힙합</option>
                                               <option>인디</option>
                                            </select>
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <button type="button" class="btn btn-primary" id="register_btn">Register</button>
                                        </div>
                                        <!--end .form-group-->
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
                    <ul class="unlogin">
                        <li><a href="#user-area" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" data-tab="#sign-in" data-transition-parent="#header">Sign In</a></li>
                        <li><a href="#user-area" class="promoted" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" data-tab="#register" data-transition-parent="#header">Register</a></li>
                    </ul>
                    <ul class="login hidden">
                       <li class="message"><span class="loginId"></span>님 로그인 중.</li>
                       <%-- <s:if test='#session.isArtist=="N"'> --%>
                          
                    <%--    </s:if> --%>
                       <li id="logout_btn"><a href="#logout">Logout</a></li>
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
                                <li><a href="#">Something 1</a></li>
                                <li><a href="#">Something 2</a></li>
                                <li><a href="#">Something 3</a></li>
                                <li><a href="#">Something 4</a></li>
                            </ul>
                        </li>
                        <li><a href="about_e.action" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true">About Us</a></li>
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
        <!--end .search-->
        <div class="container">
            <div class="submit-container">
                <a href="#search-collapse" class="btn btn-default btn-sm show-filter" data-toggle="collapse" aria-expanded="false" aria-controls="search-collapse">Search Filter</a>
                <a href="toAddBusking.action" class="submit-button" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true"><i><img src="assets/img/plus.png" alt=""></i></a>
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

<script>
   var _latitude = 37.5564059;
   var _longitude = 126.9259563;
    var jsonPath = 'assets/json/items.json';
    
//     $.getJSON(jsonPath)
//      .done(function(json) {
//          createHomepageGoogleMap(_latitude,_longitude,json);
         
//          alert(json.data[0].latitude);
         
//      })
//      .fail(function( jqxhr, textStatus, error ) {
//          console.log(error);
//      });
   
   $.ajax({
      url : "toBuskingList"
      , method : "post"
      , dataType : "json"
      , success : function(resp){
         
         var list = resp.buskingArraylist;
         
         var jsonArray = new Array();
         
          $.each(list, function(index, item){
//          	alert(item);
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