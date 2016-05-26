// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.turbolinks
//= require cocoon
//= require turbolinks
//= require bootstrap
//= require social-share-button
//= require soundmanager2/soundmanager2-nodebug-jsmin
//= require_tree .

$(document).ready(function(){

  $(".js-comments").on("click",".reply",function() {
  var comment_id = $(this).attr('id').replace(/reply-/i, "");
  $("#reply-field-"+comment_id).show();
  $("#reply-body-"+comment_id).focus();
  });

  $(".js-comments").on("click",".submit",function() {
  
  var parent_id = $(this).attr('id').replace(/submit-/i, "");
  var body = $("#reply-body-"+parent_id).val();
  
  $.ajax(
  {data: { parent_id: parent_id, body: body }, type: 'post', url: "/create_reply",
  success: function(r) { 
  $('.js-comments').html(r);
  } 
  }
  );

  });


});