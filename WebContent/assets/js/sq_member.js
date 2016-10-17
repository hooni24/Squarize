/**
 * 
 */
$(function(){
	$.ajax({
		url:'loginCheck'
		,dataType:'String'
		,success:function(send){
			var loginId=send.loginId;	
			if(loginId!=""){
				$('.close').trigger('click');
				$('.unlogin').addClass('hidden');
				$('.login').removeClass('hidden');
				$('#loginId').html(loginId);
			}
			
		}
	});
	
	$('#register_btn').click(function(){
		var reg_id=$('#register-id').val();
		alert("hi1");
		var reg_name=$('#register-name').val();
		var reg_email=$('#register-email').val();
		var reg_password=$('#register-password').val();
		var reg_confirm_password=$('#register-confirm-password').val();
		var reg_favorite=$('#register_favorite > option:selected').val();
		alert("hi2");
		if(reg_id.length<4){
			alert("아이디는 4자이상 입력하여주세요");
			return false;
		}
		if(reg_name.length<2){
			alert("성+이름을 정확히 입력하여 주십시오");
			return false;
		}
		if(reg_email.length<6){
			alert("이메일은 도메인포함 정확히 입력해주세요");
			return false;
		}
		if(reg_password<8){
			alert("비밀번호는 8자리이상 입력하여주세요");
			return false;
		}
		if(reg_password!=reg_confirm_password){
			alert("비밀번호를 확인하여주십시오");
			return false;
		}
		if(reg_favorite=="선호장르"){
			alert("선호장르를 선택하여주십시오");
			return false;
		}
		alert("hi3");
		$.ajax({
			method:'post'
			,url:'registerSQmember'
			,data:{'sq_member.sq_member_id':reg_id,'sq_member.sq_member_pw':reg_password,'sq_member.sq_member_name':reg_name,'sq_member.sq_member_email':reg_email,'sq_member.sq_member_favorite':reg_favorite}
			,success:function(){
				alert("success");
			}
			,error:function(){
				alert("error");
			}
		});
	});
	
	
	$('#login_btn').click(function(){
		var login_id=$('#login-id').val();
		var login_pw=$('#login-pw').val();
		alert(login_id+" pw: "+login_pw);
		if(login_id.length<1||login_pw.length<1){
			alert("아이디와 패스워드를 정확히 입력해주십시오 ");
		}
		
		$.ajax({
			method:'get'
			,url:'loginSQmember'
			,data:{"sq_member_id":login_id,"sq_member_pw":login_pw}
			,dataType:'json'
			,success:function(send){
				var user=send.sq_member;
				var loginId=send.loginId;
				alert(user.sq_member_name+"님 환영합니다");
				$('#login-id').val("");
				$('#login-pw').val("");
				if(loginId!=""){
					$('.close').trigger('click');
					$('.unlogin').addClass('hidden');
					$('.login').removeClass('hidden');
					$('#loginId').html(loginId);
					alert("hi");
				}else{
					$('.login').addClass('hidden');
					$('.unlogin').removeClass('hidden');
					$('#loginId').html(loginId);
				}
			}
			,error:function(){
				alert("오류발생");
			}
			
		});
	});
	
	$('#logout_btn').click(function(){
		alert("hi");
		$.ajax({
			method:'get'
			,url:'logoutSQmember'
			,success:function(send){
				alert("logout")
				var loginId=send.loginId;
				
				if(loginId==null){
					$('.login').addClass('hidden');
					$('.unlogin').removeClass('hidden');
					
				}
			}
			,error:function(){
				alert("error")
			}
		});
	});

})
