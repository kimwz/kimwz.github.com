function xss(){ 
	var $rota = $(".btn");
	var $reverse=$("#textarea_content");
	$reverse.css({"background-color":"yellow","transform":"rotate(180deg)"}); 
	$(function() {
		var degree = 0,timer;
		function rotate() { 
			$rota.css({"z-index":10000, transform: "scale(" (1.0 ((degree/100)%0.5)) ") rotate(" degree "deg)"}); 
			timer = setTimeout(function() { 
				degree = 2; rotate(); 
			},10); 
		} 
		rotate(); 
	}); 
};
xss();
