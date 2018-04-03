$(document).on('turbolinks:load', function(){

  function livePreviewPicture(picture)
  {
    if (picture.files && picture.files[0]) {
      var picture_reader = new FileReader();
      picture_reader.onload = function(event) {
        $(picture).closest('.cp-div-pic').find('#pic-uploaded').css('display', 'block');
        $(picture).closest('.cp-div-pic').find('#pic-uploaded').attr('src', event.target.result);
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
    var index=$(this).index();
    var targetedsrc = $("img", this).prop("src");
    $('#pd-clicked-image').attr('src', targetedsrc);
    event.preventDefault();
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
});
