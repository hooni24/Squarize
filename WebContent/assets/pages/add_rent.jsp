<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>

<script>
	$(function(){
		$("button#submits").on("click", function(){
			var valid = validCheck();
			if(valid){
				var band_name = $("input#band_name").val();
				var info = $("textarea#info").val();
				var concert_date = $("input#concert_date").val();
				var concert_date_hour = $("select#concert_date_hour").val().split("시")[0];
				var concert_date_min = $("select#concert_date_min").val().split("분")[0];
				var limit = $("input#limit").val();
				var limit_hour = $("select#limit_hour").val().split("시")[0];
				var limit_min = $("select#limit_min").val().split("분")[0];
				var photo = $("#upload").val();
				
				var real_concert_date = concert_date + " " + concert_date_hour + ":" + concert_date_min;
				var real_limit = limit + " " + limit_hour + ":" + limit_min;
				
				
				$("input#real_concert_date").val(real_concert_date);
				$("input#real_limit").val(real_limit);
				
				$("#forms")[0].submit();
			}
		});
		
		function validCheck(){
			var band_name = $("input#band_name");
			var info = $("textarea#info");
			var concert_date = $("input#concert_date");
			var limit = $("input#limit");
			
			if(band_name.val().length < 1){
				alert("밴드명을 입력하세요");
				return false;
			}else if(info.val().length < 1){
				alert("대관 관련 정보를 입력하세요");
				return false;
			}else if(concert_date.val().length < 1){
				alert("공연 예정일을 입력하세요");
				return false;
			}else if(limit.val().length < 1){
				alert("모집 마감일을 입력하세요");
				return false;
			}else if(concert_date.val() <= limit.val()){
				alert("모집 마감일은 공연예정일보다 최소 하루 이전이어야 합니다.")
				return false;
			}
			return true;
		}
	});
</script>
</head>
<body>

<div id="submit-page">
    <div class="inner">
        <h1 id="temp">대관팀 모집</h1>
        <form id="forms" action="insertRent" method="post" enctype="multipart/form-data" >
            <article class="animate move_from_bottom_short">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group form-group-lg">
                            <input type="text" class="form-control" id="band_name" name="rent.sq_rent_band_name" placeholder="밴드명">
                        </div>
                    </div>
                </div>
                <!--end .row-->
                <div class="form-group">
                    <textarea class="form-control" rows="8" id="info" placeholder="대관 관련 상세정보" name="rent.sq_rent_info"></textarea>
                </div>
                <!--end textarea-->
            </article>
            <!--end Description-->
            <article class="animate move_from_bottom_short">
                <h3>세부 정보</h3>
                <div class="row">
                    <h4>공연예정일(여기 datepicker사용할수 없나? 또는 오늘 이후로만 선택할수 있게 하거나)</h4>
                    <div class="col-md-4">
                        <div class="form-group">
                            <input type="date" class="form-control" id="concert_date">
                        </div>   
                    </div>
                    <!--end .col-md-4-->
                    
                    <div class="col-md-4">
	                    <div class="form-group">
                            <select id="concert_date_hour">
                            	<s:iterator begin="0" end="23" var="h">
                            		<option>${h }시</option>
                            	</s:iterator>
                            </select>
                        </div>
                    </div>
                    <!--end .col-md-4-->
                    <div class="col-md-4">
                        <div class="form-group">    
                            <select id="concert_date_min">
                            	<s:iterator begin="0" end="60" var="m" step="10">
                            		<option>${m }분</option>
                            	</s:iterator>
                            </select>
                        </div>
                    </div>
                    <!--end .col-md-4-->
                </div>
                <!--end .row-->
                
                <div class="row">
               		<h4>모집마감일</h4>
                    <div class="col-md-4">
                        <div class="form-group">
                            <input type="date" class="form-control" id="limit">
                        </div>   
                    </div>
                    <!--end .col-md-4-->
                    <div class="col-md-4">
	                    <div class="form-group">
                            <select id="limit_hour">
                            	<s:iterator begin="0" end="23" var="h">
                            		<option>${h }시</option>
                            	</s:iterator>
                            </select>
                        </div>
                    </div>
                    <!--end .col-md-4-->
                    <div class="col-md-4">
                        <div class="form-group">    
                            <select id="limit_min">
                            	<s:iterator begin="0" end="60" var="m" step="10">
                            		<option>${m }분</option>
                            	</s:iterator>
                            </select>
                        </div>
                    </div>
                    <!--end .col-md-4-->
                </div>
                <!--end .row-->
            </article>
            <!--end Overview-->
            
            <article>
                <h3>사진 업로드</h3>
                <input type="file" id="upload" name="upload" >
            </article>
            <!--end Features-->
            <article class="center">
                <div class="form-group">
                    <button type="button" class="btn btn-circle btn-primary btn-xl" id="submits"><i class="fa fa-check"></i></button>
                </div>
                <!--end .form-group-->
            </article>
            <!--end Submit Button-->
            <article class="center">
                <small>By clicking “submit” button you agree with <a href="#" class="link">Terms and Conditions</a></small>
            </article>
            <!--end terms-->
            <input type="hidden" id="real_concert_date" name="rent.sq_rent_concert_date" />
            <input type="hidden" id="real_limit" name="rent.sq_rent_limit" />
        </form>
    </div>
    <!--end .row-->
</div>
<!--end #item-detail-->

</body>
</html>