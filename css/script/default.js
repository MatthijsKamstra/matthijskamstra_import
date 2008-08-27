/**
* <script type="text/javascript" src="script/default.js"></script>
*/


/**
* popupscript with default size (780 x 550) with no scrollbars, resizable, no toolbar, no locationurl
* 
* @usage	<a href="#" onclick="popup('fullscreen.html','fullscreen',500,500)">popup</a>
* @param	url	the url you want to popup
*/
function popup(thefile,windownaam,breedte,hoogte){
	window.open(thefile,windownaam,'width='+breedte+',height='+hoogte);
}

/*
* use this script in the page you want to popup
<script type='text/javascript'>
     <!--
     function onloadpage(){
     	self.resizeTo(screen.width,screen.height);
     }
     window.onload = onloadpage;
     //-->
</script>


or

<a href="#" onclick="openFullScreen('fullscreen.html')">fullscreen.html</a> | 

*
*/
function openFullScreen(targetURL){
	B = screen.availWidth;
	H = screen.availHeight;
	window.open(targetURL,"","toolbar=0, scrollbars=0, statusbar=0, menubar=0, resizable=0, width="+B+", height="+H+", left=0, top=0");
	/*   
	window.open(targetURL,"Full Screen Video","height ="+screen.height+", width ="+screen.width+", scrollbars=no");    
	window.open(targetURL,"Full Screen Video","height=768, width=1024, scrollbars=no"); 
	
	window.open(targetURL,"Full Screen Video","height ="+strHeight+", width ="+strWidth+", scrollbars=no");   
	*/ 
}


/**
* popupscript with default size (780 x 550) with no scrollbars, resizable, no toolbar, no locationurl
* 
* @usage	<a href="#" onclick="Popup('fullscreen.html')">Popup</a>
* @param	url	the url you want to popup
*/
function Popup(url) {
	window.open(url,'name','width=780,height=550,scrollbars=no,resizable=yes,toolbar=no,location=no');
}


function Mailto(subject , body){
	document.location.href="mailto:?subject="+subject+"&body="+body+" ";
}