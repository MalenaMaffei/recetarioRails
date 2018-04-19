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
  instrs = $('#instrHidden').val().split('</li><li>');
} else {
  instrs = []
}

  $('#instr').sortable({
        // tolerance: 'pointer',
        // revert: 'invalid',
        placeholder: 'card placeholder',
        handle: 'i',
        cancel: '',
        update: function( event, ui) {
          var newinstr = [];
          $('.instruction').each(function(index ) {
              console.log('index: ' + index);
              console.log('div-index: ' + $(this).attr('id'));
              $(this).attr('id', index);
              newinstr.push($(this).text());
              // index++;
              // $(this).text(index );
          })
          // console.log('new array: ');
          // console.log(newinstr);
          console.log(newinstr);
          instrs = newinstr;
          refreshInstr();
        }
        // forceHelperSize: true
    }).enableSelection();






  for (var i=0; i < instrs.length; i++) {
    instrs[i] = instrs[i].replace(/<li>|<\/li>/ig,'');
  }
  console.log(instrs);

  for (var i=0; i < instrs.length; i++) {
    t = instrs[i];
    if(t.length > 0){
      $("<div/>",{text:t, insertBefore:$("#instrInput"), class:'card border-secondary card-body my-2 instruction', id: i, html: "<i class='fa fa-bars text-primary ml-auto'></i>"+t}).attr("contentEditable", true);
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
      var id = instrs.length
      $("<div/>",{text:txt, insertBefore:this, class:'card border-secondary card-body my-2 instruction', id: id, html: "<i class='fa fa-bars text-primary  ml-auto'></i>"+txt}).attr("contentEditable", true);
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
  },
});




$('#instr').on('focusout','div', function() {
          console.log("entra focusout");
          console.log(this.textContent);
          var id = $(this).attr('id')
          console.log(id);
          var str = this.textContent
          str = str.replace(/^\s+|\s+$/g,''); // allowed characters
          if (str == instrs[id]){
            $('#instr textarea').focus();
            return;
          }
          if(str){
            instrs[id] = str
          } else {
              instrs[id] = ''
          }
          refreshInstr();
          console.log('a punto de focus');
          $('#instr textarea').focus();
      }
);


$('#instr').on('keydown','div', function(ev) {
  // if: comma|enter (delimit more keyCodes with | pipe)
  console.log(ev.which);

  if(/(8)/.test(ev.which)){
      var txt = $(this).text();
      var id = $(this).attr('id')
      if(!txt){
        instrs[id] = ''
        $(this).remove();
        // var i = instrs.indexOf(txt);
        // instrs.splice(i, 1);
        refreshInstr();
      }

  }

  if(/(13)/.test(ev.which)) {
    $(this).focusout();
  }
}

);





function refreshInstr () {
    var tagslist = [];
    instrs.forEach(function (t) {
        tagslist.push(t);
    });
    console.log("primero antes de refrescar");
    console.log(tagslist);
    $('#instrHidden').attr('value', '<li>' + tagslist.filter(Boolean).join('</li><li>') + '</li>');
    console.log($('#instrHidden').val());
}

});
