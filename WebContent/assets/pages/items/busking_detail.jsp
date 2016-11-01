<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--     <link href="../../fonts/font-awesome.css" rel="stylesheet" type="text/css"> -->
<!--     <link href='http://fonts.googleapis.com/css?family=Roboto:700,400,300' rel='stylesheet' type='text/css'> -->
<!--     <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"> -->
<!--     <link href="../../css/style.css" rel="stylesheet" type="text/css"> -->
	
 	<!-- 여기 -->
	<script type="text/javascript" src="../../js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="../../Thumb/jquery.nailthumb.1.1.min.js"></script>
    <link rel="stylesheet" href="../../Thumb/jquery.nailthumb.1.1.min.css" type="text/css">
	
	<style type="text/css">
	.my-thumb-1 {
		width: 40px;
		height: 20px;
	}
	</style> 
	<script type="text/javascript">
/*       $(function() {
        $( '.my-thumb-1' ).nailthumb();
      }); */
  	var str = "<s:property value='#request.SQ_busking.buskingdate'/>";
	var temp = str.substring(0,13) + "시";
      
      	$(function(){
			$("#buskingdate").append(temp);
			
			$(".img").click(function(){
// 				var img = document.getElementById("");
// 				alert(img.src);
				var src = $(this).attr("src");
				
				$(".image img").attr("src", src);		
			});
      	});
      
	    </script>
    
     <style type="text/css">
     .img{
     	margin: 5px;
     	/* width: 10px;
     	height: 30px;
     	float: left;
     	display: inline; */
    } 
    </style> 
	
    <title>534 Roosevelt Street</title>
</head>
<body class="external">

<div id="item-detail" class="content-container">
    <div class="row">
        <div class="col-md-8">
            <div class="inner">
                <div class="items-switch">
<!--                     <a href="#" class=""><img src="assets/img/arrow-left.png"></a> -->
<!--                     <a href="#" class=""><img src="assets/img/arrow-right.png"></a> -->
                </div>
                <article class="animate move_from_bottom_short">
                    <div class="gallery">
                        <div class="image">
<%--                            	<img src="<s:property value="SQ_busking.gallery"/>" alt=""> --%>
                           	
                          	<s:if test="SQ_busking.gallery != ''">
							<a href="javascript:imageChange()" class="picture"><img class="img" src="assets/downloadIMG/busking/<s:property value="SQ_busking.gallery"/>"></a>
                        	</s:if>
							<s:if test="SQ_busking.gallery == ''">
							<a href="javascript:imageChange()" class="picture"><img class="img" src="assets/img/default-item.png"></a>
                        	</s:if>
                        </div>
                    </div>
                </article>
                <article class="animate move_from_bottom_short">
                    <h1><s:property value="SQ_busking.teamname"/></h1>
<!--                     <h2><i class="fa fa-map-marker"></i>San Francisco</h2> -->
<%--                     <figure class="price average-color"><span>$25.000</span></figure> --%>
					<h3>Description</h3>	
                    <p><s:property value="SQ_busking.description"/></p>
                </article>
                <!--end Description-->
                <article class="sidebar">
                    <div class="person animate move_from_bottom_short">
                        <div class="inner average-color">
<!--                             <figure class="person-image"> -->
<%--                                 <img src="assets/downloadIMG/busking/<s:property value="SQ_busking.gallery"/>" alt=""> --%>
<!--                             </figure> -->
<!--                             <header>Catherine Brown</header> -->
<!--                             <a href="tel:818-832-5258">818-832-5258</a> -->
<!--                             <a href="mailto:catherine.brown@example.com">catherine.brown@example.com</a> -->
<!--                             <hr> -->
<!--                             <a href="#person-detail" class="link" data-toggle="collapse" aria-expanded="false" aria-controls="person-detail">Show Details</a> -->
							<div>
								<s:if test="SQ_busking.gallery != ''">
								<a href="javascript:imageChange()" class="picture"><img class="img" src="assets/downloadIMG/busking/<s:property value="SQ_busking.gallery"/>"></a>
	                        	</s:if>
								<s:if test="SQ_busking.gallery == ''">
								<a href="javascript:imageChange()" class="picture"><img class="img" src="assets/img/default-item.png"></a>
	                        	</s:if>
	                        	
								<s:if test="SQ_busking.gallery2 != ''">
								<a href="javascript:imageChange()" class="picture"><img class="img" src="<s:property value="SQ_busking.gallery2"/>"></a>
	                        	</s:if>
								<s:if test="SQ_busking.gallery3 != ''">
								<a href="javascript:imageChange()" class="picture"><img class="img" src="<s:property value="SQ_busking.gallery3"/>"></a>
	                        	</s:if>
								<s:if test="SQ_busking.gallery4 != ''">
								<a href="javascript:imageChange()" class="picture"><img class="img" src="<s:property value="SQ_busking.gallery4"/>"></a>
	                        	</s:if>
								<s:if test="SQ_busking.gallery5 != ''">
								<a href="javascript:imageChange()" class="picture"><img class="img" src="<s:property value="SQ_busking.gallery5"/>"></a>
	                        	</s:if>
                        	</div>
                        </div>
<!--                         <div class="collapse" id="person-detail"> -->
<!--                             <div class="details"> -->
<!--                                 <p> -->
<!--                                     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vestibulum, sem ut sollicitudin consectetur, augue diam ornare massa -->
<!--                                 </p> -->
<!--                                 <h3>Contact Me</h3> -->
<!--                                 <form role="form" method="post" class="clearfix"> -->
<!--                                     <div class="form-group"> -->
<!--                                         <input type="text" class="form-control" id="person-name" name="person-name" placeholder="Name"> -->
<!--                                     </div> -->
<!--                                     <div class="form-group"> -->
<!--                                         <input type="email" class="form-control" id="person-email" name="person-email" placeholder="Email"> -->
<!--                                     </div> -->
<!--                                     <div class="form-group"> -->
<!--                                         <textarea class="form-control" rows="2" placeholder="Message"></textarea> -->
<!--                                     </div> -->
<!--                                     <div class="form-group"> -->
<!--                                         <button type="submit" class="btn btn-link dark pull-right">Send Message</button> -->
<!--                                     </div> -->
<!--                                 </form> -->

<!--                             </div> -->
<!--                             end .details -->
<!--                         </div> -->
<!--                         end .collapse -->
                    </div>
                    <!--end .person-->
                    <div class="block animate move_from_bottom_short">
	                    	<h3>Information</h3>
                        <dl>
                            <dt>장소</dt>
                            <dd><s:property value="SQ_busking.location"/></dd>
                            <dt>장르</dt>
                            <dd><s:property value="SQ_busking.genre"/></dd>
                            <dt>일시</dt>
                            <dd id="buskingdate"></dd>
                            <dt>공연시간</dt>
                            <dd><s:property value="SQ_busking.runningtime"/>분</dd>
                        </dl>
                    </div>
                </article>
                <!--end Sidebar-->
            </div>
        </div>
        <!--end .col-md-8-->
    </div>
    <!--end .row-->
</div>
<!--end #item-detail-->
</body>
</html>