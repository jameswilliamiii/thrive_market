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
//= require foundation
//= require jquery.cookie
//= require_tree .

$(function(){ $(document).foundation();
  // Smooth scroll
  // Close mobile menu first
  $('nav a.smooth').click(function(){
    $('#nav').addClass("fixed");
    $('nav').removeClass("expanded");
  });
  // Start smooth scroll
  $('a.smooth').click(function(){
      $('html, body').animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top - 65
      }, 500);
      return false;
  });


  // Set cookie for survey
  var cookie = $.cookie('survey_seen');
  if (cookie == null){
    $('#myModal').foundation('reveal', 'open');
    $.cookie('survey_seen', 'true', { expires: 1 });
  }

});
