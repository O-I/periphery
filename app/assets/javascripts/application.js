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
//= require angular
//= require_tree .

/* Links working on card flip thanks to Deryck and mayabelle
   See this Stack Overflow question I asked for more:
   http://stackoverflow.com/questions/20862733/css-card-flip-animation-for-webkit-browsers-prevents-links-from-functioning
 */

$(function(){ $(document).foundation(); });

$('.flip').on('click', function(){
  $(this).find('.card').addClass('flipped').mouseleave(function(){
    $(this).removeClass('flipped');
  });
  return false;
});

$('a').on('click', function(evt){
  // var e = evt || window.event;
  // var clickedOn = (e.currentTarget) ? e.currentTarget : e.srcElement;
  evt.stopPropagation();
  //window.location.href = clickedOn.href;
});

// $('.back').find('a').attr('target', '_blank');

// The below ensures all external links open in a new window
// See more here: http://stackoverflow.com/questions/12041935/how-to-automatically-add-target-blank-to-external-links-only

$.expr[':'].external = function(obj){
    return !obj.href.match(/^mailto\:/)
           && (obj.hostname != location.hostname)
           && !obj.href.match(/^javascript\:/)
           && !obj.href.match(/^$/)
};

$('a:external').attr('target', '_blank');
