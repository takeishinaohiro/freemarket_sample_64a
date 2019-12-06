$(function() {
  let images = [];
  let num = 0;

  function buildHTML(imgSrc) {
    let html = `<div class="preview-box">
                  <div class="preview-box__img-box">
                    <img src="${imgSrc}">
                  </div>
                  <div class="preview-box__select">
                    <div class="preview-box__select--edit">
                      <p>編集</p>
                    </div>
                    <div class="preview-box__select--delete">
                      <p>削除</p>
                    </div>
                  </div>
                </div>`
    $('.drop-zone').prepend(html);
  }

  $('#sell-img').change(function() {
    // num += 1
    // $(this).attr('name', `image${num}`);
    // images.push($(this).val());
    // console.log(images);
    // console.log($('#sell-img').val());
  });
  $('.sell-box__img--input').on('drop', function(e) {
    e.preventDefault();
    e.stopPropagation();
    let dropImages = e.originalEvent.dataTransfer.files;
    const reader = new FileReader();
    reader.onload = function() {
      console.log(reader.result);

      let imgSrc = reader.result;
      buildHTML(imgSrc);
    };
    reader.readAsDataURL(dropImages[0]);

    $.each(dropImages, function(index, dropImage){
      // console.log(dropImage);
      images.push(dropImage.name);
    });
  });

  $(document).on('drop', function(e) {
    e.stopPropagation();
    e.preventDefault();
  });
  $(document).on('dragenter', function(e) {
    e.stopPropagation();
    e.preventDefault();
  });
  $(document).on('dragover', function(e) {
    e.stopPropagation();
    e.preventDefault();
  });


  $('.preview-box__select--delete').children('p').on('click', )(function() {
    $(this).closest('.preview-box').remove();
  });



});