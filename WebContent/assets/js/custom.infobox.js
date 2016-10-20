function drawInfobox(infoboxContent, json, i){

    if( json.data[i].SQ_BUSKING_ID )        { var SQ_BUSKING_ID = '<div class="price average-color"><span>' + json.data[i].SQ_BUSKING_ID + '</span></div>' }
        else                        { SQ_BUSKING_ID = '' }
    if(json.data[i].SQ_MEMBER_ID)             { var SQ_MEMBER_ID = json.data[i].SQ_MEMBER_ID }
	        else                        { SQ_MEMBER_ID = '' }                                              
	    if(json.data[i].url)            { var url = json.data[i].url }                          
	        else                        { url = '' }                                            
	    if(json.data[i].type)           { var type = json.data[i].type }                        
	        else                        { type = '' }                                           
	    if(json.data[i].SQ_BUSKING_GENRE)          { var SQ_BUSKING_GENRE = json.data[i].SQ_BUSKING_GENRE } 
	        else                        { SQ_BUSKING_GENRE = '' }                                          
    if(json.data[i].SQ_BUSKING_RUNNINGTIME)       { var SQ_BUSKING_RUNNINGTIME = json.data[i].SQ_BUSKING_RUNNINGTIME }
        else                        { SQ_BUSKING_RUNNINGTIME = '' }                                        	
    if(json.data[i].gallery[0])     { var gallery = json.data[i].gallery[0] }                	
        else                        { gallery[0] = '../img/default-item.jpg' }               	
                                                                                             	
    var ibContent = '';
    ibContent =
    '<div class="infobox">' +
        '<div class="left">' +
            '<a href="'+ 
            
            "assets/pages/items/1_e.html" +
            
            '" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">' +
                '<div class="image">' +
                SQ_BUSKING_ID +
                    '<img src="'+ "assets/img/items/2.jpg" +'" alt="">' +
                '</div>' +
                '<header class="average-color">' +
                    '<h1 class="animate move_from_top_short">'+ SQ_BUSKING_GENRE +'</h1>' +
                    '<h2 class="animate move_from_top_short"><span>'+ SQ_BUSKING_RUNNINGTIME +'</span></h2>' +
                '</header>' +
            '</a>' +
        '</div>' +
        '<div class="right">' +
            '<article class="animate move_from_top_short">' +
                '<h3>Description</h3>' +
                '<p>Curabitur odio nibh, luctus non pulvinar a, ultricies ac diam. Donec neque massa, viverra interdum eros ut, imperdiet </p>' +
            '</article>' +
            '<article class="animate move_from_top_short">' +
                '<h3>Overview</h3>' +
                '<dl>' +
                    '<dt>Bathrooms</dt>' +
                    '<dd>1</dd>' +
                    '<dt>Bedrooms</dt>' +
                    '<dd>2</dd>' +
                    '<dt>Area</dt>' +
                    '<dd>165m<sup>2</sup></dd>' +
                    '<dt>Garages</dt>' +
                    '<dd>1</dd>' +
                '</dl>' +
            '</article>' +
        '</div>' +
    '</div>';

    return ibContent;
}