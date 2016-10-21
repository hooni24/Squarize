/**
 * 
 */
$(function(){
	var idError="f";
	
	$.ajax({
		url:'loginCheck'
		,dataType:'json'
		,success:function(send){
			reset(send);
		}/*function(send){
			var loginId=send.loginId;
			var isArtist=send.isArtist;
			alert(isArtist);
			if(loginId==null||loginId==""){
				alert("로그인안됨"+loginId);
				$('.login').addClass('hidden');
				$('.unlogin').removeClass('hidden');
				$('.loginId').html("");
			}else{
				alert("로그인됨"+loginId);
				$('.unlogin').addClass('hidden');
				$('.login').removeClass('hidden');
				$('.loginId').html(loginId);
				
				$('.nav-pills').addClass("hidden");
				
				if(isArtist=="N"){
					$('.nav-artist').removeClass("hidden");
					alert(isArtist);
				
					var code="<li><a href='#user-area' data-toggle='collapse'  id='sq_artist' aria-expanded='false' aria-controls='user-area' data-tab='#add-artist' data-transition-parent='#header'>추가인증</a></li>";
					$(code).appendTo('.message');
					alert("hi1");
					$('#add-artist').removeClass("hidden");
					alert("hi2");
				}else{
					$('#sq_artist').remove();
					$('.nav-pills').addClass("hidden");
					$('.nav-artist').removeClass("hidden");
				}
			}
			
			
		}*/
		,error:function(){
			alert("");
		}
	});
	$('.close').click(function(){
		$('#register-id').val("");
		$('#register-name').val("");
		$('#register-email').val("");
		$('#register-password').val("");
		$('#register-confirm-password').val("");
		$('#register_favorite option:eq("선호장르")').attr('selected','selected');
		$('#id-check').html(' ');
		$('#id-check').css('color','black');
		$('#register-id').css('color','black');
		$('#sign_in_btn').trigger('click');
		$('#login-id').val("");
		$('#login-pw').val("");
		
	});
	$('#register-id').on('focusout',function(){
		var checkId=$('#register-id').val();
		
		
		$.ajax({
			method:'post'
			,url:'idCheck'
			,data:{"sq_member_id":checkId}
			,success:function(send){
				if(checkId==""||checkId==null){
					$('#id-check').html(" ");
				}else if(send.sq_member!=null){
					alert('이미 사용중인 아이디입니다.');
					
					idError="t";
					if(idError=="t"){
						$('#id-check').css('color','red');
						$('#register-id').css('color','red');
					}
				}else if(send.sq_member==null){
				
					$('#id-check').html("사용가능한 아이디입니다.");
					idError="f";
					$('#id-check').css('color','blue');
					$('#register-id').css('color','blue');
						
				} 
				
			}
			,error : function(){
				alert("error");
				
			}
			
		});
	});
	
	$('#register_btn').click(function(){
		var reg_id=$('#register-id').val();
		var reg_name=$('#register-name').val();
		var reg_email=$('#register-email').val();
		var reg_password=$('#register-password').val();
		var reg_confirm_password=$('#register-confirm-password').val();
		var reg_favorite=$('#register_favorite > option:selected').val();
		
		if(reg_id.length<3){
			alert("아이디는 3자이상 입력하여주세요");
			return false;
		}
		if(idError=="t"){
			alert("사용중인 아이디입니다. 다시 확인해주십시오");
			return false;
		}
		if(reg_name.length<3){
			alert("성+이름을 정확히 입력하여 주십시오");
			return false;
		}
		if(reg_email.length<4){
			alert("이메일은 도메인포함 정확히 입력해주세요");
			return false;
		}
		if(reg_password<3){
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
		$.ajax({
			method:'post'
			,url:'registerSQmember'
			,data:{'sq_member.sq_member_id':reg_id,'sq_member.sq_member_pw':reg_password,'sq_member.sq_member_name':reg_name,'sq_member.sq_member_email':reg_email,'sq_member.sq_member_favorite':reg_favorite}
			,success:function(){
				
				alert("회원가입이 완료되었습니다. 로그인하여 주십시오");
				$('#register-id').val("");
				$('#register-name').val("");
				$('#register-email').val("");
				$('#register-password').val("");
				$('#register-confirm-password').val("");
				$('#register_favorite option:eq("선호장르")').attr('selected','selected');
				$('#id-check').html(' ');
				$('#id-check').css('color','black');
				$('#register-id').css('color','black');
				$('#sign_in_btn').trigger('click');
			}
			,error:function(){
				alert("회원가입실패");
			}
		});
	});

	
	$('#login_btn').click(function(){
		var login_id=$('#login-id').val();
		var login_pw=$('#login-pw').val();
	
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
				var isArtist=send.isArtist;
				$('#login-id').val("");
				$('#login-pw').val("");
				reset(send);
				if(loginId!=""){
					alert(user.sq_member_name+"님 환영합니다");
				}else{
					alert("사용자 정보를 확인해주세요")
					
				}
			}
			,error:function(){
				alert("오류발생");
			}
			
		});
	});
	
	$('#logout_btn').click(function(){
	
		$.ajax({
			method:'get'
			,url:'logoutSQmember'
			,success:function(send){
				alert("logout");
				reset(send);
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
	
	$('#sq_artist').on('click',function(){
		$('#tab-pane').addClass("hidden");
		$('#add-artist').removeClass("hidden");
		$('.nav-pills').addClass("hidden");
		$('#add-artist-tab').trigger('click');
		
	});
	
	function reset(send){
		var loginId=send.loginId;
		var isArtist=send.isArtist;
		if(loginId==null||loginId==""){
			alert("로그인안됨"+loginId);
			$('.login').addClass('hidden');
			$('.unlogin').removeClass('hidden');
			$('.loginId').html("");
			$('.nav-artist').addClass("hidden");
			$('.nav-pills').removeClass("hidden");
		}else{
			alert("로그인됨"+loginId);
			$('.unlogin').addClass('hidden');
			$('.login').removeClass('hidden');
			$('.loginId').html(loginId);
			$('.nav-pills').addClass("hidden");
			if(isArtist=="N"){
				$('.nav-artist').removeClass("hidden");
				var code="<li><a href='#user-area' data-toggle='collapse'  id='sq_artist' aria-expanded='false' aria-controls='user-area' data-tab='#add-artist' data-transition-parent='#header'>추가인증</a></li>";
				$(code).appendTo('.message');
				$('#add-artist').removeClass("hidden");
				$('#tab-pane').addClass("hidden");
			}else{
				$('#sq_artist').remove();
				$('.nav-pills').addClass("hidden");
				$('.nav-artist').removeClass("hidden");
			}
		}
	}
})


