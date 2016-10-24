<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메일인증확인페이지</title>
<style>
	.box{
		margin:30% auto;
		border: 2px solid rgba(0,0,0,0.7);
		width:400px;
		height:200px;
	}
</style>
<script src="jquery-2.1.0.min.js"></script>
<script>
	alert("이메일인증 완료\n\n이메일인증이 완료 되었습니다\nSquarize로 이동합니다");
	location.replace("index.action");
</script>
</head>

<body>
	<%-- <section>
		<div class="box">
			<h3>메일인증확인 완료 </h3>
			<p>
			<div class="content">
				메일인증이 완료되었습니다.<br>메인페이지로 이동하셔서 로그인하시려면 아래 버튼을 눌러주세요
				<button id="go" value="로그인 페이지로"></button> 
			</div>
		</div>
		
	</section> --%>
</body>
</html>