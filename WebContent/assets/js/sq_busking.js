/**
 * 
 */
$(function(){
	//로그아웃
	$("ul#main_menu").on("click", "a#main_logout", function(){
		location.href = "logoutSQmember.action?fromWhere=busking";
	});
});