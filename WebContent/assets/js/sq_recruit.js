/**
 * 
 */
$(function(){
	alert("hello world");
	$('#recruit-reg-btn').click(function(){
		alert("hi");
		
	});
	
	
	//로그아웃
	$("ul#main_menu").on("click", "a#main_logout", function(){
		location.href = "logoutSQmember.action?fromWhere=seeking";
	});
})