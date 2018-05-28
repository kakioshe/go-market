$(document).on('turbolinks:load', function(){

  function livePreviewPicture(picture)
  {
    if (picture.files && picture.files[0]) {
      var picture_reader = new FileReader();
      picture_reader.onload = function(event) {
        $(picture).closest('.cp-div-pic').find('#pic-uploaded').css('display', 'block');
        $(picture).closest('.cp-div-pic').find('#pic-uploaded').attr('src', event.target.result);
        console.log(event.target.result);
        $(picture).closest('.cp-div-pic').find('#pic-uploaded').removeAttr('id');
        $(picture).closest('.cp-div-pic').find('.cp-choose-pic').html('Remove');

      };
      picture_reader.readAsDataURL(picture.files[0]);
    }
  }

  $('.cp-div-pic .cp-pic-button input').on('change', function () {
    $('#pic-uploaded').fadeIn();
    livePreviewPicture(this);
  });

  $('.cobacoba').click( function() {
    alert( $('#pic-uploaded').attr('src') );
  });

  $('.pd-image-small').click( function (){
    event.preventDefault();
    var index=$(this).index();
    var targetedsrc = $("img", this).prop("src");
    $('#pd-clicked-image').attr('src', targetedsrc);
    if ($('#pd-clicked-image').get(0).nodeName == 'CANVAS') {
      document
      .querySelector('#pd-clicked-image')
      .removeAttribute('data-caman-id');
      Caman("#pd-clicked-image", targetedsrc, function() {
        this.render();
      });

    }
  });

  $('.cp-div-remove').click( function (){
    var url = $(this).closest('.cp-div-remove').find('img').attr('src');

    $(this).closest('.cp-div-remove').find('img').attr('class', 'cp-miss-pic' );
    $(this).closest('.cp-div-remove').find('.cp-choose-pic').html('Choose your picture');
    $(this).closest('.cp-div-remove').find('.cp-picture-field').attr('style','display:block');
    $(this).closest('.cp-div-remove').find('img').attr('id','pic-uploaded');
    $(this).closest('.cp-div-remove').find('img').attr('class','cp-pic-uploaded cp-miss-pic');
    $(this).closest('.cp-div-remove').find('img').attr('src','#');

  });

  var $reset = $('#resetbtn');

  $reset.on('click', function(e) {
    $('input[type=range]').val(0);
    Caman('#pd-clicked-image', function() {
     this.revert(false);
     this.render();
    });
  });


});

 $(document).on('change', 'input[type=range]', function() {
   var bright = parseInt($('#bright').val());
   var contr = parseInt($('#contrast').val());
   var satr = parseInt($('#satr').val());
   var exp = parseInt($('#expos').val());
   Caman("#pd-clicked-image", function () {
     this.revert(false);
     this.brightness(bright);
     this.contrast(contr);
     this.saturation(satr);
     this.exposure(exp);
     this.render();
   });

 });
