<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>
</head>
<body class="external">

<div id="faq" class="content-container">
    <div class="inner">
        <h1>FAQ</h1>
        <article class="faq block animate move_from_bottom_short">
            <figure class="icon animate scale_in"><i class="fa fa-comment"></i></figure>
            <h3>Etiam ut eros rhoncus, laoreet sapien sit amet</h3>
            <hr>
            <p>
                Nunc fringilla justo nunc, sed placerat ante volutpat a. Etiam posuere nunc tristique magna lacinia posuere.
                Maecenas sodales ac diam vitae tempus. Fusce rhoncus lectus metus, sed varius tortor semper eu.
                Etiam scelerisque et enim a luctus.
            </p>
        </article>
        <!--end .faq-->
        <article class="faq block animate move_from_bottom_short">
            <figure class="icon animate scale_in"><i class="fa fa-comment"></i></figure>
            <h3>Vestibulum malesuada cursus accumsan. Pellentesque commodo</h3>
            <hr>
            <p>
                Maecenas tincidunt ligula eget felis eleifend porta. Nam gravida justo id quam laoreet, cursus luctus sapien congue.
                Curabitur quis semper metus. Praesent rhoncus nisl turpis, vitae euismod orci malesuada non. Aliquam vel orci at
                odio sollicitudin tincidunt vitae ac risus. Donec aliquet nunc id faucibus vulputate. Sed ut urna lectus.
            </p>
        </article>
        <!--end .faq-->
        <article class="faq block animate move_from_bottom_short">
            <figure class="icon animate scale_in"><i class="fa fa-comment"></i></figure>
            <h3> Curabitur vel felis tempor, sollicitudin leo a, ultricies tortor</h3>
            <hr>
            <p>
                Quisque at turpis in risus venenatis consequat. Ut ut ultrices felis. Aenean mollis tellus ac nisl aliquam,
                eu auctor lectus bibendum.
            </p>
        </article>
        <!--end .faq-->
        <article class="faq block animate move_from_bottom_short">
            <figure class="icon animate scale_in"><i class="fa fa-comment"></i></figure>
            <h3>Etiam ut eros rhoncus, laoreet sapien sit amet</h3>
            <hr>
            <p>
                Nunc fringilla justo nunc, sed placerat ante volutpat a. Etiam posuere nunc tristique magna lacinia posuere.
                Maecenas sodales ac diam vitae tempus. Fusce rhoncus lectus metus, sed varius tortor semper eu.
                Etiam scelerisque et enim a luctus.
            </p>
        </article>
        <!--end .faq-->
    </div>
    <!--end .inner-->
</div>
<!--end #person-list-->

<script>
    var element = document.querySelector('body');

    if( hasClass(element, 'external') ){
        var head = document.getElementsByTagName('head')[0];
        var script = document.createElement('script');
        script.type = 'text/javascript';
        script.src = "../js/external.js";
        head.appendChild(script);
    }

    function hasClass(element, cls) {
        return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
    }
</script>

</body>
</html>