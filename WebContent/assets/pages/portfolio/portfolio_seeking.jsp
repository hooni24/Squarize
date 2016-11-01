<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <style>
    	a{cursor: pointer;}
    	textarea#pr[readonly], textarea#career[readonly]{
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
		a#realUpdate{
			display: none;
		}
		select#inst{
			font : 1.3em 맑은 고딕;
			background-color: transparent;
			border: none;
			border-bottom: 1px solid gray;
			padding: 12px;
		}
    </style>
    <script>
    
    //무결성 체크
    function valid(inst, career, pr){
    	if(inst.length < 1 || inst.length > 8){
			alert("악기명은 1~8글자로 입력해주세요");
			return false;
		}else if(career.length < 1 || career.length > 1000){
			alert("약력은 1~1000글자로 입력해주세요");
			return false;
		}else if(pr.length < 1 || pr.length > 1000){
			alert("자기소개는 1~1000글자로 입력해주세요");
			return false;
		}
    	return true;
    }
    	$(function(){
    		//포트폴리오 등록 화면 전환
    		$("a#makePort").on("click", function(){
    			var appendThing =
                '<form id="forms" action="makePortfolio?fromWhere=seeking" method="post" enctype="multipart/form-data">'+
	                '<h1>다루는 악기</h1>'+
	                '<select id="inst" name="sq_portfolio.sq_port_inst"><option>기타</option><option>드럼</option><option>키보드</option><option>보컬</option></select><br><br>'+
	                '<h1>약력(1000자 이내)</h1>'+
	                '<textarea id="career" class="form-control" rows="8" name="sq_portfolio.sq_port_career"></textarea><br><br>'+
	                '<h1>자기소개(1000자 이내)</h1>'+
	                '<textarea id="pr" class="form-control" rows="8" name="sq_portfolio.sq_port_pr"></textarea><br><br>'+
	                '<h1>대표사진</h1>'+
	                '<input type="file" id="upload" name="upload"><br><br>'+
	                '<h1>첨부파일 (음원,동영상 등 20MB이하)</h1>'+
	                '<input type="file" id="upload" name="uploadMedia" ><br><br>'+
            	'</form>'+
            	'<article class="center">'+
	                '<div class="form-group">'+
	                    '<button type="button" class="btn btn-circle btn-primary btn-xl" id="submits"><i class="fa fa-check"></i></button>'+
	                '</div>'+
            '	</article>';
    			$("div#makePortForm").html(appendThing);
    		});
    		
    		//포트폴리오 무결성체크후 등록
    		$("div#makePortForm").on("click", "#submits", function(){
    			var inst = $("input#inst").val();
    			var career = $("textarea#career").val();
    			var pr = $("textarea#pr").val();
    			
    			if(valid(inst, career, pr))
	    			$("#forms")[0].submit();
    		});
    		
    		//포트폴리오 삭제
    		$("a#delete").on("click", function(){
				var selected = confirm("정말 삭제하시겠습니까?");
				if(selected){
					$.ajax({
						url : "deletePortfolio"
						, method : "post"
						, success : function(){
							$("a#close").trigger("click");
							alert("정상적으로 삭제되었습니다");
						}
						, error : function(){
							alert("실패");
						}
					});
				}
			});
    		
    		//포트폴리오 수정창 띄우기
    		$("a#update").on("click", function(){
    			alert(window.location.search);
    			$("#instH1").html("<input type='text' id='inst' name='sq_portfolio.sq_port_inst' value='"+inst+"'>");
    			$("textarea#career").attr("readonly", false);
    			$("textarea#pr").attr("readonly", false);
    			$("a#update").css("display", "none");
    			$("a#delete").css("display", "none");
    			$("a#realUpdate").css("display", "inline-block");
    			
    			
    			var updateFiles = '<h1>대표사진 수정</h1>'+
                '<input type="file" id="upload" name="upload"><br><br>'+
                '<h1>첨부파일 수정 (음원,동영상 등 20MB이하)</h1>'+
                '<input type="file" id="upload" name="uploadMedia" ><br><br>';
    			
    			$("article#test").before(updateFiles);
    		});
    		
    		//포트폴리오 수정 submit (파일 ㅇㅇ)
    		$("a#realUpdate").on("click", function(){
    			$("form#update_form")[0].submit();
    		});
    		
    		//포트폴리오 수정 ajax(파일 노노)
//     		$("a#realUpdate").on("click", function(){
//     			var inst = $("input#inst").val();
//     			var career = $("textarea#career").val();
//     			var pr = $("textarea#pr").val();
//     			if(valid(inst, career, pr)){
// 	    			var item = {
// 	    					"sq_portfolio.sq_port_inst" : inst
// 	    					, "sq_portfolio.sq_port_career" : career
// 	    					, "sq_portfolio.sq_port_pr" : pr
// 	    			};
// 	    			$.ajax({
// 	    				url : "updatePortfolio"
// 	    				, method : "post"
// 	    				, data : item
// 	    				, dataType : "json"
// 	    				, success : function(resp){
// 	    					$("#instH1").text("다루는 악기 - " + resp.sq_portfolio.sq_port_inst);
// 	    					$("textarea#career").attr("readonly", true);
// 	    	    			$("textarea#pr").attr("readonly", true);
// 	    	    			$("a#update").css("display", "inline-block");
// 	    	    			$("a#delete").css("display", "inline-block");
// 	    	    			$("a#realUpdate").css("display", "none");
// 	    				}
// 	    				, error : function(){
// 	    					alert("실패");
// 	    				}
// 	    			});
//     			}
//     		});
    	});
    </script>
</head>
<body class="external">

<s:if test="sq_portfolio == null">
	<div id="makePortForm" class="content-container">
		<h1>현재 등록된 포트폴리오가 없습니다.</h1>
		<h2><a id="makePort">클릭하여 포트폴리오를 등록해 주세요.</a></h2>
	</div>
</s:if>
<s:else>
<form id='update_form' action='updatePortfolioSubmit.action?fromWhere=rent' method='post' enctype='multipart/form-data'>
	<div id="about" class="content-container">
	    <div class="row">
	        <div class="col-md-12">
	            <div class="inner">
	                <h1>${sq_portfolio.sq_member_id }님의 포트폴리오</h1>
	                <article class="animate move_from_bottom_short">
	                    <div class="promotion-box">
	                        <div class="left">
	                            <div class="image">
	                            <s:if test='sq_portfolio.sq_port_file == ""'>
	                                <img src="assets/img/search-bg.jpg">
                                </s:if>
                                <s:else>
	                                <img src="assets/downloadIMG/port/${sq_portfolio.sq_port_file }">
                                </s:else>
	                            </div>
	                        </div>
	                    </div>
	                </article>
	                <article class="animate move_from_bottom_short">
	                    <div class="review block">
	                        <figure class="person-image">
	                        <s:if test='sq_artist.sq_artist_photo == ""'>
	                            <img src="assets/img/person-01.jpg">
							</s:if>
							<s:else>
	                            <img src="assets/downloadIMG/artist/${sq_artist.sq_artist_photo }">
                            </s:else>
	                        </figure>
	                        <h1 id="instH1">다루는 악기 - ${sq_portfolio.sq_port_inst }</h1>
	                    </div>
	                </article>
	                <article class="animate move_from_bottom_short">
	                    <div class="review block">
	                    	<h1>약력</h1>
	                    	<textarea id="career" class="form-control" rows="8" name="sq_portfolio.sq_port_career" readonly="readonly">${sq_portfolio.sq_port_career }</textarea>
	                    </div>
	                </article>
	                <article class="animate move_from_bottom_short">
	                    <div class="review block">
	                    	<h1>자기소개</h1>
	                    	<textarea id="pr" class="form-control" rows="8" name="sq_portfolio.sq_port_pr" readonly="readonly">${sq_portfolio.sq_port_pr }</textarea>
	                    </div>
	                </article>
	                	<s:if test='mediaExt=="mp3" || mediaExt=="MP3" || mediaExt=="ogg" || mediaExt=="OGG" || mediaExt=="wav" || mediaExt=="WAV"'>
	                    	<h1>첨부파일</h1>
	                    	<audio controls>
								<source src="assets/downloadIMG/port/${sq_portfolio.sq_port_media }" type="audio/mpeg">
							</audio>
						</s:if>
						<s:elseif test='mediaExt=="mov" || mediaExt=="MOV" || mediaExt=="wmv" || mediaExt=="WMV" || mediaExt=="mp4" || mediaExt=="MP4" || mediaExt=="AVI" || mediaExt=="avi" || mediaExt=="MPEG" || mediaExt=="mpeg"'>
							<h1>첨부파일</h1>
							<video width="600" height="300" controls>
								<source src="assets/downloadIMG/port/${sq_portfolio.sq_port_media }" type="video/mp4">
							</video>
						</s:elseif>
						<s:elseif test="mediaExt == ''">
							<h2>업로드한 파일이 없습니다.</h2>
						</s:elseif>
						<s:else>
							<h2>파일 형식이 잘못되었습니다. 다시 업로드해 주세요.</h2>
						</s:else>
	                <article class="center" id="test">
	                <s:if test="#session.loginId == sq_portfolio.sq_member_id ">
                    	<a class="btn btn-circle btn-lg aBlack" id="update">수정</a>&nbsp;&nbsp;&nbsp;
                    	<a class="btn btn-circle btn-lg aBlack" id="realUpdate">수정aa</a>&nbsp;&nbsp;&nbsp;
                    	<a class="btn btn-circle btn-lg aRed" id="delete">삭제</a>
                    </s:if>
                    
                    </article>
                    
                    <input type="hidden" id="hidden" value="${sq_portfolio.sq_port_id }">
                    <input type="hidden" id="hidden_inst" value="${sq_portfolio.sq_port_inst }">
	            </div>
	        </div>
	        <!--end .col-md-8-->
	    </div>
	    <!--end .row-->
	</div>
	<!--end #item-detail-->
</form>
</s:else>
<script>
    var element = document.querySelector('body');

    if( hasClass(element, 'external') ){
        var head = document.getElementsByTagName('head')[0];
        var script = document.createElement('script');
        script.type = 'text/javascript';
        script.src = "../js/external.js";
        head.appendChild(script);
    }
    else {
        averageColor( $('.content-container') );
    }

    function hasClass(element, cls) {
        return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
    }
</script>


</body>
</html>