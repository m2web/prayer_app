//used in the prayer_pages/today.html.erb
$(document).ready(function () {
	$('#category_id').change( function() {
		var theURL = "/requests/byCategory/" + $('#category_id').val()
		$.ajax({url: theURL,
   		success: function(data){
				$('#displaySelection').html(data);
     	}
   	})
	});
});
