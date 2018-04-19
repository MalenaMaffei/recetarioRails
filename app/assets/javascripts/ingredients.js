$(document).on('turbolinks:load', function(){ // DOM ready

  // ::: TAGS BOX
  console.log('hola de ingredients');
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
      // console.log($('#hiddenInput').val());
    }


});
