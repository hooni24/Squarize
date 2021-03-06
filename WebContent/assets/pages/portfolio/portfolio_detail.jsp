<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--<link href="../../fonts/font-awesome.css" rel="stylesheet" type="text/css">-->
    <!--<link href='http://fonts.googleapis.com/css?family=Roboto:700,400,300' rel='stylesheet' type='text/css'>-->
    <!--<link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">-->
    <!--<link href="../../css/style.css" rel="stylesheet" type="text/css">-->

    <style>
        #map-simple { min-height: 240px; }
    </style>

    <title>534 Roosevelt Street</title>
</head>
<body class="external">

<div id="item-detail" class="content-container">
    <div class="row">
        <div class="col-md-8">
            <div class="inner">
                <div class="items-switch">
                    <a href="#" class=""><img src="assets/img/arrow-left.png"></a>
                    <a href="#" class=""><img src="assets/img/arrow-right.png"></a>
                </div>
                <article class="animate move_from_bottom_short">
                    <div class="gallery">
                        <div class="image">
                            <img src="assets/img/items/1_b.jpg" alt="">
                        </div>
                    </div>
                </article>
                <article class="animate move_from_bottom_short">
                    <h1>534 Roosevelt Street</h1>
                    <h2><i class="fa fa-map-marker"></i>San Francisco</h2>
                    <figure class="price average-color"><span>$25.000</span></figure>
                    <p>Curabitur odio nibh, luctus non pulvinar a, ultricies ac diam. Donec neque massa,
                        viverra interdum eros ut, imperdiet pellentesque mauris. Proin sit amet scelerisque risus.
                        Donec semper semper erat ut mollis. Curabitur suscipit, justo eu dignissim lacinia ante
                        sapien pharetra duin consectetur eros augue sed ex
                    </p>
                </article>
                <!--end Description-->
                <article class="sidebar">
                    <div class="person animate move_from_bottom_short">
                        <div class="inner average-color">
                            <figure class="person-image">
                                <img src="assets/img/person-01.jpg" alt="">
                            </figure>
                            <header>Catherine Brown</header>
                            <a href="tel:818-832-5258">818-832-5258</a>
                            <a href="mailto:catherine.brown@example.com">catherine.brown@example.com</a>
                            <hr>
                            <a href="#person-detail" class="link" data-toggle="collapse" aria-expanded="false" aria-controls="person-detail">Show Details</a>
                        </div>
                        <div class="collapse" id="person-detail">
                            <div class="details">
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vestibulum, sem ut sollicitudin consectetur, augue diam ornare massa
                                </p>
                                <h3>Contact Me</h3>
                                <form role="form" method="post" class="clearfix">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="person-name" name="person-name" placeholder="Name">
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control" id="person-email" name="person-email" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" rows="2" placeholder="Message"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-link dark pull-right">Send Message</button>
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
                            <dt>Bathrooms</dt>
                            <dd>1</dd>
                            <dt>Bedrooms</dt>
                            <dd>2</dd>
                            <dt>Area</dt>
                            <dd>165m<sup>2</sup></dd>
                            <dt>Garages</dt>
                            <dd>1</dd>
                        </dl>
                    </div>
                </article>
                <!--end Sidebar-->
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
                <!--end Features-->
                <article>
                    <h3>Map</h3>
                    <div id="map-simple"></div>
                </article>
                <!--end Map-->
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
                <article class="center" id="test">
                    <a href="#" class="btn btn-circle btn-default btn-lg"><i class="fa fa-plus"></i></a>
                </article>
                <!--end Add Review-->
            </div>
        </div>
        <!--end .col-md-8-->
    </div>
    <!--end .row-->
</div>
<!--end #item-detail-->

<script>
    var _latitude = 51.541599;
    var _longitude = -0.112588;
    var draggableMarker = false;
    var scrollwheel = true;
    var element = document.querySelector('body');

    if( hasClass(element, 'external') ){
        var head = document.getElementsByTagName('head')[0];
        var script = document.createElement('script');
        script.type = 'text/javascript';
        script.src = "../../js/external.js";
        head.appendChild(script);
    }
    else {
        simpleMap(_latitude, _longitude,draggableMarker, scrollwheel);
        rating();
        averageColor( $('.content-container') );
    }

    function hasClass(element, cls) {
        return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
    }

</script>


</body>
</html>