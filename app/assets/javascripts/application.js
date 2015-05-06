// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require forem
//= require_tree .

$(function(){

	var toggleSidebar = $("#togglesidebar");
	var primary = $("#primary");
	var secondary = $("#secondary");

	toggleSidebar.on("click", function(){

		if(primary.hasClass("col-sm-9 wrap")){
			primary.removeClass("col-sm-9 wrap");
			primary.addClass("col-sm-12");
			secondary.css('display', 'none');
		}
		else {
			primary.removeClass("col-sm-12");
			primary.addClass("col-sm-9 wrap");
			secondary.css('display', 'inline-block');
		}
	});

});

$(document).on('page:load', function(){

	var toggleSidebar = $("#togglesidebar");
	var primary = $("#primary");
	var secondary = $("#secondary");

	toggleSidebar.on("click", function(){

		if(primary.hasClass("col-sm-9 wrap")){
			primary.removeClass("col-sm-9 wrap");
			primary.addClass("col-sm-12");
			secondary.css('display', 'none');
		}
		else {
			primary.removeClass("col-sm-12");
			primary.addClass("col-sm-9 wrap");
			secondary.css('display', 'inline-block');
		}
	});

});