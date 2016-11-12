/**
 * 
 */
	$(function(){
		// Try HTML5 geolocation.
/*		alert("hi");
*/		var marker;		//submit할때 마커좌표 얻기위해 전역변수로 설정
		if (navigator.geolocation) {	//gps사용 가능 브라우져이면
			
	  		navigator.geolocation.getCurrentPosition(function(position) {	//현재 위치 좌표 얻어와서 함수실행
		    	var pos = {
				      		lat: position.coords.latitude,				//현재좌표값 json생성
				      		lng: position.coords.longitude
			    		};
				var myOptions = {
						    		zoom: 15,							//지도옵션 json생성
							    	center: pos,
							    	mapTypeId: google.maps.MapTypeId.ROADMAP
								};
				var map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);		//div#map-canvas에 지도 붙임 
		
				var infoWindow = new google.maps.InfoWindow({map: map});		//지도에 메세지창 생성
			    infoWindow.setPosition(pos);									//현재 위치로 메세지창 이동
			    infoWindow.setContent('드래그해서 정확한 위치로 이동하세요');								//메세지창 메세지 입력
			    
			    var image = {
					            url : "assets/img/marker.png", //마커이미지 
					            size : new google.maps.Size(67, 57), //마커사이즈
					            origin : new google.maps.Point(0, 0),
					            anchor : new google.maps.Point(43, 77)
					        }; //마커로 사용할 이미지 정의
			    
			    marker = new google.maps.Marker({
												    	position: pos,			//현재위치에 드래그가능한 마커 생성
											     		map: map,
											     		draggable: true,
											     		icon: image
											 		}); 
			    map.setCenter(pos);											//지도 현재위치로 center설정
		  	}, function() {
		  		alert("위치정보 사용에 동의하지 않으면 등록할 수 없습니다.");
// 		  		location.href = "toRentMain.action";
		    	handleLocationError(true, infoWindow, map.getCenter());
		  	});
		} else {
		  	// Browser doesn't support Geolocation
		  	alert("위치정보 사용이 불가능한 브라우저입니다.\nGoogle Chrome을 이용하세요.");
	  		handleLocationError(false, infoWindow, map.getCenter());
		}//if(navigator~)
		
		$("button#submits").on("click", function(){
			var lat = marker.position.lat();		//위도경도 얻어옴
			var lng = marker.position.lng();
			$("input#lat_").val(lat);				//hidden에 넣음
			$("input#lng_").val(lng);
			
			$.ajax({		//마커 부분 시, 동 으로 region에 저장 
				url: 'https://maps.googleapis.com/maps/api/geocode/json?latlng='+lat+','+lng+'&key=AIzaSyAcZEsXq59r_WkhHw_uyjJsbE_zJvOspz8'
				, method : "post"
				, dataType: "json"
				, success : function(resp){//resp:
					var region = resp.results[0].address_components[3].long_name+" "+resp.results[0].address_components[2].long_name;
					$("input#region_").val(region);
				
					var valid = validCheck();
					if(valid){
						/*alert("hi");*/
						
		 				$("#form").submit();
						/*alert("성공");*/
					}//if(valid)
				}//success펑션
			});//ajax
		});	//submit클릭 on
		
		
		
		$('#update-btn').click(function(){
			alert("hi")
			var title_value=$('#title1').text();
			var limit_date=$('#limitDate').text();
			var info=$('#content').val();
			/*alert(info);*/
			$('#title1').html("<input type='text' name='sq_recruit.sq_recruit_title' id='title' value='"+title_value+"'/>");
			$('dd#part_tag').html("<select name='sq_recruit.sq_recruit_part' multiple title='part' id='part'><option>드럼</option><option>키보드</option><option>보컬</option><option>기타</option></select>");                                
			$('dd#genre_tag').html('<select name="sq_recruit.sq_recruit_genre" multiple title="genre" id="genre"><option>락</option><option>발라드</option><option>재즈</option><option>힙합</option></select>');
            $('dd#limitDate').html('<input type="text" class="form-control" id="limitDate" name="sq_recruit.sq_recruit_date" value="'+limit_date+'">');                    
            $('textarea#content').removeAttr('readonly'); 
            $("div#file").append("<input type='file' id='upload' name='upload' >");
            $('.center a').css('display','none');
            $('.center').html('<a href="#" class="btn btn-circle btn-default btn-lg detail-btn submit-button" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true" id="update">확인</a>');
            /*marker.setDraggable(true);*/
		});
		$('.center').on('click','#update',function(){
			/*alert("hello");*/
			
			var lat = marker.position.lat();		//위도경도 얻어옴
			var lng = marker.position.lng();
			$("input#lat_").val(lat);				//hidden에 넣음
			$("input#lng_").val(lng);
			
			$.ajax({		//마커 부분 시, 동 으로 region에 저장 
				url: 'https://maps.googleapis.com/maps/api/geocode/json?latlng='+lat+','+lng+'&key=AIzaSyAcZEsXq59r_WkhHw_uyjJsbE_zJvOspz8'
				, method : "post"
				, dataType: "json"
				, success : function(resp){
					var region = resp.results[0].address_components[3].long_name+" "+resp.results[0].address_components[2].long_name;
					$("input#region_").val(region);
	 				
				}//success펑션
			});//ajax
			if(validCheck()){
				$("#form")[0].submit();
			}
		});
		
		
		$('#applyList').click(function(){
			var id=$('#sq_recruit_id').val();
			$.ajax({
				method:'post'
				,url:'AllRecruitApply'
				,data:{'sq_recruit.sq_recruit_id':id}
				,datatype:'json'
				,success:function(send){
					var list=send.sq_applied_list;
					var code2;
					var count=1;
					var code1="<table><tr><th>번호</th><th>지원자 이름</th><th>연락처</th><th>상세보기</th></tr>"+code2+"</table>"
					$.each(list,function(index,item){
						var file="";
						if(item.sq_port_file == ""){
							file='<figure class="person-image image"><img src="assets/img/person-01.jpg"></figure>'
						}else {
							file='<figure class="person-image image"><img src="assets/downloadIMG/port/'+item.sq_port_file+'"></figure>';
						}
						var detail="<tr rowspan='5' id=retail"+count+"><td colspan='4'><h3>"+item.sq_member_name+"</h3>"+item.file+"</td>email 주소 : "+item.sq_member_email+"<br/><hr/>"+item.sq_port_pr+"<hr/><span>"+item.sq_port_inst+"<span></tr>"
						code2+="<tr><input type='hidden' id='sq_member_id' value='"+item.sq_member_id+"'/><td>"+count+"</td><td>"+item.sq_member_name+"</td><td>"+item.sq_member_phone+"</td><td><a href='#' id='detail'></a></td></tr>"+detail;
					});
				}
			});
		});
		
		});
		
		
		
		function validCheck(){
			var title = $("input#title").val().length;
			var part = $("#part").val();
			var genre = $("#genre").val();
			var limitDate = $("input#limitDate").val().length;
			/*alert(title+" 1 "+part+" 2  "+genre+"  3  "+limitDate+"  4  ")*/
			if(title < 1){
				alert("제목을 입력해주세요 ");
				return false;
			}else if(part==null){
				alert("모집하고자 하는 파트 정보를 선택하세요");
				return false;
			}else if(genre==null){
				alert("모집하고자 하는 장르 정보를 선택하세요");
				return false;
			}else if(limitDate!=10){
				alert("날짜 형식은 YYYY/MM/DD입니다")
				return false;
			}
			return true;
		}