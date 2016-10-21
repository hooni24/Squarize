/**
 * 
 */
$(function(){
	$('.form-group button').click(function(){
		$.ajax({
			method:'get'
			,url:'insertSQrecruit'
			,success:function(send){
				alert(send.loginId);
			}
		});
	});
})