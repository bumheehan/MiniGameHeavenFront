/**
 * 
 */
        $('#th_checkAll').on("click",function(){
		if($(this).is(":checked")){
			$('.checkRow').prop("checked", true);
		}else{
			$('.checkRow').prop("checked", false);
		}
	})
	function sdel(){
		for(var i =0 ; i<$('.checkRow').length;i++){
			if($('.checkRow').eq(i).is(":checked")){
				let seq = $('.checkRow').eq(i).val();
				$.ajax({
						url:"remove",
						method:"POST",
						data:{
							seq:seq
						},
						dataType:"html"
				});
			}
		}
		location.href="list";
	}
  