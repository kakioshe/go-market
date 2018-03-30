$(document).on('turbolinks:load', function(){

  function livePreviewPicture(picture)
  {
    if (picture.files && picture.files[0]) {
      var picture_reader = new FileReader();
      picture_reader.onload = function(event) {
        $('#pic-uploaded').attr('src', event.target.result);
      };
      picture_reader.readAsDataURL(picture.files[0]);
    }
  }

  $('.cp-div-pic .cp-pic-button input').on('change', function () {
    $('#pic-uploaded').fadeIn();
    livePreviewPicture(this);
  });
});
