$(document).ready(function () {

    var $list = $("#crdbox02 #cardmenu01").hide(),
    $content;

    $(" .button#Beverage ")
    .on("click" , function (){
        var $this = $(this);
        $this.addClass("active").siblings().removeClass("active");
        $content = $list.filter("." + this.id).hide();
        $content.slice(0,4).show(400);
        $list.not($content).hide(300);
    })
    .filter(".active")
    .click();

 




    $(".button#veg ")
    .on("click" , function (){
        var $this = $(this);
        $this.addClass("active").siblings().removeClass("active");
        $content = $list.filter("." + this.id).hide();
        $content.slice(0,4).show(400);
        $list.not($content).hide(300);
    })
    .filter(".active")
    .click();
    


    $(".button#ital ")
    .on("click" , function (){
        var $this = $(this);
        $this.addClass("active").siblings().removeClass("active");
        $content = $list.filter("." + this.id).hide();
        $content.slice(0,4).show(400);
        $list.not($content).hide(300);
    })
    .filter(".active")
    .click();
    
    
    $(" .button#snack ")
    .on("click" , function (){
        var $this = $(this);
        $this.addClass("active").siblings().removeClass("active");
        $content = $list.filter("." + this.id).hide();
        $content.slice(0,4).show(400);
        $list.not($content).hide(300);
    })
    .filter(".active")
    .click();



    $("#loadmore").on("click",function(){
        $content.filter(":hidden").slice(0.4).slideDown("slow");
    });


});

<%@ page import="java.util.*" %>
<%
    String email = request.getParameter("id");
    if (email != null) {
        // Email is available, use it as needed
    } else {
        // Email is not available, handle the case appropriately
    }
%>
//fix the bugs here