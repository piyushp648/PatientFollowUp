//popovers
$(document).ready(function () {
    $('[data-toggle="popover"]').popover();
    $("[data-toggle=popover]").popover({ html: true });
    $("[data-toggle=popover]").css("color","black");
});

function opennav() {
    document.getElementById("aside-nav").style.width= "250px";
    document.getElementsByClassName("slide")[0].style.marginLeft = "250px";
    document.getElementById("main").style.marginLeft = "250px";
   // document.getElementById("top-nav").style.marginLeft = "250px";
    document.getElementsByClassName("span-adjust")[0].style.marginRight = "0";
    
}

function closenav() {
    document.getElementById("aside-nav").style.width = "0";
    document.getElementsByClassName("slide")[0].style.marginLeft = "0";
    document.getElementById("main").style.marginLeft = "0";
    document.getElementsByClassName("span-adjust")[0].style.marginRight = "30px";
    //document.getElementsByClassName("navbar-wooden")[0].style.marginRight = "0";
}



function dropdowntoggle() {
    var dropdownContent = document.getElementById("links");
    var sign = document.getElementById("fa-caret");
        if(dropdownContent.style.display === "block") {
        dropdownContent.style.display = "none";
        sign.className = 'fa fa-caret-down';
    }else{
        dropdownContent.style.display = "block";
        sign.className = 'fa fa-caret-left';
    }
}



