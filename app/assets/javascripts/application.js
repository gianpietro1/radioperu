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
//= require soundmanager2/soundmanager2-nodebug-jsmin
//= require_tree .

window.PA = window.PA || {};

PA.common = {
 init: function() {
   $('html').removeClass('no-js');
 }
};

UTIL = {
 exec: function( feature ) {
   var ns = PA,
     method = 'init';

   if ( feature !== "" && ns[feature] && typeof ns[feature][method] == 'function' ) {
     ns[feature][method]();
   }
 },

 init: function() {
   var features = document.body.getAttribute('data-features').split(' ');
   if (features) {
     for(var i = 0; i < features.length; i++) {
       UTIL.exec(features[i]);
     };
   } 

   UTIL.exec('common');

   $(document).trigger('finalized');
 }
};

$(document).ready( UTIL.init );