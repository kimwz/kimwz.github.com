$(function() {
	$rota = $('div:visible');
	var degree = 0,timer;
	function rotate() { 
		$rota.css({"z-index":10000, transform: "scale(1.05) rotate(" + degree + "deg)"}); 
		timer = setTimeout(function() { 
			degree += 5;
			degree %= 360;
			rotate(); 
		},10); 
	} 
	rotate(); 
});
