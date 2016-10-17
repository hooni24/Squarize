<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>

<div id="submit-page">
    <div class="inner">
        <h1 id="temp">대관팀 모집</h1>
        <form action="insertRent" method="post">
            <article class="animate move_from_bottom_short">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group form-group-lg">
                            <input type="text" class="form-control" id="band_name" name="band_name" placeholder="밴드명">
                        </div>
                    </div>
                </div>
                <!--end .row-->
                <div class="form-group">
                    <textarea class="form-control" rows="8" id="info" placeholder="대관 관련 상세정보"></textarea>
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
                            <input type="date" class="form-control" id="input_date" name="input_date">
                        </div>   
                    </div>
                    <!--end .col-md-4-->
                    
                    <div class="col-md-4">
	                    <div class="form-group">
                            <select>
                            	<s:iterator begin="0" end="23" var="h">
                            		<option>${h }시</option>
                            	</s:iterator>
                            </select>
                        </div>
                    </div>
                    <!--end .col-md-4-->
                    <div class="col-md-4">
                        <div class="form-group">    
                            <select>
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
                            <input type="date" class="form-control" id="input_date" name="input_date">
                        </div>   
                    </div>
                    <!--end .col-md-4-->
                    <div class="col-md-4">
	                    <div class="form-group">
                            <select>
                            	<s:iterator begin="0" end="23" var="h">
                            		<option>${h }시</option>
                            	</s:iterator>
                            </select>
                        </div>
                    </div>
                    <!--end .col-md-4-->
                    <div class="col-md-4">
                        <div class="form-group">    
                            <select>
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
                	어떻게?
            </article>
            <!--end Features-->
            <article class="center">
                <div class="form-group">
                    <button type="submit" class="btn btn-circle btn-primary btn-xl"><i class="fa fa-check"></i></button>
                </div>
                <!--end .form-group-->
            </article>
            <!--end Submit Button-->
            <article class="center">
                <small>By clicking “submit” button you agree with <a href="#" class="link">Terms and Conditions</a></small>
            </article>
            <!--end terms-->
        </form>
    </div>
    <!--end .row-->
</div>
<!--end #item-detail-->

<script>
    $(document).ready(function($) {
        var _latitude = 51.541599;
        var _longitude = -0.112588;
        var draggableMarker = true;
        var scrollwheel = true;

        rating();

        averageColor( $('#item-detail') );

        //bootstrapSelect();

        $('input').iCheck();

        $('.submit-button').addClass('submit-page-open');

        setTimeout(function() {
            simpleMap(_latitude, _longitude,draggableMarker,scrollwheel);
        }, 1000);
    });
</script>

</body>
</html>