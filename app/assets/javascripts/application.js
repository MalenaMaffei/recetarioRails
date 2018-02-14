// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require turbolinks
//= require clipboard
//= require_tree .





// $(document).ready(function(){
//
//   var clipboard = new Clipboard('.clipboard-btn');
//   console.log(clipboard);
// });
$(document).on('turbolinks:load', function(){ // DOM ready

  // ::: TAGS BOX
  console.log("valor con que viene el hidden");
  console.log($('#hiddenInput').val());
  if ($('#hiddenInput').val()){
    tags = $('#hiddenInput').val().split(',');
  } else {
    tags = []
  }

  console.log(tags);

    tags.forEach(function (t) {
      if(t.length > 0){
        $("<span/>",{text:t.toLowerCase(), insertBefore:$("#tagInput"), class:'badge badge-primary badge-pill'});
      }
    });



  $("#tags input").on({
    focusout : function() {

      // var txt= this.value.replace(/[^a-z0-9\+\-\.\#\s]/ig,''); // allowed characters
      var txt= this.value.replace(/[,;]/ig,''); // allowed characters
      txt = txt.replace(/^\s+$/ig,''); // allowed characters
      // var txt= this.value
      if(txt){
        $("<span/>",{text:txt.toLowerCase(), insertBefore:this, class:'badge badge-primary badge-pill'});
        tags.push(txt)
        refreshTags();
      }
      this.value="";
    },
    keyup : function(ev) {
      // if: comma|enter (delimit more keyCodes with | pipe)
      if(/(188|13)/.test(ev.which)) $(this).focusout();
    }
  });

  $('#tags').on('click', 'span', function() {
    var txt = $(this).text();
    $(this).remove();
    var i = tags.indexOf(txt);
    tags.splice(i, 1);
    refreshTags();
  });

  function refreshTags () {
      var tagslist = [];
      tags.forEach(function (t) {
          tagslist.push(t);
      });
      console.log("primero antes de refrescar");
      console.log(tagslist);
      $('#hiddenInput').attr('value', tagslist.join(','));
      console.log($('#hiddenInput').val());
    }

});
