$(function() {
	$(".householditem").click(function() {
		$(this).toggleClass("selected");
		search();
	});
});

function search() {
	var query = [];
	$(".selected").each(function() {
		query.push($(this).attr("title"))
	});

	$.getJSON("/weapons/search/", { query: query.join(",") }, function(results) {
		$(".slides_container").empty();
		$.each(results, function() {
			$(".slides_container").append("<div><img class='weapon' src='/static/images/" + this.fields.image + "'</img></div>")
		});		
	
		$('#slides').slides({
			preload: true
		});
	});	
}