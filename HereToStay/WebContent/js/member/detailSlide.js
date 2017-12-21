
  $(function roomslide(){
	
	  $(document).on('click',".cat-list-item-l > b",function(){
			var $romView = $(".room_detail");
			var viewport = $(this).parent().parent().find(".bx-viewport");
			var bxslider2 = $(this).parent().parent().find(".bxslider2").children();
			var slidecon = $(this).parent().parent().parent().find(".bx-controls-direction").removeClass().addClass("bx-controls-direction2");
	        var slidewrap = $(this).parent().parent().parent().find(".bx-wrapper");
	         
	        slidewrap.removeClass().addClass("bx-wrapper2");
	        slidecon.find(".bx-next").removeClass().addClass("bx-next2");
	        slidecon.find(".bx-prev").removeClass().addClass("bx-prev2");
			bxslider2.css("width","100%");  
			viewport.css("height","420");
			$(this).parent().parent().find($romView).slideDown();
			
	  	});
	  
	  $(document).on('click','.room_detail > p',function(){
		 $(this).parent().slideUp(); 
	  });
  });
  
  $(function opCheck(){

	  $(document).on('click','.room-icons',function(){
		  var optcheck=$(this).parent().find(".opt");
		  optcheck.toggle("slow");
	
	  });
	  
  })
  
  $(function listMore(){
	 var idx = 6;
		$('.cat-list-item:gt(2)').css("display","none");		
		
		$(document).on('click','.availabe-more',function(){
			for(var i=0; i < idx; i++){ 
				$('.cat-list-item').eq(i).slideDown("slow");
			}
			idx = idx+3;

		});
	

  });
  $(function(){
	  $('.bxslider2').bxSlider({
	    mode: 'fade',
	    captions: false,
	    slideWidth: 600
	  });
	});

  
