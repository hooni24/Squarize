<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
		textarea.taSetting[readonly]{
			resize: vertical;
			background-color: transparent;
			cursor: default;
		}
		a.aRed{
			text-decoration: none;
			color: red;
			background-color: white;
		}
		a.aBlack{
			text-decoration: none;
			color: black;
			background-color: white;
		}
	</style>
	
	<script>
		$(function(){
			$("a.aRed").on("click", function(){
				var selected = confirm("정말 삭제하시겠습니까?");
				if(selected){
					var rent_id = $("input#hidden").val();
					location.href="deleteRent.action?rent.sq_rent_id="+rent_id;
				}
			})
		});
	</script>
    <title></title>
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
                            <img src="assets/downloadIMG/rent/${rent.sq_rent_photo }" alt="">
                        </div>
                    </div>
                </article>
                <article class="animate move_from_bottom_short">
                    <h1>${rent.sq_rent_band_name }</h1>
                    <h2>${rent.sq_rent_input_date } 업로드</h2>
                    <figure class="price average-color"><span>${rent.sq_member_id }</span></figure><br>
                    <textarea class="form-control taSetting" rows="12" ReadOnly="readonly">${rent.sq_rent_info }</textarea>
                </article>
                <!--end Description-->
                <article class="sidebar">
                    <div class="person animate move_from_bottom_short">
                        <div class="inner average-color">
                            <figure class="person-image">
                                <img src="assets/img/person-01.jpg" alt="">
                            </figure>
                            <header>${rent.sq_member_id }</header>
                            <div>${member.sq_member_email }</div>
                            <hr>
                            <a href="#person-detail" class="link" data-toggle="collapse" aria-expanded="false" aria-controls="person-detail">Show Details</a>
                        </div>
                        <div class="collapse" id="person-detail">
                            <div class="details">
                                <p>
                                	올린사람 자기소개글
                                </p>
                            </div>
                            <!--end .details-->
                        </div>
                        <!--end .collapse-->
                    </div>
                    <!--end .person-->
                    <div class="block animate move_from_bottom_short">
                        <dl>
                            <dt>지역</dt>
                            <dd>서울</dd>
                            <dt>장르</dt>
                            <dd>락</dd>
                            <dt>총 공연시간</dt>
                            <dd>1시간</dd>
                            <dt>모집팀 수</dt>
                            <dd>3팀</dd>
                        </dl>
                    </div>
                </article>
                <!--end Sidebar-->
                <article>
                    <h3>댓글</h3>
                    <div class="review block">
                        <figure class="person-image">
                            <img src="assets/img/person-01.jpg" alt="">
                        </figure>
                        <header>누군가</header>
                        <div class="rating" data-rating="2"></div>
                        <p>안해도 되겠지??</p>
                    </div>
                </article>
                <!--end Reviews-->
                <article class="center" id="test">
<%--                     <s:if test="#session.loginId == rent.sq_member_id "> --%>
                    	<a class="btn btn-circle btn-lg btn_default aBlack">지원자 보기</a>&nbsp;&nbsp;&nbsp;
                    	<a class="btn btn-circle btn-lg aRed">삭제</a>
<%--                     </s:if> --%>
<%--                     <s:else> --%>
	                    <a href="#" class="btn btn-circle btn-default btn-lg">지원</a>
<%--                     </s:else> --%>
                    <input type="hidden" value="${rent.sq_rent_id }" id="hidden">
                </article>
                <!--end Add Review-->
            </div>
        </div>
        <!--end .col-md-8-->
    </div>
    <!--end .row-->
</div>
<!--end #item-detail-->
</body>
</html>