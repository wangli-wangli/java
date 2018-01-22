$(document).ready(function(){
	var time = $(".timer");
	var pause = $(".pause");
	var date = new Date();
	date.setHours(0);
	date.setMinutes(0);
	date.setSeconds(0);
	window.setInterval(function(){
		time.html(date.getMinutes().toString() + ":" + date.getSeconds().toString());
		time.attr("value",com(date.getMinutes().toString()) + ":" + com(date.getSeconds().toString()));
		date.setTime(date.getTime() + 1000);
	},1000)
	
	pause.click(function(){
		window.clearInterval();
	});
});

function com(s){
	if(s < 10)
		s = "0" + s;
	return s;
}
