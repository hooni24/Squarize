<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <title>SQUARIZE - SEEKING</title>

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
                            <ul class="nav nav-pills" role="tablist">
                                <li role="presentation"><a href="#sign-in" aria-controls="sign-in" role="tab" data-toggle="tab" data-transition-parent="#sign-in">Sign In</a></li>
                                <li role="presentation"><a href="#register" aria-controls="register" role="tab" data-toggle="tab"  data-transition-parent="#register">Register</a></li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane" id="sign-in">
                                    <form role="form" method="post" id="form-sign-in">
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="text" class="form-control" id="sing-in-name" name="name" placeholder="Name">
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="email" class="form-control" id="sing-in-email" name="email" placeholder="Email">
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <button type="submit" class="btn btn-primary">Sign In</button>
                                        </div>
                                        <!--end .form-group-->
                                    </form>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="register">
                                    <form role="form" method="post" id="form-register">
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="text" class="form-control" id="name" name="name" placeholder="Name">
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <input type="password" class="form-control" id="confirm-password" name="confirm-password" placeholder="Confirm Password">
                                        </div>
                                        <!--end .form-group-->
                                        <div class="form-group animate move_from_bottom_short">
                                            <button type="submit" class="btn btn-primary">Register</button>
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
                    <ul>
                        <li><a href="#user-area" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" data-tab="#sign-in" data-transition-parent="#header">Sign In</a></li>
                        <li><a href="#user-area" class="promoted" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" data-tab="#register" data-transition-parent="#header">Register</a></li>
                    </ul>
                </nav>
                <!--end Secondary navigation-->
                <nav class="main">
                    <div class="brand">
                        <a href="index.action">
                            <img src="assets/img/logo.png" alt="brand">	<!-- Squarize 로고 박을 자리 -->
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
        <div class="container">
            <div class="submit-container">
                <a href="#search-collapse" class="btn btn-default btn-sm show-filter" data-toggle="collapse" aria-expanded="false" aria-controls="search-collapse">Search Filter</a>
                <a href="submit_e.action" class="submit-button" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true"><i><img src="assets/img/plus.png" alt=""></i></a>
            </div>
        </div>
    </header>
    <!--end Header-->
<!-- 여기서 부터 content -->
    <div class="page-content">
        <div class="search collapse in" id="search-collapse">
            <div class="container">
                <form class="main-search" role="form" method="post" action="#">
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label for="type">검색 키워드</label>
                                <select name="type" multiple title="전체" id="type" class="animate" data-transition-parent=".dropdown-menu">
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
                	<!-- 
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
                                        </div>/input-group
                                    </div>
                                    /.form-group
                                </div>
                                /.col-md-3
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
                                        </div>/input-group
                                    </div>
                                    /.form-group
                                </div>
                                /.col-md-3
                            </div>
                        </div>
                      -->   
                <!-- 필요없는 요소 주석 끝 -->
                        
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label for="location">위치</label>
                                <div class="input-group location">
                                    <input type="text" class="form-control" id="location" placeholder="지역명 입력">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default animate" type="button"><i class="fa fa-map-marker geolocation" data-toggle="tooltip" data-placement="bottom" title="내 위치 선택"></i></button>
                                    </span>
                                </div>
                            </div>
                            <!-- /.form-group -->
                        </div>
                        
                 <!-- 반경설정 코드 추가 필요(price 부분 반경으로 변경하기 -->      
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label>반경설정</label>
                                <div class="ui-slider" id="price-slider" data-value-min="400" data-value-max="5000" data-value-type="price" data-currency="$" data-currency-placement="before">
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
                        <a href="#" class="close" id="close"><img src="assets/img/close.png" alt=""></a>
                        <!--external content goes here-->
                    </div>
                </div>
                <!--end Content Loader-->
            </div>
        </div>

<!-- 구인정보 및 대관정보 썸네일 나열부분 시작 -->

        <div class="masonry grid full-width animate">
        <div class="item move_from_bottom idle">
            <a href="assets/pages/items/1_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                <div class="inner">
                    <div class="image">
                        <div class="price average-color"><span>$25.000</span></div>
                        <img src="assets/img/items/1.jpg" alt="">
                    </div>
                    <div class="item-content">
                        <header class="average-color">
                            <h2>2151 Mulberry Avenue</h2>
                            <h3>63 Birch Street</h3>
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

        <div class="item move_from_bottom idle">
            <a href="assets/pages/items/2_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                <div class="inner">
                    <div class="image">
                        <div class="price average-color"><span>$49.000</span></div>
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

        </div>

<!-- 나열부분 끝 -->
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