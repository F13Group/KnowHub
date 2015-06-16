<html>
<head>
<style>
img {
	height: 100px;
	float: left;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
	<h2>Hello World! WEBAPP</h2>
	
	
	
</body>
</html>

<script>
	$(document).ready(function() {
		var url = window.location.href.toString() + "category";
		
		$.getJSON(url, function(data) {
			var items = [];
			$.each(data, function(index, value) {				
				items.push('<li>' + value.id + "- " + value.value + "- " + value.postId + '</li>');
			});
			$('<ul/>', {			
				'class': 'my-new-list',
				 html: items.join('')
				 }).appendTo('body');
		});		

	});
</script>