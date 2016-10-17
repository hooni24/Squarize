<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SQUARIZE</title>
<link href="https://fonts.googleapis.com/css?family=Bangers|Orbitron" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./assets/css/layout.css">
	<style>
		*{margin:0; padding:0;}
		a, a span{
		}
		span.busking_text, span.seeking_text{
			font: bold 4em 맑은 고딕;
			display: inline-block;
			position: absolute;
			z-index: 10;
			color: black;
		}
		span.busking_text{
			left: 18%;
			top: 50%;
			cursor: pointer;
		}
		span.seeking_text{
			right: 18%;
			top: 50%;
			cursor: pointer;
		}
		img.busking{
			display: inline-block;
			width: 50%;
			margin-right: -3px;
			filter: blur(8px);
			transition-duration: 0.8s;
			border-radius: 50px 0 0 50px;
		}
		img.seeking{
			display: inline-block;
			width: 50%;
			margin-left: -3px;
			filter: blur(8px);
			transition-duration: 0.8s;
			border-radius: 0 50px 50px 0;
		}
		p.title{
			font: bold 5em Bangers;
			text-align: center;
			margin: 50px 0;

		}
		
		
	</style>
	
	<script src="assets/js/jquery-2.1.0.min.js"></script>
	<script>
		$(function(){
			$("img.seeking").on("mouseenter", function(){
				$(this).css("filter", "none");
			});
			$("img.seeking").on("mouseleave", function(){
				$(this).css("filter", "blur(8px)");
			});
			$("img.busking").on("mouseenter", function(){
				$(this).css("filter", "none");
			});
			$("img.busking").on("mouseleave", function(){
				$(this).css("filter", "blur(8px)");
			});
		});
	</script>
</head>
<body>
<<<<<<< HEAD
	<p class="title">S Q U A R I Z E</p>
=======
	<header>
		<p class="title">[ SQUARIZE ]</p>
		<div class="login_btn"></div>
	</header>
>>>>>>> origin/dev
	
	<a href="toBuskingMain.action">
		<span class="busking_text">BUSKING</span>
		<img src="assets/img/main/busking.jpg" class="busking">
	</a>
	
	<a href="toSeekingMain.action">
		<span class="seeking_text">SEEKING</span>
		<img src="assets/img/main/seeking.jpg" class="seeking">
	</a>
	
</body>
</html>