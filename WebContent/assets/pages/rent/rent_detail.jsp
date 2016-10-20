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
		textarea.taSetting{
			resize: vertical;
			background-color: transparent;
			cursor: text;
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
		a#realUpdate{
			display: none;
		}
	</style>
	
	<script>
		$(function(){
			$("a#delete").on("click", function(){
				var selected = confirm("정말 삭제하시겠습니까?");
				if(selected){
					var rent_id = $("input#hidden").val();
					location.href="deleteRent.action?rent.sq_rent_id="+rent_id;
				}
			})
			
			$("a#update").on("click", function(){
				$("h1#band_name").html("<input type='text' id='band_name' name='rent.sq_rent_band_name' value='${rent.sq_rent_band_name }'>");
				$("h2#concert_date").html("공연 예정일 <input type='date' id='concert_date' name='rent.sq_rent_concert_date'>");
				$("h2#limit").html("지원 마감일 <input type='date' id='limit' name='rent.sq_rent_limit'>");
				$("textarea#ta").removeAttr("readonly");
				$("div#file").append("<input type='file' id='upload' name='upload' >");
				$(this).css("display", "none");
				$("a#seeApply").css("display", "none");
				$("a#delete").css("display", "none");
				$("a#realUpdate").css("display", "inline-block");
			});
			
			$("a#realUpdate").on("click", function(){
				$("#form")[0].submit();
			});
			
		});
	</script>
    <title></title>
</head>
<body class="external">

<div id="item-detail" class="content-container">
    <div class="row">
        <div class="col-md-8">
            <div class="inner">
                <article class="animate move_from_bottom_short">
                    <div class="gallery">
                        <div class="image">
                            <img src="assets/downloadIMG/rent/${rent.sq_rent_photo }" alt="">
                        </div>
                    </div>
                </article>
                
                <form id="form" action='updateRent.action' method="post" enctype="multipart/form-data">
	                <article class="animate move_from_bottom_short">
	                    <h1 id="band_name">${rent.sq_rent_band_name }</h1><br>
	                    <h2 id="concert_date">${rent.sq_rent_concert_date } 공연 예정</h2>
	                    <h2 id="limit">${rent.sq_rent_limit } 지원 마감</h2>
	                    <figure class="price average-color"><span>${rent.sq_member_id }</span></figure><br>
	                    <textarea class="form-control taSetting" id="ta" name="rent.sq_rent_info" rows="12" ReadOnly="readonly">${rent.sq_rent_info }</textarea>
	                    <div id="file"></div>
	                </article>
		                <input type="hidden" value="${rent.sq_rent_id }" id="hidden" name="rent.sq_rent_id">
                </form>
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
                            <dd>${rent.sq_rent_region }</dd>
                            <dt>장르</dt>
                            <dd>${rent.sq_rent_genre }</dd>
                            <dt>총 공연시간</dt>
                            <dd>${rent.sq_rent_running_time } 시간</dd>
                            <dt>모집팀 수</dt>
                            <dd>${rent.sq_rent_team_count } 팀</dd>
                        </dl>
                    </div>
                </article>
                <!--end Sidebar-->
                <article class="center" id="test">
                    <s:if test="#session.loginId == rent.sq_member_id ">
                    	<a class="btn btn-circle btn-lg btn_default aBlack" id="seeApply">지원자 보기</a>&nbsp;&nbsp;&nbsp;
                    	<a class="btn btn-circle btn-lg aBlack" id="update">수정</a>&nbsp;&nbsp;&nbsp;
                    	<a class="btn btn-circle btn-lg aBlack" id="realUpdate">수정aa</a>&nbsp;&nbsp;&nbsp;
                    	<a class="btn btn-circle btn-lg aRed" id="delete">삭제</a>
                    </s:if>
                    <s:else>
	                    <a href="#" class="btn btn-circle btn-default btn-lg">지원</a>
                    </s:else>
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