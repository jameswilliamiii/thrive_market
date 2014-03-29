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

  // Sticky footer
  $(window).bind("load", function () {
      var footer = $("#footer");
      var pos = footer.position();
      var height = $(window).height();
      height = height - pos.top;
      height = height - footer.height();
      if (height > 0) {
          footer.css({
              'margin-top': height + 'px'
          });
      }
  });

  // Start smooth scroll
  $('a.smooth').click(function(){
      $('html, body').animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top - 65
      }, 500);
      return false;
  });

  $(window).on("load", function () {
      var urlHash = window.location.href.split("#")[1];
      $('html,body').animate({
          scrollTop: $('#' + urlHash).offset().top - 65
      }, 20);
  });


  // Set cookie for survey
  var cookie = $.cookie('survey_seen');
  if (cookie == null){
    $('#myModal').foundation('reveal', 'open');
    $.cookie('survey_seen', 'true', { expires: 1 });
  }

  // Character Count
  var limitnum = 140; // set your int limit for max number of characters
  function limits(obj, limit) {
    var cnt = $("#counter > span");
    var txt = $(obj).val();
    var len = txt.length;
    // check if the current length is over the limit
    if(len > limit){
      $(obj).val(txt.substr(0,limit));
      $(cnt).html(len-1 + ' characters');
    }
    else {
      $(cnt).html(len + ' characters');
    }
    // check if user has less than 20 chars left
    if(limit-len <= 20) {
      $(cnt).addClass("alert");
    }
  }
  $('textarea#update').keyup(function(){
    limits($(this), limitnum);
  });

});