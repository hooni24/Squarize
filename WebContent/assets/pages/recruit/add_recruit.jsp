<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>

<div id="submit-page">
    <div class="inner">
        <h1 id="temp">구인정보등록</h1>
        <form role="form" method="post">
            <article class="animate move_from_bottom_short">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group form-group-lg">
                            <input type="text" class="form-control" id="title" name="title" placeholder="Title">
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="form-group">
                            	작성자   <s:property value='#session.loginId'/>
                        </div>
                    </div>
                    
                   	<div class="col-md-4">
                        <div class="form-group">
                            <input type="text" class="form-control" id="location" name="location" placeholder="위치">
                        </div>
                    </div>
                   	<div class="col-md-4">
                        <div class="form-group">
                            <input type="text" class="form-control" id="limitDate" name="limitDate" placeholder="모집마감일 : YYYY/MM/DD">
                        </div>
                    </div>
                </div>
                <!--end .row-->
                <div class="form-group">
                    <textarea class="form-control" rows="4" id="info" placeholder="소개"></textarea>
                    	사  진	<input type="file" id="recruit-pic"/>
                </div>
                <!--end textarea-->
            </article>
            <!--end Description-->
            
            <article class="animate move_from_bottom_short">
                <h3>파트/장르</h3>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                             <select name="part" multiple title="part" id="part">
                                <option>기타</option>
                                <option>드럼</option>
                                <option>키보드</option>
                                <option>보컬</option>
                            </select>
                        </div>
                        <!-- end .form-group -->
                    </div>
                    <!--end .col-md-4-->
                    <div class="col-md-4">
                        <div class="form-group">
                            <!-- end form-group -->
                        <div class="form-group">
                            <select name="장르" multiple title="genre" id="genre">
                                <option>락</option>
                                <option>발라드</option>
                                <option>재즈</option>
                                <option>힙합</option>
                            </select>
                        </div>
                        </div>
                        <!-- end .form-group -->
                    </div>
                    <!--end .col-md-4-->
                </div>
                </article>
                
           
            
            <article class="center">
                <div class="form-group">
                    <!-- <button type="submit" class="btn btn-circle btn-primary btn-xl" ><i class="fa fa-check" id="recruit-reg-btn"></i></button> -->
                    <button type="submit" class="btn btn-circle btn-primary btn-xl"  ><i class="fa fa-check" id="recruit-reg-btn"></i></button>
                </div>
                <!--end .form-group-->
            </article>
            <!--end Submit Button-->
            
        </form>
    </div>
    <!--end .row-->
</div>
<!--end #item-detail-->
<script src="../../js/sq_recruit.js"></script>
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