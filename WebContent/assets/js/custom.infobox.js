function drawInfobox(infoboxContent, json, i){

	var str = json.data[i].buskingdate;
	var temp_buskingdate = str.substring(0,13);
	
	var str2 = json.data[i].description;
	if(str2.length > 30){
		var temp_description = str2.substring(0,40) + '...';
	}else{
		var temp_description = str2.substring(0,40);
	}
	
//	var kk = json.data[i].gallery;
//	alert(kk);
	
	
    if( json.data[i].teamname )     { var teamname = '<div class="price average-color"><span>' + json.data[i].teamname + '</span></div>' }
        else                        { teamname = '' }
    if(json.data[i].id)             { var id = json.data[i].id }
        else                        { id = '' }
    if(json.data[i].title)          { var title = json.data[i].title }
    	else                        { title = '' }
//    if(json.data[i].url)            { var url = json.data[i].url }
//        else                        { url = '' }
    if(json.data[i].genre)          { var genre = json.data[i].genre }
        else                        { genre = '' }
    if(json.data[i].location)       { var location = json.data[i].location }
        else                        { location = '' }
    if(json.data[i].gallery)     	{ var gallery = json.data[i].gallery }
        else                        { gallery = '' }
//    				alert(gallery);
    if(json.data[i].buskingdate)    { var buskingdate = temp_buskingdate }
		else                        { buskingdate = '' }
    if(json.data[i].runningtime)    { var runningtime = json.data[i].runningtime }
		else                        { runningtime = '' }
    if(json.data[i].description)    { var description = temp_description }
    	else                        { description = '' }
    if(json.data[i].sq_busking_id)    { var sq_busking_id = json.data[i].sq_busking_id }
    	else                        { sq_busking_id = '' }

    var ibContent = '';
    ibContent =
    '<div class="infobox">' +
        '<div class="left">' +
            '<a href="toDetailInformation.action?sq_busking_id='+sq_busking_id+'" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">' +
                '<div class="image">' +
                teamname +
                    '<img class="galleryWidth" src="assets/downloadIMG/busking/'+gallery+'">' +
                '</div>' +
                '<header class="average-color">' +
                    '<h1 class="animate move_from_top_short">'+ title +'</h1>' +
//                    '<h2 class="animate move_from_top_short"><span>'+ location +'</span></h2>' +
                '</header>' +
            '</a>' +
        '</div>' +
        '<div class="right">' +
            '<article class="animate move_from_top_short">' +
                '<h3>Description</h3>' +
                '<p>'+ temp_description +'</p>' +
            '</article>' +
            '<article class="animate move_from_top_short">' +
                '<h3>Information</h3>' +
                '<dl>' +
                    '<dt>장소</dt>' +
                    '<dd>'+ location +'</dd>' +
                    '<dt>장르</dt>' +
                    '<dd>'+ genre +'</dd>' +
                    '<dt>일시</dt>' +
                    '<dd>'+ temp_buskingdate + '시' + '</dd>' +
                    '<dt>공연시간</dt>' +
                    '<dd>'+ runningtime +'분</dd>' +
                '</dl>' +
            '</article>' +
        '</div>' +
    '</div>';

    return ibContent;
}