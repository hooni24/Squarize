/**
 * 
 */
$(function(){
    		//로그인 ajax
    		$("button#sign-in-submit").on("click", function(){
    			var id = $("input#sign-in-id").val();
    			var pw = $("input#sign-in-pw").val();
    			var loginItem = {"sq_member_id" : id, "sq_member_pw": pw};
    			alert("hi!");
	    		$.ajax({
	    			url : "loginSQmember"
	    			, method : "post"
	    			, data : loginItem
	    			, dataType : "json"
	    			, success : function(){
	    				$(".close").trigger("click");
	    				$("#main_login").addClass("hidden");
	    				$("#main_register").addClass("hidden");
	    				
	    				var logout = '<li><a href="#" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" id="main_logout">logout</a></li>';
	    				var makeArtist = '<li><a href="#user-area" class="promoted" data-toggle="collapse" aria-expanded="false" aria-controls="user-area" data-tab="#makeArtist" data-transition-parent="#header" id="main_makeArtist">make artist</a></li>';
	    				
	    				$("ul#main_menu").append(logout);
	    				$("ul#main_menu").append(makeArtist);
	    				
	    				$("#tab_login").addClass("hidden");
	    				$("#tab_register").addClass("hidden");
	    				
	    				var tab_makeArtist = '<li role="presentation"><a href="#makeArtist" aria-controls="makeArtist" role="tab" data-toggle="tab"  data-transition-parent="#makeArtist" id="tab_makeArtist">Make Artist</a></li>';
	    				$("ul#tab_menu").append(tab_makeArtist);
	    				$("a#tab_makeArtist").trigger("click");
	    			}
	    			, error : function(){
	    				alert("실패");
	    			}
	    		});
    		});
    		
    		//로그아웃
    		$("ul#main_menu").on("click", "a#main_logout", function(){
    			location.href = "logoutSQmember.action?fromWhere=rent";
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
    					$('a#tab_login').trigger('click');
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
    		$('#makeArtist_submit').click(function(){
    			alert("hi");
    			var phone=$('#add-artist-phone').val();
    			var photo=$('#add-artist-photo').val();

    			$.ajax({
    				method:'post'
    				,url:'addSQArtist'
    				,data:{'sq_artist.sq_artist_phone':phone,'sq_artist.sq_artist_photo':photo}
    				,success:function(){
    					
    				}
    			});
    		});
    		
    		
    	});