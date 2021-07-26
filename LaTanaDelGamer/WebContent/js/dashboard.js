/**
 
 */
const bottone=document.getElementsByClassName("top")[0].firstElementChild;
bottone.addEventListener('click', function(){
	const sidebar=document.getElementsByClassName("sidebar")[0]
	const contenuto=document.getElementsByClassName("contenuto")[0]
	sidebar.classList.toogle("collapse")
	contenuto.classList,toggle("full-width")
})

