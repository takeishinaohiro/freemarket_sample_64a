$(function() {
  let images = [];

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
  };

  // 画像のドロップ時、ドロップした画像の数だけプレビューを追加する
  $('.sell-box__img--input').on('drop', function(e) {
    e.preventDefault();
    e.stopPropagation();
    let dropImages = e.originalEvent.dataTransfer.files;
      for(var i = 0; i < dropImages.length; i++ ) {
        var imgSrc = URL.createObjectURL(dropImages[i]);
        buildHTML(imgSrc);
        images.push(dropImages[i].name);
        console.log(images);
      }
  });

  // ドロップゾーン以外でドロップできないようにする
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



  // 削除ボタンクリック時、プレビューを削除する
  $(document).on('click', '.preview-box__select--delete p', function(){
    $(this).closest('.preview-box').remove();
  });



});