/**
 * 
 */

function openMenu(){
	document.getElementById("sidebar").style.marginLeft ="0";
	document.getElementById("contenuto").style.marginLeft ="200px";
	document.getElementById("menu").style.marginLeft ="200px";

}

function closeMenu(){
	document.getElementById("sidebar").style.marginLeft ="-200px";
	document.getElementById("contenuto").style.marginLeft ="0";
	document.getElementById("menu").style.marginLeft ="0px";
}