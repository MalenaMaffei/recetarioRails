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
$(document).on('turbolinks:load', function(){ // DOM ready

  // ::: TAGS BOX
  console.log("valor con que viene el hidden");
  console.log($('#hiddenInput').val());
  if ($('#hiddenInput').val()){
    tags = $('#hiddenInput').val().split(',');
  } else {
    tags = []
  }

  // console.log(tags);

    tags.forEach(function (t) {
      if(t.length > 0){
        $("<span/>",{text:t.toLowerCase(), insertBefore:$("#tagInput"), class:'badge badge-primary badge-pill'});
      }
    });



  $("#tags input").on({
    focusout : function() {

      // var txt= this.value.replace(/[^a-z0-9\+\-\.\#\s]/ig,''); // allowed characters
      var txt= this.value.replace(/[,;]/ig,''); // allowed characters
      txt = txt.replace(/^\s+|\s+$/g,''); // allowed characters
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
      // console.log("primero antes de refrescar");
      // console.log(tagslist);
      $('#hiddenInput').attr('value', tagslist.join(','));
      console.log($('#hiddenInput').val());
    }




//  ***********************INSTRUCCIONES***********************


  console.log("valor con que viene el hidden");
  console.log($('#instrHidden').val());
  if ($('#instrHidden').val()){
    instrs = $('#instrHidden').val().split('</p><p>');
  } else {
    instrs = []
  }


  for (var i=0; i < instrs.length; i++) {
    instrs[i] = instrs[i].replace(/<p>|<\/p>/ig,'');
  }
  console.log(instrs);

  for (var i=0; i < instrs.length; i++) {
    t = instrs[i];
    if(t.length > 0){
      $("<div/>",{text:t, insertBefore:$("#instrInput"), class:'card bg-light card-body my-2', id: i}).attr("contentEditable", true);
    }
  }



$("#instr textarea").on({
  focusout : function() {

    // var txt= this.value.replace(/[^a-z0-9\+\-\.\#\s]/ig,''); // allowed characters
    // var txt= this.value.replace(/[,;]/ig,''); // allowed characters
    // txt = txt.replace(/^\s+$/ig,''); // allowed characters
    var txt = this.value.replace(/^\s+|\s+$/g,''); // allowed characters
    // var txt= this.value
    if(txt){
      let id = instrs.length
      $("<div/>",{text:txt, insertBefore:this, class:'card bg-light card-body my-2', id: id}).attr("contentEditable", true);
      instrs.push(txt)
      refreshInstr();
    }
    // refreshInstr();
    this.value="";
  },
  keyup : function(ev) {
    // if: comma|enter (delimit more keyCodes with | pipe)
    console.log(ev.which);
    if(/(13)/.test(ev.which)) $(this).focusout();
  }
});



// todo esto no sirve, necesito orden
$('#instr div').on('focusout', function() {
  // console.log(this.textContent);
  let id = $(this).attr('id')
  console.log(id);
  let str = this.textContent
  str = str.replace(/^\s+|\s+$/g,''); // allowed characters
  if (str == instrs[id]){
    return;
  }
  if(str){
    instrs[id] = str
    // refreshInstr();
  } else {
      // $(this).remove();
      instrs[id] = ''
      // var i = instrs.indexOf(txt);
      // instrs.splice(i, 1);
      // refreshInstr();
  }
  refreshInstr();
});









//
//   {
//   blur: function() {
//     console.log(this);
//     let str= this.text.replace(/[,;]/ig,''); // allowed characters
//     str = str.replace(/^\s+|\s+$/g,''); // allowed characters
//     if(str){
//       instrs.push(str)
//       refreshInstr();
//     }
//   }
// });

// $('#instr').on('click', 'span', function() {
//   var txt = $(this).text();
//   $(this).remove();
//   var i = instrs.indexOf(txt);
//   instrs.splice(i, 1);
//   refreshInstr();
// });

function refreshInstr () {
    var tagslist = [];
    instrs.forEach(function (t) {
        tagslist.push(t);
    });
    console.log("primero antes de refrescar");
    console.log(tagslist);
    $('#instrHidden').attr('value', '<p>' + tagslist.filter(Boolean).join('</p><p>') + '</p>');
    console.log($('#instrHidden').val());
  }


});
