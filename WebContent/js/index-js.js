/**
 * 
 */

$(function(){
	//로그인 ajax
	$("button#sign-in-submit").on("click", function(){
		var id = $("input#sign-in-id").val();
		var pw = $("input#sign-in-pw").val();
		var loginItem = {"sq_member_id" : id, "sq_member_pw": pw};
		$.ajax({
			url : "loginSQmember"
			, method : "post"
			, data : loginItem
			, dataType : "json"
			, success : function(resp){
				var condition = resp.condition;
				if(condition == 'login'){
					location.href = "index.action";
				}else if(condition == 'email'){
					alert("이메일 인증 확인 후 로그인해 주세요");
					return false;
				}else if(condition == 'password'){
					alert("비밀번호를 확인해 주세요");
					$('input#sign-in-pw').focus();
					$('input#sign-in-pw').val("");
					return false;
				}else if(condition == 'id'){
					alert("존재하지 않는 아이디 입니다.");
					$('input#sign-in-id').focus();
					$('input#sign-in-pw').val("");
					return false;
				}
			}
			, error : function(){
				alert("실패");
			}
		});
	});
	
	//회원가입
	$("button#register_btn").on("click", function(){
		var id=$('#register-id');
		var name=$('#register-name');
		var favorite=$('#register_favorite');
		var email=$('#register-email');
		var pw=$('#register-password');
		var pwConfirm=$('#register-confirm-password');
		
		if(id.val().length<4 || id.val().length>8){
			alert("아이디는 4~8자로 입력해주세요");
			id.focus();
			return false;
		}
		if(idError=="t"){
			alert("사용중인 아이디입니다. 다시 확인해주십시오");
			id.focus();
			return false;
		}
		if(name.val().length<2 || name.val().length>5){
			alert("이름은 2~4자로 입력해주세요");
			name.focus();
			return false;
		}
		if(email.val().length<4 || email.val().length>20){
			alert("이메일은 도메인포함 정확히 입력해주세요");
			email.focus();
			return false;
		}
		if(pw.val().length<4 || pw.val().length>8){
			alert("비밀번호는 4~8자로 입력하여주세요");
			pw.focus();
			return false;
		}
		if(pw.val() != pwConfirm.val()){
			alert("비밀번호를 확인하여주십시오");
			pw.focus();
			return false;
		}
		if(favorite.val()=="선호장르"){
			alert("선호장르를 선택하여주십시오");
			return false;
		}
		
		var registerItem = {
				'sq_member.sq_member_id' : id.val()
				,'sq_member.sq_member_pw' : pw.val()
				,'sq_member.sq_member_name' : name.val()
				,'sq_member.sq_member_email' : email.val()
				,'sq_member.sq_member_favorite' : favorite.val()
				};
		
		$.ajax({
			method : 'post'
			,url : 'registerSQmember'
			,data : registerItem
			,success : function(){
				alert("회원인증 메일이 발송되었습니다. 메일인증 완료 후 로그인해주세요");
				$('#register-id').val("");
				$('#register-name').val("");
				$('#register-email').val("");
				$('#register-password').val("");
				$('#register-confirm-password').val("");
				$('#register_favorite option:eq("선호장르")').attr('selected','selected');
				$('#id-check').html(' ');
				$('#id-check').css('color','black');
				$('#register-id').css('color','black');
				$('a#tab_login').trigger('click');
			}
			,beforeSend : function(){
		        $('.loadingpage').removeClass('loading');
		    }
		    ,complete : function(){
		        $('.loadingpage').addClass('loading');
		    }
			,error:function(){
				alert("회원가입실패");
			}
		});
	});
	
	//아이디 실시간 체크
	$('#register-id').on('focusout',function(){
		var checkId=$('#register-id').val();
		
		if(checkId.length>3 && checkId.length<9){
			$.ajax({
				method:'post'
				,url:'idCheck'
				,data:{"sq_member_id":checkId}
				,success:function(send){
					if(checkId==""||checkId==null){
						$('#id-check').html(" ");
					}else if(send.sq_member!=null){
						idError="t";
						if(idError=="t"){
							$('#id-check').html("사용중인 아이디입니다.");
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
		}else {
			$('#id-check').html("아이디는 4~8자로 입력해주세요.");
			$('#id-check').css('color','red');
			$('#register-id').css('color','red');
		}
	});
	
	//아티스트 인증
	$("button#makeArtist_submit").on("click", function(){
		var phone = $("input#add-artist-phone").val();
		var intro = $("textarea#add-artist-intro").val();
		var file = $("input#add-artist-photo").val();
		var fileLength = file.length;
		var ext = file.substring(fileLength-3, fileLength);	//확장자
		
		if(phone.length < 1){
			alert("전화번호는 반드시 입력해 주세요");
			return false;
		}else if(fileLength < 1){
			alert("사진을 반드시 업로드해주세요");
			return false;
		}else if(!(ext == "png" || ext == "PNG" || ext == "jpg" || ext == "JPG")){
			alert("사진은 png나 jpg 파일만 업로드 가능합니다");
			return false;
		}else if(intro.length < 1){
			alert("자기소개를 반드시 입력해 주세요");
			return false;
		}else {
			$("form#form-makeArtist")[0].submit();
		}
	});
	
});